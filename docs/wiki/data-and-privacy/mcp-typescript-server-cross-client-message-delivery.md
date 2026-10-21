---
type: "Topic"
title: "MCP TypeScript Server Cross-Client Message Delivery"
description: "Security analysis for CVE-2026-111770 cross-client responses and notifications in shared MCP TypeScript server instances."
tags: ["data-and-privacy", "agent-and-tool-security"]
---

# MCP TypeScript Server Cross-Client Message Delivery

## Current Understanding

The [October 20 topic collector source](../../../raw/processed/2026-10-20/ai-security-wiki-topic-news-collector-2026-10-20T232727Z.json) records [CVE-2026-111770](https://nvd.nist.gov/vuln/detail/CVE-2026-111770) / [GHSA-jm63-cq47-j5jp](https://github.com/advisories/GHSA-jm63-cq47-j5jp) for `@modelcontextprotocol/server`. Broad [MCP transport](../../../upstream-ai-wiki/techniques/mcp-transports.md) and SDK coverage stays upstream; this leaf owns the local tenant-isolation failure in multi-client HTTP deployments.

Affected HTTP MCP servers can route one client's response or notification to another when a stateless transport or `McpServer`/`Server` instance is shared across clients. Normal JSON-RPC request-ID collisions make a single startup-scoped server or transport an unsafe session boundary.

## Security Impact

- Threat: cross-client response or notification delivery can disclose tool output across tenant or delegated-authority boundaries.
- Affected boundary: `@modelcontextprotocol/server` versions 2.0.0 through before 2.3.0 in multi-client HTTP endpoints that reuse a transport or server instance.
- Exploit or incident status: public GitHub-reviewed advisory; no local exploitation incident is recorded.
- Mitigation state: upgrade to 2.3.0 or later and create a server and transport per request, or retain both per session.
- Confidence: high because the primary advisory specifies the shared-instance condition, affected range, and patched version.
- Residual risk: transport lifetime must be tested with concurrent clients; package upgrade alone does not repair an application that shares mutable session state.

## Authoritative Sources

- [October 20 topic collector source](../../../raw/processed/2026-10-20/ai-security-wiki-topic-news-collector-2026-10-20T232727Z.json)
- [CVE-2026-111770](https://nvd.nist.gov/vuln/detail/CVE-2026-111770)
- [GitHub advisory GHSA-jm63-cq47-j5jp](https://github.com/advisories/GHSA-jm63-cq47-j5jp)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [MCP TypeScript SDK validation memory-exhaustion denial of service](../agent-and-tool-security/mcp-typescript-sdk-validation-memory-exhaustion-dos.md)

## Open Questions

- Which local HTTP MCP endpoints share a server or transport instance across requests rather than binding both to a session?

## Maintenance Notes

- Created on 2026-10-20 from the October 20 topic collector.
