---
type: "Topic"
title: "MCPHub OAuth code redemption bypass"
description: "Security analysis for CVE-2026-90474 authorization-code redemption without client secret or enforced PKCE in MCPHub."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# MCPHub OAuth code redemption bypass

## Current Understanding

The [September 13 late topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T233340Z.json) records [CVE-2026-90474](https://cveawg.mitre.org/api/cve/CVE-2026-90474) for MCPHub before 1.0.32. Broad MCPHub product and server catalog context belongs upstream; this page owns the local OAuth authorization-code and token-issuance boundary.

The CVE, GitHub advisory, VulnCheck advisory, fix commit, and v1.0.32 release say MCPHub's embedded OAuth 2.0 authorization server disabled client authentication by default and made PKCE enforcement optional. An attacker who obtained an authorization code through interception could redeem it for access tokens without a client secret or PKCE verifier and inherit the victim account's privileges. The fix enforces OAuth client authentication and S256-only PKCE policy.

This page is separate from [MCPHub control plane advisory cluster](../agent-and-tool-security/mcphub-control-plane-advisory-cluster.md) because OAuth code redemption and token issuance can change independently from the earlier August control-plane CVE family.

## Security Impact

- Threat: intercepted authorization codes can become bearer tokens when clients are not authenticated and PKCE is not enforced.
- Affected boundary: MCPHub before 1.0.32 embedded OAuth authorization server, authorization-code redemption, client authentication, and PKCE validation.
- Exploit or incident status: public CVE, GitHub advisory, VulnCheck advisory, fix commit, and release evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade to MCPHub 1.0.32 or later, require OAuth client authentication, require S256 PKCE, and audit existing tokens issued before the fix.
- Confidence: high because the CVE/advisories and release evidence align on affected boundary and mitigation.
- Residual risk: MCP hubs need OAuth threat-model tests for authorization-code interception, redirect handling, client registration, PKCE downgrade, and token audience.

## Authoritative Sources

- [September 13 late topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T233340Z.json)
- [CVE-2026-90474 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-90474)
- [MCPHub GitHub advisory GHSA-3m7m-37xf-xp9x](https://github.com/samanhappy/mcphub/security/advisories/GHSA-3m7m-37xf-xp9x)
- [MCPHub fix commit e927620cd1a80e8691213b01eb8cd6ffa1a66e9f](https://github.com/samanhappy/mcphub/commit/e927620cd1a80e8691213b01eb8cd6ffa1a66e9f)
- [MCPHub v1.0.32 release](https://github.com/samanhappy/mcphub/releases/tag/v1.0.32)
- [VulnCheck MCPHub OAuth advisory](https://www.vulncheck.com/advisories/mcphub-before-1.0.32-oauth-2.0-authentication-bypass)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MCP client OAuth redirect URI handling](mcp-client-oauth-redirect-uri-handling.md)
- [MCP SDK OAuth issuer binding](mcp-sdk-oauth-issuer-binding.md)
- [MCPHub control plane advisory cluster](../agent-and-tool-security/mcphub-control-plane-advisory-cluster.md)

## Open Questions

- Were any MCPHub tokens issued under the weaker OAuth policy revocable or rotated during the 1.0.32 upgrade guidance?

## Maintenance Notes

- Created on 2026-09-13 from the [September 13 late topic collector](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T233340Z.json) as a distinct OAuth code-redemption leaf.
