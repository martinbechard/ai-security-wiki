---
type: "Topic"
title: "Onyx MCP OAuth Token Isolation"
description: "Security analysis for CVE-2026-71424 cross-user OAuth Authorization header exposure in Onyx MCP endpoints."
tags: ["identity-and-access", "data-and-privacy", "agent-and-tool-security"]
---

# Onyx MCP OAuth Token Isolation

## Current Understanding

The [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) records CVE-2026-71424 for Onyx before 3.1.10, 3.2.14, and 4.0.0. Broad Onyx platform context belongs upstream; this page owns the local MCP connector credential-isolation boundary.

[NVD CVE-2026-71424](https://nvd.nist.gov/vuln/detail/CVE-2026-71424) reports that `GET /api/mcp/servers` and `GET /api/mcp/servers/persona/{persona_id}` can expose another user's OAuth `Authorization` header. The issue arises because per-user tokens are copied into a shared admin `MCPConnectionConfig` row and returned through `auth_template.headers` to `BASIC_ACCESS` users.

The [August 21 leaf update watch source](../../../raw/processed/2026-08-21/ai-security-wiki-leaf-update-watch-20260822T000454Z.json) confirms the fixed branches as versions before 3.1.10, 3.2.14, and 4.0.0. The durable boundary remains connector credential isolation: shared admin connection configuration must not carry per-user OAuth `Authorization` headers into lower-privilege MCP listing responses.

## Security Impact

- Threat: shared MCP connection configuration can leak one user's OAuth token to another user.
- Affected boundary: Onyx before 3.1.10, 3.2.14, and 4.0.0; MCP server listing endpoints and persona server endpoints.
- Exploit or incident status: public CVE record with secondary mirrors; primary upstream advisory still needs direct capture.
- Mitigation state: update to the fixed branches, keep per-user tokens out of shared templates, and audit historical endpoint responses.
- Confidence: medium-high from NVD/search evidence; primary patch references remain a follow-up need.
- Residual risk: connector admin rows and auth templates should be reviewed for secret material before being returned to lower-privilege roles.

## Authoritative Sources

- [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json)
- [August 21 leaf update watch source](../../../raw/processed/2026-08-21/ai-security-wiki-leaf-update-watch-20260822T000454Z.json)
- [NVD CVE-2026-71424](https://nvd.nist.gov/vuln/detail/CVE-2026-71424)
- [Strix CVE mirror](https://www.strix.ai/cve/CVE-2026-71424)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [development agent credential isolation](development-agent-credential-isolation.md)
- [MCP client OAuth redirect URI handling](mcp-client-oauth-redirect-uri-handling.md)

## Open Questions

- Which primary Onyx advisory or patch confirms the token-copying root cause and fixed behavior?

## Maintenance Notes

- Created on 2026-08-19 from the [August 18 topic collector](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) after preserving source-confidence caveats.
- Updated on 2026-08-21 from the [August 21 watcher](../../../raw/processed/2026-08-21/ai-security-wiki-leaf-update-watch-20260822T000454Z.json) with fixed-branch and cross-user Authorization header evidence.
