---
type: "Topic"
title: "MCP Python SDK HTTP Request-Body DoS"
description: "Security analysis for CVE-2026-109527 full-body buffering in official MCP Python SDK HTTP and OAuth routes."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# MCP Python SDK HTTP Request-Body DoS

## Current Understanding

[The October 14 collector](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json) records [CVE-2026-109527](https://nvd.nist.gov/vuln/detail/CVE-2026-109527) for MCP Python SDK HTTP, session, and OAuth routes. Broad MCP and FastMCP context belongs upstream; this page owns full-body buffering at a reachable transport boundary.

## Security Impact

- Threat: unbounded request bodies can be buffered in memory and deny service.
- Affected boundary: pre-1.29.1 and 2.0.0a1 through 2.0.1 Python SDK HTTP/session/OAuth routes.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: NVD lists fixes in 1.29.1 and 2.1.0.
- Confidence and residual risk: high for stated ranges and fixes; authentication does not replace resource limits.

## Control Implications

- Upgrade affected SDK lines and enforce body, concurrency, and timeout limits upstream.
- Exercise HTTP and OAuth endpoints with oversized-body regression tests.

## Authoritative Sources

- [October 14 topic collector source](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json)
- [NVD CVE-2026-109527](https://nvd.nist.gov/vuln/detail/CVE-2026-109527)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP Java SDK unbounded HTTP request-body DoS](mcp-java-sdk-unbounded-http-request-body-dos.md)

## Open Questions

- Are all FastMCP integrations covered by the patched Python SDK transport limits?

## Maintenance Notes

- Created on 2026-10-14 from the October 14 collector.
