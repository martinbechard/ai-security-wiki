---
type: "Topic"
title: "Stirling-PDF AI HTML Agent SSRF and Local-File Read"
description: "Security analysis for CVE-2026-119343 AI rendering bypassing conventional sanitization."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# Stirling-PDF AI HTML Agent SSRF and Local-File Read

## Current Understanding

The [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json) records [CVE-2026-119343](https://nvd.nist.gov/vuln/detail/CVE-2026-119343): Stirling-PDF before 3.0.0 sends attacker-controlled AI-agent HTML to WeasyPrint without the normal converter sanitizer, allowing internal requests and readable local-file embedding.

## Security Impact

- Threat: AI-specific document rendering reaches internal services or local files.
- Affected boundary: Stirling-PDF before 3.0.0, AI HTML-agent rendering, and WeasyPrint.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: upgrade to 3.0.0 and apply identical sanitization and egress controls to AI rendering paths.
- Confidence and residual risk: high for the boundary; authentication should remain enabled during remediation.

## Authoritative Sources

- [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json)
- [November 3 leaf update watch](../../../raw/processed/2026-11-03/ai-security-wiki-leaf-update-watch-20261103T010333Z.json)
- [NVD CVE-2026-119343](https://nvd.nist.gov/vuln/detail/CVE-2026-119343)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)

## Open Questions

- Does the fixed AI path use the same resolved-address controls as the normal converter?

## Maintenance Notes

- Created on 2026-10-30 from NVD-backed collector evidence.
- Updated on 2026-11-03 with CVE Services fixed-version and advisory context; 3.0.0 remains the recorded remediation.
