---
type: "Topic"
title: "IBM ContextForge Filter-Validation Denial of Service"
description: "Security analysis for CVE-2026-110189 and CVE-2026-94407 filter guard and schema-regex availability controls."
tags: ["agent-and-tool-security"]
---

# IBM ContextForge Filter-Validation Denial of Service

## Current Understanding

The [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json) groups [CVE-2026-110189](https://nvd.nist.gov/vuln/detail/CVE-2026-110189) and [CVE-2026-94407](https://nvd.nist.gov/vuln/detail/CVE-2026-94407) as ContextForge MCP Gateway filter-guard and schema-regex denial-of-service controls. Broad ContextForge coverage belongs upstream; this leaf owns validation-resource availability at the gateway boundary.

## Security Impact

- Threat: crafted filters or schema patterns consume gateway resources and disrupt delegated-tool availability.
- Affected boundary: the advisory set covers ContextForge MCP Gateway 1.0.0 through 1.0.11, with selected findings also affecting 1.1.0; these CVEs' individual affected and fixed versions require IBM PSIRT verification.
- Exploit or incident status: public NVD disclosures; no active exploitation or local incident is established.
- Mitigation state: follow IBM advisories, cap regex and filter complexity, apply time and resource limits, and monitor validation failures.
- Confidence: high for the disclosures; individual affected-range and fixed-version evidence remains open.
- Residual risk: validation is attacker-controlled work and may still create availability pressure under permitted input sizes.

## Authoritative Sources

- [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json)
- [NVD CVE-2026-110189](https://nvd.nist.gov/vuln/detail/CVE-2026-110189)
- [NVD CVE-2026-94407](https://nvd.nist.gov/vuln/detail/CVE-2026-94407)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [IBM ContextForge tool-name collision denial of service](ibm-contextforge-tool-name-collision-dos.md)

## Open Questions

- Which fixed releases bound filter and regex evaluation, and do they apply equivalent resource controls to every gateway validation route?

## Maintenance Notes

- Created on 2026-11-13 as one closely coupled validation-availability family with two CVEs.
