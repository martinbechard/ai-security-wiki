---
type: "Topic"
title: "genieacs-mcp Loopback DNS Rebinding"
description: "Security analysis for CVE-2026-55637 Host and Origin validation bypass on genieacs-mcp loopback transport."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# genieacs-mcp Loopback DNS Rebinding

## Current Understanding

The [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) records [CVE-2026-55637](https://nvd.nist.gov/vuln/detail/CVE-2026-55637) for genieacs-mcp before the [0.3.2 release](https://github.com/GeiserX/genieacs-mcp/releases/tag/v0.3.2). Broad GenieACS and MCP server entity coverage belongs upstream; this page owns the local loopback transport browser-origin boundary.

[NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-55637) and [GHSA-cmwv-wf9p-p8wx](https://github.com/GeiserX/genieacs-mcp/security/advisories/GHSA-cmwv-wf9p-p8wx) evidence says the default loopback Streamable HTTP endpoint accepted attacker-controlled Host and Origin headers. A malicious web page could use DNS rebinding to initialize MCP sessions and invoke GenieACS tools through the victim's browser context.

## Security Impact

- Threat: browser-origin traffic can reach a local MCP control plane and invoke network-management tools.
- Affected boundary: genieacs-mcp before 0.3.2 Streamable HTTP transport; NVD records CVSS 3.1 HIGH 8.8 and CWE-346.
- Exploit or incident status: public vulnerability advisory; no local exploitation incident is recorded.
- Mitigation state: upgrade to 0.3.2 or later, validate exact Host and Origin values, and require authentication even for loopback transports.
- Confidence: high for advisory identity and affected range from NVD/GitHub evidence.
- Residual risk: loopback-only MCP servers remain browser reachable unless they defend against DNS rebinding, CSRF, and simple request forms.

## Control Implications

- Treat loopback MCP endpoints as reachable by untrusted web content.
- Require Host and Origin checks before MCP session initialization, not only before tool execution.
- Combine origin checks with authentication and session binding so DNS names alone do not carry authority.

## Authoritative Sources

- [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json)
- [NVD CVE-2026-55637](https://nvd.nist.gov/vuln/detail/CVE-2026-55637)
- [GitHub advisory GHSA-cmwv-wf9p-p8wx](https://github.com/GeiserX/genieacs-mcp/security/advisories/GHSA-cmwv-wf9p-p8wx)
- [genieacs-mcp 0.3.2 release](https://github.com/GeiserX/genieacs-mcp/releases/tag/v0.3.2)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [PraisonAI MCP origin and CSRF instruction persistence](praisonai-mcp-origin-and-csrf-instruction-persistence.md)
- [cross-site agent forgery](cross-site-agent-forgery.md)

## Open Questions

- Which GenieACS tool authorities are exposed through common genieacs-mcp deployments?

## Maintenance Notes

- Created on 2026-08-26 from the [August 25 late topic collector](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) as a loopback MCP DNS-rebinding leaf.
