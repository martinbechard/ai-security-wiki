---
type: "Topic"
title: "mcp-from-openapi Redirect Credential and SSRF Controls"
description: "Security analysis for CVE-2026-115750 and CVE-2026-115751 untrusted OpenAPI fetch controls."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# mcp-from-openapi Redirect Credential and SSRF Controls

## Current Understanding

The [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json) records [CVE-2026-115750](https://nvd.nist.gov/vuln/detail/CVE-2026-115750) and [CVE-2026-115751](https://nvd.nist.gov/vuln/detail/CVE-2026-115751): `mcp-from-openapi` forwarded Authorization and Cookie headers across cross-origin redirects and allowed trailing-dot hostnames to bypass an SSRF blocked-host denylist. MCP catalog context belongs upstream; this page owns tool-generation fetch controls.

## Security Impact

- Threat: attacker-controlled specifications transfer credentials or reach operator-blocked destinations.
- Affected boundary: `mcp-from-openapi` 2.5.0 before 2.9.0 for credential forwarding; Agentfront 2.2.0 before 2.9.0 for SSRF.
- Exploit or incident status: public disclosures; no local exploitation or incident is recorded.
- Mitigation state: upgrade to 2.9.0 and independently test redirect credential stripping and canonical hostname validation.
- Confidence: high for the disclosed boundaries and fixed version.
- Residual risk: string-form host denylisting cannot substitute for parsed, canonical destination policy.

## Authoritative Sources

- [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json)
- [CVE-2026-115750](https://nvd.nist.gov/vuln/detail/CVE-2026-115750)
- [CVE-2026-115751](https://nvd.nist.gov/vuln/detail/CVE-2026-115751)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP server fetch SSRF](mcp-server-fetch-ssrf.md)

## Open Questions

- Are generated tools allowed to carry ambient credentials while following redirects?

## Maintenance Notes

- Created on 2026-10-24 as one OpenAPI fetch-control advisory family.
