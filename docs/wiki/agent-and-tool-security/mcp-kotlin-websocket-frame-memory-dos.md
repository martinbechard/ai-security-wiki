---
type: "Topic"
title: "MCP Kotlin WebSocket Frame Memory DoS"
description: "Security analysis for CVE-2026-108714 MCP Kotlin SDK WebSocket frame-size memory exhaustion."
tags: ["agent-and-tool-security"]
---

# MCP Kotlin WebSocket Frame Memory DoS

## Current Understanding

The [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json) records [CVE-2026-108714](https://nvd.nist.gov/vuln/detail/CVE-2026-108714) for MCP Kotlin SDK through 0.15.0. Broad MCP SDK catalog context belongs upstream; this page owns the local transport resource-limit boundary.

The CVE evidence says MCP Kotlin SDK installs Ktor WebSockets without a `maxFrameSize` limit. Remote clients can send very large frames and force near-2 GiB allocations, exhausting memory before the MCP server can apply useful tool-level policy.

## Security Impact

- Threat: unauthenticated or low-trust MCP clients can turn a transport frame into process memory exhaustion.
- Affected boundary: MCP Kotlin SDK through 0.15.0, Ktor WebSocket server configuration, and MCP transport memory allocation.
- Exploit or incident status: public NVD and CVE Services records; no confirmed exploitation incident is recorded locally.
- Mitigation state: enforce WebSocket frame-size limits before message allocation and check upstream releases for the fixed version before claiming remediation.
- Confidence: high for affected version range and memory-exhaustion boundary from NVD/CVE evidence.
- Residual risk: transport defaults can bypass higher-level MCP authorization and tool validation by exhausting the server first.

## Authoritative Sources

- [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json)
- [NVD CVE-2026-108714](https://nvd.nist.gov/vuln/detail/CVE-2026-108714)
- [CVE-2026-108714 record](https://cveawg.mitre.org/api/cve/CVE-2026-108714)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Spring AI MCP Streamable HTTP session DoS](spring-ai-mcp-streamable-http-session-dos.md)
- [MCP PHP SDK SSE memory exhaustion](../infrastructure-and-supply-chain/mcp-php-sdk-sse-memory-exhaustion.md)
- Upstream AI wiki owns broad MCP protocol and SDK context.

## Open Questions

- Which MCP Kotlin SDK release first configures safe Ktor WebSocket frame limits?

## Maintenance Notes

- Created on 2026-10-12 from the [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json).
