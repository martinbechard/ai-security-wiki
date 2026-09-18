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

The [July 29 topic news collector source](../../../raw/processed/2026-07-29/ai-security-wiki-topic-news-collector-2026-07-29T193159-0400.json) and [July 29 leaf update watch source](../../../raw/processed/2026-07-29/ai-security-wiki-leaf-update-watch-2026-07-29T200338-0400.json) add security-relevant v1.7.0 transport details:

- stateless per-request metadata;
- standardized MCP HTTP headers;
- configurable request body-size enforcement.

[MCP SDK OAuth issuer binding](../identity-and-access/mcp-sdk-oauth-issuer-binding.md) owns the related OAuth issuer-binding, issuer-mix-up, refresh-token, and scope-accumulation controls from the same v1.7.0 release evidence. The [MCP Go SDK release notes](https://github.com/modelcontextprotocol/go-sdk/releases/tag/v1.7.0) also consolidate earlier DNS rebinding and cross-origin protections for SSE transport, so this page treats those as upgrade-review background rather than v1.7.0-only changes.

Broad [Model Context Protocol](../../../upstream-ai-wiki/techniques/mcp-protocol-versioning.md), [MCP transports](../../../upstream-ai-wiki/techniques/mcp-transports.md), and SDK entity coverage belongs upstream. This page owns the local infrastructure and supply-chain lens. SDK upgrades can change:

- Session state.
- Header propagation.
- Discovery exposure.
- Authentication mediation.
- Audit metadata in deployed agent tools.

The [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) adds two RMCP transport CVEs as focused child leaves. [RMCP Streamable HTTP session retention DoS](rmcp-streamable-http-session-retention-dos.md) owns CVE-2026-63128, where failed initialization could retain session state until process lifetime. [RMCP custom-header redirect leakage](rmcp-custom-header-redirect-leakage.md) owns CVE-2026-64684, where cross-origin redirects could receive custom API keys or authentication tokens. These are vulnerability evidence for the same local upgrade rule: Streamable HTTP state and header propagation are security boundaries, not only transport conveniences.

## Security Impact

- Threat or control area: transport and header changes can silently alter authentication context, audit header propagation, gateway behavior, memory lifetime, redirect handling, and cross-server discovery exposure.
- Affected boundary: modelcontextprotocol/go-sdk v1.7.0, MCP protocol 2026-07-28, streamable HTTP sessions, request and response headers, server discovery, deprecated SSE support, RMCP before 2.0.0 session creation, and RMCP before 2.1.0 custom-header redirects.
- Exploit or incident status: primary open-source release note plus public RMCP CVE records; no local exploitation incident is recorded.
- Mitigation state:
  - Review gateway and client assumptions before upgrading.
  - Test authentication and audit headers end to end.
  - Enforce request body limits before model-visible parsing or tool execution.
  - Disable unintended discovery exposure.
  - Remove dependencies on deprecated header hooks or SSE behavior.
- Confidence: high for release facts from the GitHub release and RMCP CVE publication; medium for deployment exposure until transport defaults and custom-header use are audited.
- Residual risk: local MCP clients and gateways can mis-handle identity or audit headers if SDK upgrade testing covers function calls but not transport metadata.

## Authoritative Sources

- [July 28 topic news collector source](../../../raw/processed/2026-07-28/ai-security-wiki-topic-news-collector-2026-07-28T193213-0400.json)
- [July 29 topic news collector source](../../../raw/processed/2026-07-29/ai-security-wiki-topic-news-collector-2026-07-29T193159-0400.json)
- [July 29 leaf update watch source](../../../raw/processed/2026-07-29/ai-security-wiki-leaf-update-watch-2026-07-29T200338-0400.json)
- [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json)
- [MCP Go SDK v1.7.0 release](https://github.com/modelcontextprotocol/go-sdk/releases/tag/v1.7.0)
- [CVE-2026-63128 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-63128)
- [CVE-2026-64684 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-64684)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [MCP tool-level IAM authorization](../identity-and-access/mcp-tool-level-iam-authorization.md)
- [MCP SDK OAuth issuer binding](../identity-and-access/mcp-sdk-oauth-issuer-binding.md)
- [RMCP Streamable HTTP session retention DoS](rmcp-streamable-http-session-retention-dos.md)
- [RMCP custom-header redirect leakage](rmcp-custom-header-redirect-leakage.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- Upstream AI wiki owns [MCP protocol versioning](../../../upstream-ai-wiki/techniques/mcp-protocol-versioning.md) and [MCP transports](../../../upstream-ai-wiki/techniques/mcp-transports.md).

## Open Questions

- Which local MCP clients or gateways depend on pre-1.7.0 Go SDK header hooks, SSE behavior, or stateful streamable HTTP sessions?
- Which local MCP gateways validate request-size limits and cross-origin assumptions across both streamable HTTP and SSE paths?
- Which clients attach custom authentication headers to MCP Streamable HTTP transports that follow cross-origin redirects?

## Maintenance Notes

- Added from the [July 28 topic news collector source](../../../raw/processed/2026-07-28/ai-security-wiki-topic-news-collector-2026-07-28T193213-0400.json); enriched from the [July 29 topic collector](../../../raw/processed/2026-07-29/ai-security-wiki-topic-news-collector-2026-07-29T193159-0400.json) and [July 29 leaf watcher](../../../raw/processed/2026-07-29/ai-security-wiki-leaf-update-watch-2026-07-29T200338-0400.json). Keep future updates tied to transport, identity, audit, and upgrade-risk evidence.
- Updated on 2026-09-18 from the [September 17 topic collector](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) with RMCP Streamable HTTP session-retention and custom-header redirect leakage evidence.
