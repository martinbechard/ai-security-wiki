---
type: "Topic"
title: "FastMCP OAuth Issuer Binding"
description: "Security analysis for GHSA-vqqp-x5qm-5qp4 MCP OAuth issuer-binding failure."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# FastMCP OAuth Issuer Binding

## Current Understanding

The [October 23 collector](../../../raw/processed/2026-10-23/ai-security-wiki-topic-news-collector-2026-10-23T233200Z.json) records [GHSA-vqqp-x5qm-5qp4](https://github.com/PrefectHQ/fastmcp/security/advisories/GHSA-vqqp-x5qm-5qp4): FastMCP M2M OAuth wrappers lacked authorization-server issuer binding, allowing an untrusted MCP server to redirect reusable credentials or assertions to attacker-advertised metadata.

## Security Impact

- Threat: discovery redirects client credentials or signed assertions to an attacker-controlled authorization server.
- Affected boundary: fastmcp and fastmcp-slim 4.0.0a1–4.1.1, M2M OAuth wrappers, and discovered authorization-server metadata.
- Exploit or incident status: maintainer advisory; no local incident is recorded.
- Mitigation state: upgrade to 4.1.2, explicitly configure issuer, and rotate reusable credentials that may have been exposed.
- Confidence: high; upgrade alone retains a compatibility warning without issuer configuration.
- Residual risk: discovery must not silently replace credential authority.

## Authoritative Sources

- [October 23 collector](../../../raw/processed/2026-10-23/ai-security-wiki-topic-news-collector-2026-10-23T233200Z.json)
- [October 24 leaf watch](../../../raw/processed/2026-10-24/ai-security-wiki-leaf-update-watch-20261025T000016Z.json)
- [GHSA-vqqp-x5qm-5qp4](https://github.com/PrefectHQ/fastmcp/security/advisories/GHSA-vqqp-x5qm-5qp4)
- [FastMCP 4.1.2](https://github.com/PrefectHQ/fastmcp/releases/tag/v4.1.2)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MCP SDK OAuth issuer binding](mcp-sdk-oauth-issuer-binding.md)
- [FastMCP final component authorization](../agent-and-tool-security/fastmcp-final-component-authorization.md)

## Open Questions

- Which clients cache reusable M2M credentials without an explicit issuer setting?

## Maintenance Notes

- Updated on 2026-10-24 from the [October 24 leaf watch](../../../raw/processed/2026-10-24/ai-security-wiki-leaf-update-watch-20261025T000016Z.json), which corroborated the existing boundary without changing current understanding or adding a duplicate digest item.
- Created on 2026-10-23; separate from final-component authorization because the control boundary differs.
