---
type: "Topic"
title: "Pydantic AI Web Fetch Destination Bypass"
description: "Security analysis for Pydantic AI web_fetch_tool destination-control bypasses affecting blocked domains and cloud metadata protections."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Pydantic AI Web Fetch Destination Bypass

## Current Understanding

The [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json) records October 8 CVE Services and NVD publication for Pydantic AI web-fetch destination-control vulnerabilities. Broad Pydantic AI framework context belongs upstream in ai-wiki; this page owns the local model-directed URL-fetch and cloud-metadata egress boundary.

[CVE-2026-107288](https://cveawg.mitre.org/api/cve/CVE-2026-107288) covers `web_fetch_tool` blocked-domain bypasses when hostname normalization differs between policy and resolver. [CVE-2026-107289](https://cveawg.mitre.org/api/cve/CVE-2026-107289) covers an incomplete cloud-metadata SSRF fix where IPv6 zone identifiers can bypass metadata blocklists. Both affect Pydantic AI and `pydantic-ai-slim` 1.x and 2.x lines and are fixed in 1.107.6 and 2.44.0.

## Security Impact

- Threat: model-selected or attacker-controlled URLs can reach destinations that operators intended to block, including cloud metadata or protected domains.
- Affected boundary: Pydantic AI and `pydantic-ai-slim`, `web_fetch_tool`, WebFetch, URL hostname normalization, DNS resolution, IPv6 zone identifiers, blocked domains, and cloud metadata endpoint protections.
- Exploit or incident status: public CVE Services records and GitHub advisories; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to Pydantic AI 1.107.6 or 2.44.0 or later and enforce destination policy after URL parsing, DNS resolution, redirects, IPv4/IPv6 normalization, and cloud-metadata detection.
- Confidence: high for affected ranges and fixed versions from CVE Services; medium for exploit preconditions until each advisory patch is reconciled against deployments.
- Residual risk: agent frameworks need network egress policy outside the model tool itself because destination checks are easy to bypass when parsing and resolver semantics drift.

## Authoritative Sources

- [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json)
- [CVE-2026-107288 record](https://cveawg.mitre.org/api/cve/CVE-2026-107288)
- [GHSA-22h6-qm39-v87j](https://github.com/pydantic/pydantic-ai/security/advisories/GHSA-22h6-qm39-v87j)
- [CVE-2026-107289 record](https://cveawg.mitre.org/api/cve/CVE-2026-107289)
- [GHSA-vmxc-h2x2-jmf3](https://github.com/pydantic/pydantic-ai/security/advisories/GHSA-vmxc-h2x2-jmf3)
- [Pydantic AI 1.107.6 release](https://github.com/pydantic/pydantic-ai/releases/tag/v1.107.6)
- [Pydantic AI 2.44.0 release](https://github.com/pydantic/pydantic-ai/releases/tag/v2.44.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent network egress controls](agent-network-egress-controls.md)
- [Pydantic AI web fetch resource exhaustion](pydantic-ai-web-fetch-resource-exhaustion.md)
- Upstream AI wiki owns broad [Pydantic AI framework coverage](../../../upstream-ai-wiki/agentic-frameworks/pydantic-ai.md).

## Open Questions

- Which Pydantic AI regression tests cover redirects, DNS rebinding, IPv6 zone identifiers, and cloud-metadata aliases together?

## Maintenance Notes

- Created on 2026-10-09 from the [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json) after splitting the Pydantic AI advisory cluster by independently changing security boundary.
