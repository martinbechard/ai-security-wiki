---
type: "Topic"
title: "ChatCLI MCP OAuth Resource-Origin Binding"
description: "Security analysis for ChatCLI MCP OAuth resource-indicator origin validation."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# ChatCLI MCP OAuth Resource-Origin Binding

## Current Understanding

The [November 5 topic collector source](../../../raw/processed/2026-11-05/ai-security-wiki-topic-news-collector-2026-11-06T003522Z.json) records ChatCLI versions 1.159.0 through 1.215.1 accepting a server-supplied Protected Resource Metadata `resource` value as an OAuth resource indicator without confirming that it matched the configured MCP server. Broad ChatCLI and MCP coverage belongs upstream; this page owns the delegated-token audience and resource-origin binding boundary.

The maintainer [GHSA-95vg-3r9c-2v5q](https://github.com/diillson/chatcli/security/advisories/GHSA-95vg-3r9c-2v5q) says a malicious or compromised MCP server could obtain a token for another resource on the same authorization server after user consent and replay it there. The [1.215.2 release](https://github.com/diillson/chatcli/releases/tag/v1.215.2) binds MCP OAuth tokens to the configured server URL and adds authorization-server validation and redirect confinement.

## Security Impact

- Threat: untrusted MCP metadata can redirect a delegated bearer token to a different protected resource.
- Affected boundary: ChatCLI 1.159.0 through 1.215.1; MCP OAuth login, Protected Resource Metadata, authorization request, token exchange, refresh, and stored OAuth metadata.
- Exploit or incident status: maintainer-published high-severity advisory; exploitation requires a malicious or compromised MCP server, compatible authorization-server behavior, another accepting resource, and user consent. No local incident is recorded.
- Mitigation state: upgrade to 1.215.2 or later; invalidate affected stored credentials with a new login, revoke the client where an untrusted server was used, and permit MCP login only for trusted servers.
- Confidence: high for affected versions, preconditions, and remediation from the maintainer advisory and release.
- Residual risk: resource binding does not remove the need to trust the configured MCP server or review its delegated authority.

## Authoritative Sources

- [November 5 topic collector source](../../../raw/processed/2026-11-05/ai-security-wiki-topic-news-collector-2026-11-06T003522Z.json)
- [GHSA-95vg-3r9c-2v5q](https://github.com/diillson/chatcli/security/advisories/GHSA-95vg-3r9c-2v5q)
- [ChatCLI 1.215.2 release](https://github.com/diillson/chatcli/releases/tag/v1.215.2)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MCP TypeScript SDK bearer-token audience validation](mcp-typescript-sdk-bearer-token-audience-validation.md)
- [MCP remote OAuth metadata SSRF](../agent-and-tool-security/mcp-remote-oauth-metadata-ssrf.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-11-05 from the [November 5 topic collector source](../../../raw/processed/2026-11-05/ai-security-wiki-topic-news-collector-2026-11-06T003522Z.json) after maintainer advisory and release confirmation.
