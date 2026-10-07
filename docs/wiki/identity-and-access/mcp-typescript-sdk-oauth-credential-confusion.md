---
type: "Topic"
title: "MCP TypeScript SDK OAuth Credential Confusion"
description: "Security analysis for CVE-2026-104850 credential redirection through MCP TypeScript SDK OAuth protected-resource metadata."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# MCP TypeScript SDK OAuth Credential Confusion

## Current Understanding

The [October 6 topic collector source](../../../raw/processed/2026-10-06/ai-security-wiki-topic-news-collector-2026-10-06T233203Z.json) records [CVE-2026-104850](https://nvd.nist.gov/vuln/detail/CVE-2026-104850) / [GHSA-6qxp-vccf-f47h](https://github.com/modelcontextprotocol/typescript-sdk/security/advisories/GHSA-6qxp-vccf-f47h) for the official MCP TypeScript SDK. Broad Model Context Protocol and SDK catalog context belongs upstream; this page owns the local OAuth credential-binding failure for TypeScript MCP clients.

The advisory says an untrusted MCP server could provide protected-resource metadata that caused the client to send OAuth credentials to an attacker-controlled authorization server. Refresh tokens, client secrets, or signed assertions could be disclosed when clients holding legitimate authorization-server credentials trusted server-supplied metadata instead of binding credentials to the expected issuer and resource. The affected ranges are `@modelcontextprotocol/sdk` 1.12.0 through before 1.31.0 and `@modelcontextprotocol/client` 2.0.0 through before 2.2.0.

## Security Impact

- Threat: server-controlled OAuth metadata can redirect delegated MCP client credentials to the wrong authorization server.
- Affected boundary: HTTP MCP clients using OAuth or bundled non-interactive auth providers in affected TypeScript SDK or client package ranges.
- Exploit or incident status: public GitHub advisory and NVD record; no local exploitation incident is recorded.
- Mitigation state: update to `@modelcontextprotocol/sdk` 1.31.0 or later and `@modelcontextprotocol/client` 2.2.0 or later, bind protected-resource metadata to the expected issuer and resource, and reject token exchange when server discovery changes authority.
- Confidence: high because GitHub, NVD, the v2.2.0 release, and the patch PR align on affected packages, fixed versions, and credential-disclosure impact.
- Residual risk: MCP clients need issuer, resource, scope, redirect, and token-endpoint regression tests because model-selected or server-discovered tool endpoints are untrusted until bound to the intended authorization server.

## Authoritative Sources

- [October 6 topic collector source](../../../raw/processed/2026-10-06/ai-security-wiki-topic-news-collector-2026-10-06T233203Z.json)
- [NVD CVE-2026-104850](https://nvd.nist.gov/vuln/detail/CVE-2026-104850)
- [GitHub advisory GHSA-6qxp-vccf-f47h](https://github.com/modelcontextprotocol/typescript-sdk/security/advisories/GHSA-6qxp-vccf-f47h)
- [MCP TypeScript SDK v2.2.0 release](https://github.com/modelcontextprotocol/typescript-sdk/releases/tag/v2.2.0)
- [MCP TypeScript SDK pull request 2887](https://github.com/modelcontextprotocol/typescript-sdk/pull/2887)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MCP SDK OAuth issuer binding](mcp-sdk-oauth-issuer-binding.md)
- [MCP Python SDK OAuth metadata trust flaw](mcp-python-sdk-oauth-metadata-trust-flaw.md)
- [MCP client OAuth redirect URI handling](mcp-client-oauth-redirect-uri-handling.md)
- Upstream AI wiki owns broad [MCP authorization model](../../../upstream-ai-wiki/techniques/mcp-authorization-model.md) context.

## Open Questions

- Which local MCP TypeScript clients use bundled non-interactive auth providers and need issuer/resource regression coverage?

## Maintenance Notes

- Created on 2026-10-07 from the [October 6 topic collector source](../../../raw/processed/2026-10-06/ai-security-wiki-topic-news-collector-2026-10-06T233203Z.json) as a TypeScript SDK-specific credential-confusion leaf linked to the broader MCP OAuth issuer-binding control.
