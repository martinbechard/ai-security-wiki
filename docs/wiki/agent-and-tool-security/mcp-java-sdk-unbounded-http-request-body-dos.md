---
type: "Topic"
title: "MCP Java SDK Unbounded HTTP Request-Body DoS"
description: "Security analysis for CVE-2026-108395 unbounded Streamable HTTP request bodies in the official MCP Java SDK."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# MCP Java SDK Unbounded HTTP Request-Body DoS

## Current Understanding

[The October 14 collector](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json) records [CVE-2026-108395](https://nvd.nist.gov/vuln/detail/CVE-2026-108395) for official MCP Java SDK transport lines from 0.8.0 through mcp-core 2.0.0. Broad MCP catalog context belongs upstream; this page owns the public transport request-size boundary.

## Security Impact

- Threat: an oversized Streamable HTTP request body can exhaust server memory or resources.
- Affected boundary: MCP Java SDK lines through mcp-core 2.0.0.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: NVD lists fixes in 0.18.4, 1.1.4, and 2.0.1.
- Confidence and residual risk: high for stated patch lines; proxy and application limits remain necessary.

## Control Implications

- Upgrade the applicable SDK line and enforce request-size limits at the edge and transport.
- Monitor rejected body sizes, connection duration, and resource exhaustion signals.

## Authoritative Sources

- [October 14 topic collector source](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json)
- [NVD CVE-2026-108395](https://nvd.nist.gov/vuln/detail/CVE-2026-108395)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP PHP SDK SSE memory exhaustion](../infrastructure-and-supply-chain/mcp-php-sdk-sse-memory-exhaustion.md)

## Open Questions

- Do all supported Java transport integrations propagate the request-size limit before buffering?

## Maintenance Notes

- Created on 2026-10-14 from the October 14 collector.
