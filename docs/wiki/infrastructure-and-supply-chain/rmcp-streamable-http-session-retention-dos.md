---
type: "Topic"
title: "RMCP Streamable HTTP Session Retention DoS"
description: "Security analysis for CVE-2026-63128 Streamable HTTP session retention denial of service in RMCP."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# RMCP Streamable HTTP Session Retention DoS

## Current Understanding

The [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json) adds disclosed vulnerability evidence dated 2026-09-16T15:18:37.976Z: CVE Services published an RMCP Streamable HTTP server DoS fixed in rmcp-v2.0.0, where unauthenticated non-initialization JSON-RPC can retain sessions/resources.

The [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) records CVE-2026-63128 for RMCP before 2.0.0. Broad RMCP and MCP transport context belongs upstream; this page owns the local session-lifetime and unauthenticated memory-exhaustion boundary.

The CVE says RMCP could create a `LocalSessionHandle` before validating non-initialization or malformed initialization requests on the stateful Streamable HTTP transport. Failed requests could leave session and channel state retained for process lifetime.

## Security Impact

- Threat: unauthenticated malformed initialization traffic can accumulate Streamable HTTP session state until memory exhaustion.
- Affected boundary: RMCP before 2.0.0, stateful Streamable HTTP server transport, `LocalSessionHandle`, and channel state retention.
- Exploit or incident status: public CVE record; no local exploitation incident is recorded.
- Mitigation state: update to 2.0.0 or later and reject malformed initialization before allocating long-lived session state.
- Confidence: high for CVE publication and affected boundary.
- Residual risk: stateful MCP transports need allocation ordering tests as well as request-size limits.

## Authoritative Sources

- [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json)
- [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json)
- [CVE-2026-63128 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-63128)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [MCP SDK transport header handling](mcp-sdk-transport-header-handling.md)

## Open Questions

- Which Streamable HTTP MCP servers allocate session handles before initialization validation completes?

## Maintenance Notes

- Updated on 2026-09-20 from the [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json) with in-window disclosed vulnerability evidence while preserving local security-boundary scope.
- Created on 2026-09-18 from the [September 17 topic collector](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) after verifier correction split RMCP transport issues into focused leaves.
