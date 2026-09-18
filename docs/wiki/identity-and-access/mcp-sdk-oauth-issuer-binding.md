---
type: "Topic"
title: "MCP SDK OAuth Issuer Binding"
description: "Security analysis for MCP SDK OAuth issuer binding, issuer mix-up mitigation, refresh tokens, and scope accumulation."
---

# MCP SDK OAuth Issuer Binding

## Current Understanding

The [July 29 topic news collector source](../../../raw/processed/2026-07-29/ai-security-wiki-topic-news-collector-2026-07-29T193159-0400.json) records the [MCP Go SDK v1.7.0 release](https://github.com/modelcontextprotocol/go-sdk/releases/tag/v1.7.0) as an authorization-control update for MCP clients and servers. The local identity-and-access significance is that MCP SDK authorization paths need to bind tokens, issuers, and scopes to the intended server and client context instead of treating OAuth/OIDC success as a generic tool-access grant.

The release evidence identifies these local control areas:

- authorization refresh tokens;
- scope accumulation;
- issuer binding;
- issuer mix-up mitigation.

The [July 30 leaf update watch source](../../../raw/processed/2026-07-30/ai-security-wiki-leaf-update-watch-2026-07-30T200159-0400.json) adds the same v1.7.0 release as watcher evidence and connects these SDK changes to MCP client/server capability validation:

- protocol 2026-07-28 support;
- stateless request metadata;
- server discovery;
- sessionless behavior;
- consolidated OAuth changes.

Broad [MCP authorization model](../../../upstream-ai-wiki/techniques/mcp-authorization-model.md), protocol, and SDK catalog context stays upstream. Locally, this page owns the identity-control lens for MCP SDK upgrades, while [MCP SDK transport header handling](../infrastructure-and-supply-chain/mcp-sdk-transport-header-handling.md) owns streamable HTTP headers, stateless metadata, server discovery, request-size enforcement, and SSE transport background.

The [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) adds RMCP CVE-2026-63127 as a concrete protected-resource binding failure. RMCP before 2.0.0 omitted RFC 9728 resource validation during OAuth protected-resource metadata discovery, so a malicious MCP server could advertise another resource and authorization server and receive a victim's valid access token. This is the exploit-shaped version of the same durable rule: the authorization server, protected resource, issuer, and MCP server identity must bind to the same intended target before a client sends delegated credentials.

## Security Impact

- Threat or control area: MCP clients or gateways can accept tokens from the wrong issuer, accumulate broader scopes than intended, or reuse refresh-token flows across mismatched servers.
- Affected boundary: modelcontextprotocol/go-sdk v1.7.0, MCP protocol version 2026-07-28, OAuth/OIDC authorization paths, refresh-token handling, issuer validation, scope negotiation, RMCP before 2.0.0, and RFC 9728 protected-resource metadata validation.
- Exploit or incident status: primary open-source release note plus public RMCP CVE record; no local exploitation incident is recorded.
- Mitigation state:
  - Bind issuers to the intended MCP server and authorization server.
  - Test issuer-mix-up scenarios during SDK upgrade validation.
  - Review scope accumulation so repeated authorization does not silently broaden agent authority.
  - Validate refresh-token storage, rotation, revocation, and audit logging for agent-facing clients.
- Confidence: high for release facts from the GitHub release and RMCP CVE publication; medium for deployment impact until client discovery behavior is audited.
- Residual risk: local MCP clients and gateways can still mishandle delegated identity if upgrade tests verify only tool-call success rather than issuer, scope, and token-lifecycle evidence.

## Authoritative Sources

- [July 29 topic news collector source](../../../raw/processed/2026-07-29/ai-security-wiki-topic-news-collector-2026-07-29T193159-0400.json)
- [July 29 leaf update watch source](../../../raw/processed/2026-07-29/ai-security-wiki-leaf-update-watch-2026-07-29T200338-0400.json)
- [July 30 leaf update watch source](../../../raw/processed/2026-07-30/ai-security-wiki-leaf-update-watch-2026-07-30T200159-0400.json)
- [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json)
- [MCP Go SDK v1.7.0 release](https://github.com/modelcontextprotocol/go-sdk/releases/tag/v1.7.0)
- [CVE-2026-63127 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-63127)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MCP tool-level IAM authorization](mcp-tool-level-iam-authorization.md)
- [MCP SDK transport header handling](../infrastructure-and-supply-chain/mcp-sdk-transport-header-handling.md)
- Upstream AI wiki owns [MCP authorization model](../../../upstream-ai-wiki/techniques/mcp-authorization-model.md) context.

## Open Questions

- Which local MCP clients or gateways use OAuth/OIDC paths from the Go SDK and need issuer-binding regression coverage?
- Which local MCP clients perform RFC 9728 protected-resource validation before sending tokens to discovered MCP resources?

## Maintenance Notes

- Split from [MCP SDK transport header handling](../infrastructure-and-supply-chain/mcp-sdk-transport-header-handling.md) after July 29 topic-verifier correction so OAuth issuer, scope, and refresh-token controls remain independently maintainable; enriched from the [July 30 leaf watcher](../../../raw/processed/2026-07-30/ai-security-wiki-leaf-update-watch-2026-07-30T200159-0400.json) with protocol 2026-07-28 and sessionless capability-validation evidence.
- Updated on 2026-09-18 from the [September 17 topic collector](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) with RMCP protected-resource metadata validation evidence.
