---
type: "Topic"
title: "MetaMCP Session IDOR"
description: "Security analysis for CVE-2026-79537, where MetaMCP session dispatch lacks owner and endpoint binding."
tags: ["identity-and-access", "data-and-privacy"]
---

# MetaMCP Session IDOR

## Current Understanding

The [September 29 topic collector source](../../../raw/processed/2026-09-29/ai-security-wiki-topic-news-collector-2026-09-29T233133Z.json) records [CVE-2026-79537](https://nvd.nist.gov/vuln/detail/CVE-2026-79537) for MetaMCP through 2.4.22. General MetaMCP product and MCP aggregation practice belongs upstream; this page owns the local tenant session-isolation and private tool execution boundary.

The source says session dispatch is keyed only by client-supplied `mcp-session-id`, without owner or endpoint binding. That can allow cross-tenant private tool execution and data exfiltration when an attacker can guess, obtain, or replay another tenant's session identifier.

## Security Impact

- Threat: tenant session identifiers can become bearer capabilities for another user's MCP tools and data.
- Affected boundary: MetaMCP through 2.4.22; `mcp-session-id`; owner binding; endpoint binding; cross-tenant private tool execution.
- Exploit or incident status: public NVD entry and Traceforce advisory; no active exploitation was identified in the collector source.
- Mitigation state: bind session IDs to authenticated subject, tenant, endpoint, and tool target; rotate exposed session IDs; and reject session reuse across endpoints.
- Confidence: high for affected range and tenant-isolation class from NVD and Traceforce; medium for fixed-version status because the collector did not identify a patched release.
- Residual risk: MCP aggregators need capability binding and audit trails for every forwarded tool call, not just a client-supplied session key.

## Authoritative Sources

- [September 29 topic collector source](../../../raw/processed/2026-09-29/ai-security-wiki-topic-news-collector-2026-09-29T233133Z.json)
- [CVE-2026-79537 NVD entry](https://nvd.nist.gov/vuln/detail/CVE-2026-79537)
- [MetaMCP repository](https://github.com/metatool-ai/metamcp)
- [Traceforce CVE-2026-79537 advisory](https://www.traceforce.ai/security-advisories/cve-2026-79537)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [data and privacy](../data-and-privacy/index.md)
- [MetaMCP stdio inspector proxy code execution](../agent-and-tool-security/metamcp-stdio-inspector-proxy-code-execution.md)
- [downstream agent authorization context](downstream-agent-authorization-context.md)
- Upstream AI wiki owns broad MetaMCP product catalog context if needed.

## Open Questions

- Which MetaMCP release fixes CVE-2026-79537 and what migration steps rotate existing session identifiers?

## Maintenance Notes

- Created on 2026-09-30 from the [September 29 topic collector source](../../../raw/processed/2026-09-29/ai-security-wiki-topic-news-collector-2026-09-29T233133Z.json) after splitting the MetaMCP session-isolation issue from the stdio inspector proxy execution issue.
