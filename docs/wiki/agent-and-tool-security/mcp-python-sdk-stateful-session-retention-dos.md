---
type: "Topic"
title: "MCP Python SDK Stateful Session-Retention DoS"
description: "Security analysis for CVE-2026-59951 unbounded stateful-session retention in the official MCP Python SDK."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# MCP Python SDK Stateful Session-Retention DoS

## Current Understanding

[The October 14 collector](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json) records [CVE-2026-59951](https://nvd.nist.gov/vuln/detail/CVE-2026-59951) for stateful MCP Python SDK sessions. Broad MCP context belongs upstream; this page owns aggregate session-lifetime and resource-control exposure.

## Security Impact

- Threat: sessions can accumulate without expiry or aggregate limits, exhausting service resources.
- Affected boundary: stateful Python SDK sessions `>=1.8.0, <1.30.0` and `>=2.0.0, <2.2.0`.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: NVD lists fixes in 1.30.0 and 2.2.0.
- Confidence and residual risk: high for stated patch lines; deployment-level session quotas are still needed.

## Control Implications

- Upgrade, set explicit session TTLs, and cap sessions per tenant and process.
- Monitor active-session counts, expiry execution, and eviction failures.

## Authoritative Sources

- [October 14 topic collector source](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json)
- [NVD CVE-2026-59951](https://nvd.nist.gov/vuln/detail/CVE-2026-59951)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP Python SDK HTTP request-body DoS](mcp-python-sdk-http-request-body-dos.md)
- [Spring AI MCP Streamable HTTP session DoS](spring-ai-mcp-streamable-http-session-dos.md)

## Open Questions

- Do patched SDKs apply aggregate limits before sessions are authenticated or only afterward?

## Maintenance Notes

- Created on 2026-10-14 from the October 14 collector.
