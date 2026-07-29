---
type: "Topic"
title: "MCP SDK Transport Header Handling"
description: "Security analysis for MCP SDK transport defaults, HTTP header propagation, server discovery, and upgrade planning."
---

# MCP SDK Transport Header Handling

## Current Understanding

The [July 28 topic news collector source](../../../raw/processed/2026-07-28/ai-security-wiki-topic-news-collector-2026-07-28T193213-0400.json) records the [MCP Go SDK v1.7.0 release](https://github.com/modelcontextprotocol/go-sdk/releases/tag/v1.7.0). The release:

- Supports the 2026-07-28 protocol revision.
- Switches streamable HTTP server sessions to stateless by default.
- Adds request header support.
- Adds response header support.
- Adds server discovery.
- Deprecates the older header hook path and removes the deprecated `sse` package.

Broad [Model Context Protocol](../../../upstream-ai-wiki/techniques/mcp-protocol-versioning.md), [MCP transports](../../../upstream-ai-wiki/techniques/mcp-transports.md), and SDK entity coverage belongs upstream. This page owns the local infrastructure and supply-chain lens. SDK upgrades can change:

- Session state.
- Header propagation.
- Discovery exposure.
- Authentication mediation.
- Audit metadata in deployed agent tools.

## Security Impact

- Threat or control area: transport and header changes can silently alter authentication context, audit header propagation, gateway behavior, and cross-server discovery exposure.
- Affected boundary: modelcontextprotocol/go-sdk v1.7.0, MCP protocol 2026-07-28, streamable HTTP sessions, request and response headers, server discovery, and deprecated SSE support.
- Exploit or incident status: primary open-source release note; no vulnerability advisory is reported in the source.
- Mitigation state:
  - Review gateway and client assumptions before upgrading.
  - Test authentication and audit headers end to end.
  - Disable unintended discovery exposure.
  - Remove dependencies on deprecated header hooks or SSE behavior.
- Confidence: high for release facts from the GitHub release; medium for security impact because it is an inference from transport and header-handling changes.
- Residual risk: local MCP clients and gateways can mis-handle identity or audit headers if SDK upgrade testing covers function calls but not transport metadata.

## Authoritative Sources

- [July 28 topic news collector source](../../../raw/processed/2026-07-28/ai-security-wiki-topic-news-collector-2026-07-28T193213-0400.json)
- MCP Go SDK v1.7.0 release: https://github.com/modelcontextprotocol/go-sdk/releases/tag/v1.7.0

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [MCP tool-level IAM authorization](../identity-and-access/mcp-tool-level-iam-authorization.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- Upstream AI wiki owns [MCP protocol versioning](../../../upstream-ai-wiki/techniques/mcp-protocol-versioning.md) and [MCP transports](../../../upstream-ai-wiki/techniques/mcp-transports.md).

## Open Questions

- Which local MCP clients or gateways depend on pre-1.7.0 Go SDK header hooks, SSE behavior, or stateful streamable HTTP sessions?

## Maintenance Notes

- Added from the [July 28 topic news collector source](../../../raw/processed/2026-07-28/ai-security-wiki-topic-news-collector-2026-07-28T193213-0400.json); keep future updates tied to transport, identity, audit, and upgrade-risk evidence.
