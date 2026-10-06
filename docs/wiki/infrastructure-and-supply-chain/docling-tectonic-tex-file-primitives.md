---
type: "Topic"
title: "Docling Tectonic TeX File Primitives"
description: "Security analysis for CVE-2026-105744 file read/write and shell risk in Docling Tectonic TikZ rendering."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# Docling Tectonic TeX File Primitives

## Current Understanding

The [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) records [CVE-2026-105744](https://nvd.nist.gov/vuln/detail/CVE-2026-105744) for Docling 2.94.0 until 2.132.0. Broad Docling context belongs upstream; this page owns TeX-rendering execution and file-system authority during AI document ingestion.

The NVD record says callers that opt into `LatexBackendOptions(tikz_engine="tectonic")` compile untrusted TikZ body and preamble without restricting TeX file primitives such as `\\openin` and `\\openout`. Crafted input can read available files or write writable files, and `tikz_engine_allow_shell_escape` can additionally permit shell commands.

## Security Impact

- Threat: untrusted document content can use TeX primitives or shell escape to cross into converter filesystem or process authority.
- Affected boundary: Docling 2.94.0 until 2.132.0; Tectonic TikZ rendering; TeX file primitives; optional shell escape.
- Exploit or incident status: public NVD record; no local exploitation incident is recorded.
- Mitigation state: update to Docling 2.132.0 or later, keep Tectonic rendering disabled for untrusted input, and sandbox conversion workers.
- Confidence: high for affected version and fix from NVD.
- Residual risk: AI document conversion often runs before content trust is established, so rendering backends need the same containment as code execution surfaces.

## Authoritative Sources

- [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json)
- [NVD CVE-2026-105744](https://nvd.nist.gov/vuln/detail/CVE-2026-105744)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [AI agent sandbox escape host file access](ai-agent-sandbox-escape-host-file-access.md)

## Open Questions

- Which Docling deployments enable Tectonic TikZ rendering or shell escape for untrusted documents?

## Maintenance Notes

- Created on 2026-10-06 from the [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) after verifier correction split the Docling cluster by independent boundary.
