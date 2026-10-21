---
type: "Topic"
title: "MCP TypeScript SDK Bearer-Token Audience Validation"
description: "Security analysis for CVE-2026-111771 cross-service bearer-token acceptance by MCP TypeScript server helpers."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# MCP TypeScript SDK Bearer-Token Audience Validation

## Current Understanding

The [October 20 topic collector source](../../../raw/processed/2026-10-20/ai-security-wiki-topic-news-collector-2026-10-20T232727Z.json) records [CVE-2026-111771](https://nvd.nist.gov/vuln/detail/CVE-2026-111771) / [GHSA-rvq5-wwqv-78pq](https://github.com/advisories/GHSA-rvq5-wwqv-78pq). Broad [MCP authorization](../../../upstream-ai-wiki/techniques/mcp-authorization-model.md) and SDK coverage remains upstream; this leaf owns resource-audience validation for delegated MCP tool authorization.

Server-side bearer-authentication helpers can accept a token minted for another service when one authorization server serves multiple services and the application does not independently validate the token audience. Signature validation and a shared issuer do not establish that a token is intended for the MCP server receiving it.

## Security Impact

- Threat: a caller can reuse a valid token for another resource to gain unintended MCP tool authority.
- Affected boundary: `@modelcontextprotocol/sdk` 1.6.0 through before 1.32.0, `@modelcontextprotocol/server` 2.0.0 through before 2.3.0, `@modelcontextprotocol/express` 2.0.0 through before 2.0.2, and `@modelcontextprotocol/server-legacy` 2.0.0 through before 2.3.1.
- Exploit or incident status: public GitHub-reviewed advisory; no local exploitation incident is recorded.
- Mitigation state: upgrade to the patched packages and configure `expectedResource` plus `AuthInfo.resource`, or reject tokens whose `aud` claim excludes the MCP server.
- Confidence: high because the primary advisory identifies both package fixes and the required application configuration.
- Residual risk: a patched package does not provide least privilege when expected-resource validation remains disabled or untested.

## Authoritative Sources

- [October 20 topic collector source](../../../raw/processed/2026-10-20/ai-security-wiki-topic-news-collector-2026-10-20T232727Z.json)
- [CVE-2026-111771](https://nvd.nist.gov/vuln/detail/CVE-2026-111771)
- [GitHub advisory GHSA-rvq5-wwqv-78pq](https://github.com/advisories/GHSA-rvq5-wwqv-78pq)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MCP TypeScript SDK OAuth credential confusion](mcp-typescript-sdk-oauth-credential-confusion.md)
- [MCP SDK OAuth issuer binding](mcp-sdk-oauth-issuer-binding.md)

## Open Questions

- Which local MCP servers use the affected helpers with a shared authorization server and no expected resource configured?

## Maintenance Notes

- Created on 2026-10-20 from the October 20 topic collector.
