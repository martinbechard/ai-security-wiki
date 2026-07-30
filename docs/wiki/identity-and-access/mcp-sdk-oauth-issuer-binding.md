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

Broad [MCP authorization model](../../../upstream-ai-wiki/techniques/mcp-authorization-model.md), protocol, and SDK catalog context stays upstream. Locally, this page owns the identity-control lens for MCP SDK upgrades, while [MCP SDK transport header handling](../infrastructure-and-supply-chain/mcp-sdk-transport-header-handling.md) owns streamable HTTP headers, stateless metadata, server discovery, request-size enforcement, and SSE transport background.

## Security Impact

- Threat or control area: MCP clients or gateways can accept tokens from the wrong issuer, accumulate broader scopes than intended, or reuse refresh-token flows across mismatched servers.
- Affected boundary: modelcontextprotocol/go-sdk v1.7.0, MCP protocol version 2026-07-28, OAuth/OIDC authorization paths, refresh-token handling, issuer validation, and scope negotiation.
- Exploit or incident status: primary open-source release note; no vulnerability advisory is reported in the source.
- Mitigation state:
  - Bind issuers to the intended MCP server and authorization server.
  - Test issuer-mix-up scenarios during SDK upgrade validation.
  - Review scope accumulation so repeated authorization does not silently broaden agent authority.
  - Validate refresh-token storage, rotation, revocation, and audit logging for agent-facing clients.
- Confidence: high for release facts from the GitHub release; medium for local security impact because it is an inference from authorization-path changes.
- Residual risk: local MCP clients and gateways can still mishandle delegated identity if upgrade tests verify only tool-call success rather than issuer, scope, and token-lifecycle evidence.

## Authoritative Sources

- [July 29 topic news collector source](../../../raw/processed/2026-07-29/ai-security-wiki-topic-news-collector-2026-07-29T193159-0400.json)
- [July 29 leaf update watch source](../../../raw/processed/2026-07-29/ai-security-wiki-leaf-update-watch-2026-07-29T200338-0400.json)
- MCP Go SDK v1.7.0 release: https://github.com/modelcontextprotocol/go-sdk/releases/tag/v1.7.0

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

## Maintenance Notes

- Split from [MCP SDK transport header handling](../infrastructure-and-supply-chain/mcp-sdk-transport-header-handling.md) after July 29 topic-verifier correction so OAuth issuer, scope, and refresh-token controls remain independently maintainable.
