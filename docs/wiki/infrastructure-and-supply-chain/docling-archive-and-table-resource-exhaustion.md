---
type: "Topic"
title: "Docling Archive And Table Resource Exhaustion"
description: "Security analysis for CVE-2026-105747 and CVE-2026-105749 Docling memory and CPU exhaustion during document conversion."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# Docling Archive And Table Resource Exhaustion

## Current Understanding

The [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) records [CVE-2026-105747](https://nvd.nist.gov/vuln/detail/CVE-2026-105747) and [CVE-2026-105749](https://nvd.nist.gov/vuln/detail/CVE-2026-105749) for Docling resource exhaustion. Broad Docling context belongs upstream; this page owns conversion-worker availability for untrusted documents.

CVE-2026-105747 covers METS-GBS detection and backend handling that call `tarfile.TarFile.getmembers()` before enforcing `max_member_count`, allocating member lists before limits stop processing. CVE-2026-105749 covers HTML, JATS, OpenDocument spreadsheet, and BoxNote backends accepting unbounded `rowspan` and `colspan`, then looping or allocating table grids proportional to declared spans.

## Security Impact

- Threat: small crafted documents can consume memory or CPU during conversion before ordinary document limits interrupt processing.
- Affected boundary: Docling 2.45.0 until 2.131.0 for METS-GBS archive member-count exhaustion; Docling 2.0.0 until 2.131.0 for table span exhaustion.
- Exploit or incident status: public NVD records; no local exploitation incident is recorded.
- Mitigation state: update to Docling 2.131.0 or later, enforce archive/table limits before allocation, and isolate conversion workers with memory and CPU budgets.
- Confidence: high for affected versions and fixed release from NVD.
- Residual risk: document conversion often runs in shared ingestion queues, so one crafted source can degrade RAG or agent-document workflows.

## Authoritative Sources

- [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json)
- [NVD CVE-2026-105747](https://nvd.nist.gov/vuln/detail/CVE-2026-105747)
- [NVD CVE-2026-105749](https://nvd.nist.gov/vuln/detail/CVE-2026-105749)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [Spring AI PDF Document Reader recursion DoS](spring-ai-pdf-document-reader-recursion-dos.md)

## Open Questions

- Which Docling conversion queues process untrusted archives or table-heavy formats without per-job resource budgets?

## Maintenance Notes

- Created on 2026-10-06 from the [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) after verifier correction split the Docling cluster by independent boundary.
