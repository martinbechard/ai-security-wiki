---
type: "Topic"
title: "MCP PHP SDK SSE Memory Exhaustion"
description: "Security analysis for CVE-2026-53965 unbounded SSE buffering in the MCP PHP SDK client."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# MCP PHP SDK SSE Memory Exhaustion

## Current Understanding

The [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) records [CVE-2026-53965](https://nvd.nist.gov/vuln/detail/CVE-2026-53965) for the official MCP PHP SDK. Broad SDK ecosystem coverage belongs upstream in the AI wiki; this page owns the local MCP client resilience boundary.

The [GitHub advisory](https://github.com/modelcontextprotocol/php-sdk/security/advisories/GHSA-7m52-jw36-44r3) evidence says versions 0.5.0 through 0.7.0 buffered Server-Sent Events response chunks without an upper bound until a delimiter appeared. A malicious or compromised MCP server could exhaust client memory, and the [0.7.1 release](https://github.com/modelcontextprotocol/php-sdk/releases/tag/v0.7.1) fixes the issue.

## Security Impact

- Threat: server-controlled streaming output can deny service to an MCP client process.
- Affected boundary: MCP PHP SDK versions 0.5.0 through 0.7.0 SSE client buffering; CVE-2026-53965; NVD records CWE-400 and CWE-770.
- Exploit or incident status: public vulnerability advisory; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: upgrade to 0.7.1 or later and enforce stream, message, and buffer limits for all MCP clients.
- Confidence: high for affected range and fix version from NVD/GitHub evidence.
- Residual risk: clients that trust MCP servers as benign can still be exhausted by malformed, slow, or delimiter-free streams.

## Control Implications

- Enforce maximum event, line, message, and aggregate stream sizes for MCP client transports.
- Treat remote MCP server output as untrusted input even when tool calls are read-only.
- Record server identity, stream duration, bytes buffered, abort reason, and retry policy for denial-of-service analysis.

## Authoritative Sources

- [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json)
- [NVD CVE-2026-53965](https://nvd.nist.gov/vuln/detail/CVE-2026-53965)
- [MCP PHP SDK 0.7.1 release](https://github.com/modelcontextprotocol/php-sdk/releases/tag/v0.7.1)
- [GitHub advisory GHSA-7m52-jw36-44r3](https://github.com/modelcontextprotocol/php-sdk/security/advisories/GHSA-7m52-jw36-44r3)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [MCP SDK transport header handling](mcp-sdk-transport-header-handling.md)
- [PraisonAI MCP session exhaustion](../agent-and-tool-security/praisonai-mcp-session-exhaustion.md)

## Open Questions

- Do other official MCP SDKs enforce comparable SSE or Streamable HTTP client buffer limits?

## Maintenance Notes

- Created on 2026-08-26 from the [August 25 late topic collector](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) as an MCP client streaming-resilience leaf.
