---
type: "Topic"
title: "LM Studio Model Downloader Path Traversal Plugin Persistence"
description: "Security analysis for CVE-2026-119979 model artifact extraction reaching startup files."
tags: ["infrastructure-and-supply-chain"]
---

# LM Studio Model Downloader Path Traversal Plugin Persistence

## Current Understanding

The [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json) records [CVE-2026-119979](https://nvd.nist.gov/vuln/detail/CVE-2026-119979): LM Studio before 0.4.22+1 accepts backslash traversal names in model downloads, permitting crafted repositories to plant plugin or MCP bridge configuration that launches Python on startup.

## Security Impact

- Threat: a model artifact becomes persistent local application code execution.
- Affected boundary: LM Studio before 0.4.22+1, model-download filename extraction, and startup-controlled plugin configuration.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: upgrade to 0.4.22+1 or later and inspect model and plugin configuration directories.
- Confidence and residual risk: high for the boundary; untrusted model repositories remain software supply-chain inputs.

## Authoritative Sources

- [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json)
- [NVD CVE-2026-119979](https://nvd.nist.gov/vuln/detail/CVE-2026-119979)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)

## Open Questions

- Does the fixed downloader reject both slash styles after canonical path resolution?

## Maintenance Notes

- Created on 2026-10-30 from NVD-backed collector evidence.
