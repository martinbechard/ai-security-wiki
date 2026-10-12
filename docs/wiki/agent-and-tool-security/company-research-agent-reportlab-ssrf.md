---
type: "Topic"
title: "Company Research Agent ReportLab SSRF"
description: "Security analysis for CVE-2026-108850 Company Research Agent PDF-generation SSRF through ReportLab paragraph markup."
tags: ["agent-and-tool-security"]
---

# Company Research Agent ReportLab SSRF

## Current Understanding

The [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json) records [CVE-2026-108850](https://nvd.nist.gov/vuln/detail/CVE-2026-108850) for Company Research Agent through 2.2.0. Broad research-agent product context belongs upstream if needed; this page owns the document-generation SSRF boundary.

The NVD evidence says `/generate-pdf` fails to escape ReportLab paragraph markup in `report_content`. Unauthenticated attackers can embed inline image tags that make the server fetch internal or external hosts, leak image responses in returned PDFs, and probe reachability.

## Security Impact

- Threat: report content can become server-side network fetches during PDF rendering.
- Affected boundary: Company Research Agent through 2.2.0, `/generate-pdf`, ReportLab paragraph markup, inline image fetching, internal and external network reachability, and returned PDF content.
- Exploit or incident status: public NVD and CVE Services records; no confirmed exploitation incident is recorded locally.
- Mitigation state: escape or disable ReportLab markup from untrusted report content, deny network-backed image fetches, and enforce SSRF destination controls.
- Confidence: high for affected range and renderer behavior from NVD evidence.
- Residual risk: agent report-generation pipelines need renderer-specific markup controls because model or user content can become network I/O.

## Authoritative Sources

- [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json)
- [NVD CVE-2026-108850](https://nvd.nist.gov/vuln/detail/CVE-2026-108850)
- [CVE-2026-108850 record](https://cveawg.mitre.org/api/cve/CVE-2026-108850)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Docling remote fetch DNS rebinding](docling-remote-fetch-dns-rebinding.md)
- [Docling remote image credential forwarding](../data-and-privacy/docling-remote-image-credential-forwarding.md)
- [agent network egress controls](agent-network-egress-controls.md)

## Open Questions

- Which Company Research Agent release disables untrusted ReportLab network-fetch markup?

## Maintenance Notes

- Created on 2026-10-12 from the [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json).
