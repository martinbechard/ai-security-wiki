---
type: "Topic"
title: "Obot Composite MCP Route Authorization Bypass"
description: "Security analysis for CVE-2026-103758 Obot /mcp-connect-composite route access-control bypass."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# Obot Composite MCP Route Authorization Bypass

## Current Understanding

The [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json) records [CVE-2026-103758](https://cveawg.mitre.org/api/cve/CVE-2026-103758) for Obot 0.21.1 through 0.24.1. Broad Obot product context belongs upstream; this page owns the local `/mcp-connect-composite/` route authorization boundary.

The source says the `checkUI` deny list omitted `/mcp-connect-composite/`, allowing basic-role users with server IDs to connect to MCP servers that UI or API policy otherwise blocked. This is distinct from the earlier `/mcp-connect` access-control bypass because the alternate composite route is the affected path.

## Security Impact

- Threat: lower-privilege users can reach restricted MCP servers through a route not covered by access-control checks.
- Affected boundary: Obot 0.21.1 through 0.24.1; `/mcp-connect-composite/` route and `checkUI` deny-list enforcement.
- Exploit or incident status: public CVE record; no confirmed exploitation is recorded in the source.
- Mitigation state: update beyond the affected Obot range and ensure route authorization is allow-list based rather than path-deny-list based.
- Confidence: high for CVE identity and route-level boundary; medium for exact fixed version until vendor reference is captured.
- Residual risk: MCP route families need shared authorization middleware because alternate connection paths can drift from UI policy.

## Authoritative Sources

- [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json)
- [CVE-2026-103758 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-103758)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [Obot MCP connect access control bypass](obot-mcp-connect-access-control-bypass.md)
- [Obot MCP OAuth dynamic client registration](obot-mcp-oauth-dynamic-client-registration.md)
- [Obot MCP registry authentication bypass](obot-mcp-registry-authentication-bypass.md)
- [Obot MCP enterprise roadmap](../../../upstream-ai-wiki/mcp-servers/obot-mcp-enterprise-roadmap.md)

## Open Questions

- Which Obot release fixes CVE-2026-103758 and documents the composite-route authorization change?

## Maintenance Notes

- Created on 2026-10-02 from the [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json) after deduplicating against the earlier Obot `/mcp-connect` leaf.
