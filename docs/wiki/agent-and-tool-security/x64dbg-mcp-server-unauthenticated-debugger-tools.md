---
type: "Topic"
title: "x64dbg-MCP Server Unauthenticated Debugger Tools"
description: "Security analysis for CVE-2026-107824 unauthenticated MCP debugger operations in x64dbg-MCP Server."
tags: ["agent-and-tool-security"]
---

# x64dbg-MCP Server Unauthenticated Debugger Tools

## Current Understanding

The [October 9 topic collector source](../../../raw/processed/2026-10-09/ai-security-wiki-topic-news-collector-2026-10-09T233308Z.json) records [CVE-2026-107824](https://cveawg.mitre.org/api/cve/CVE-2026-107824) for x64dbg-MCP Server before 1.1. Broad x64dbg-MCP Server product and MCP catalog context belongs upstream; this page owns the local unauthenticated debugger-tool authority boundary.

The [CVE-2026-107824 record](https://cveawg.mitre.org/api/cve/CVE-2026-107824) describes the default HTTP/SSE listener exposing MCP debugger tools to unauthenticated network clients for versions before 1.1 and lists 1.1 as fixed. [GHSA-4478-h5jv-647m](https://github.com/duty1g/x64dbg-mcp-server/security/advisories/GHSA-4478-h5jv-647m) describes the same debugger-authority boundary but reports versions before 1.0 as affected and 1.0 as patched. When ports 9094 or 9095 are reachable, a remote client can invoke x64dbg commands, attach to processes, inspect or modify debuggee memory, and write files through the debugger integration. The separate [x64dbg-MCP Server Content-Length DoS](x64dbg-mcp-server-content-length-dos.md) page owns the adjacent pre-authentication transport availability advisory.

## Security Impact

- Threat: a reachable MCP server can turn unauthenticated tool discovery and invocation into process debugging, memory access, command execution inside x64dbg, and arbitrary file writes.
- Affected boundary: duty1g x64dbg-MCP Server HTTP/SSE transport, default `0.0.0.0` listener behavior, x64 and x32 ports, and debugger command/tool dispatch; CVE Services reports before 1.1 affected, while GHSA-4478 reports before 1.0 affected.
- Exploit or incident status: public CVE Services, NVD, and GitHub Security Advisory evidence; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to a release at or beyond the fixed boundary required by the chosen source of authority, bind local debugging transports to trusted interfaces, require authentication before MCP tool dispatch, and firewall debugger ports.
- Confidence: high for the unauthenticated debugger-tool authority class; medium for exact affected and fixed version because CVE Services and GHSA-4478 report different ranges.
- Residual risk: debugger MCP servers need explicit local-only and authentication controls because tool schemas expose high-authority primitives even before an agent chooses a tool.

## Authoritative Sources

- [October 9 topic collector source](../../../raw/processed/2026-10-09/ai-security-wiki-topic-news-collector-2026-10-09T233308Z.json)
- [CVE-2026-107824 record](https://cveawg.mitre.org/api/cve/CVE-2026-107824)
- [GHSA-4478-h5jv-647m](https://github.com/duty1g/x64dbg-mcp-server/security/advisories/GHSA-4478-h5jv-647m)
- [GHSA-jgj3-97w2-9v9r](https://github.com/duty1g/x64dbg-mcp-server/security/advisories/GHSA-jgj3-97w2-9v9r)
- [x64dbg-MCP Server v1.1 release](https://github.com/duty1g/x64dbg-mcp-server/releases/tag/v1.1)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [x64dbg-MCP Server Content-Length DoS](x64dbg-mcp-server-content-length-dos.md)
- [coding agent command approval boundaries](coding-agent-command-approval-boundaries.md)
- [local agent execution and processing boundaries](local-agent-execution-and-processing-boundaries.md)

## Open Questions

- Why does CVE-2026-107824 report x64dbg-MCP Server versions before 1.1 as affected while GHSA-4478-h5jv-647m reports versions before 1.0 as affected?

## Maintenance Notes

- Created on 2026-10-10 from the [October 9 topic collector source](../../../raw/processed/2026-10-09/ai-security-wiki-topic-news-collector-2026-10-09T233308Z.json) as an MCP debugger-authority leaf distinct from generic MCP server catalog coverage.
- Updated on 2026-10-10 after pre-move verifier correction split the separate Content-Length denial-of-service advisory into [x64dbg-MCP Server Content-Length DoS](x64dbg-mcp-server-content-length-dos.md).
- Updated on 2026-10-10 after corrected pre-move verification to preserve the CVE/GHSA affected-version discrepancy as an open question.
