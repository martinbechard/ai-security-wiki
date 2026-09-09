---
type: "Topic"
title: "Flowise HTTP MCP document-loader SSRF"
description: "Security analysis for Flowise 3.1.3 IPv4-mapped IPv6 SSRF across HTTP, MCP, API-chain, and document-loader paths."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Flowise HTTP MCP document-loader SSRF

## Current Understanding

The [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json) records NVD in-window updates for Flowise SSRF issues fixed in 3.1.3. Broad Flowise context belongs upstream; this page owns the network egress boundary where HTTP nodes, MCP tools, API chains, and document loaders fetch model- or user-influenced URLs.

The records describe IPv4-mapped IPv6 SSRF in HTTP, MCP, document-loader, and API-chain paths. The durable control is address normalization plus final-destination validation across every fetch implementation, not a route-local denylist.

## Security Impact

- Threat: attacker-controlled URLs can bypass private-address filters through IPv4-mapped IPv6 forms and reach internal services or metadata endpoints.
- Affected boundary: Flowise versions before 3.1.3; HTTP security, MCP tools, document loaders, and API chains.
- Exploit or incident status: public NVD/CVE/GitHub advisory evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade to Flowise 3.1.3 or later and canonicalize IP addresses before allow/deny decisions.
- Confidence: high for NVD update timing and fixed-version signal; medium for exact affected node combinations.
- Residual risk: agent-builder fetch controls can drift when each node family implements URL validation differently.

## Authoritative Sources

- [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json)
- [Flowise 3.1.3 release](https://github.com/FlowiseAI/Flowise/releases/tag/flowise@3.1.3)
- [CVE-2026-69263 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-69263)
- [CVE-2026-69264 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-69264)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent network egress controls](agent-network-egress-controls.md)
- [mcp-fetch IPv6 SSRF](mcp-fetch-ipv6-ssrf.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-08 from the September 8 topic collector after verifier correction split the Flowise release wave into focused security-boundary leaves.
