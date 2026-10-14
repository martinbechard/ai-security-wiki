---
type: "Topic"
title: "Network-AI MCP SSE Localhost-Origin Reflection"
description: "Security analysis for CVE-2026-109332, where Network-AI MCP SSE origin handling can expose unauthenticated service endpoints."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# Network-AI MCP SSE Localhost-Origin Reflection

## Current Understanding

The [October 13 topic collector source](../../../raw/processed/2026-10-13/ai-security-wiki-topic-news-collector-2026-10-13T232603Z.json) records [CVE-2026-109332](https://nvd.nist.gov/vuln/detail/CVE-2026-109332) for Network-AI before 5.15.2. Broad Network-AI product context belongs upstream; this page owns the local MCP transport origin-validation and browser attack-surface boundary.

The CVE evidence says `McpSseServer._handleRequest` reflects localhost `Origin` values into `Access-Control-Allow-Origin` even when the server binds a non-loopback interface. A malicious page with a localhost-origin context can read unauthenticated endpoints such as `/health` cross-origin.

## Security Impact

- Threat: browser-origin attacks can read MCP service state when localhost trust assumptions are reflected into CORS policy.
- Affected boundary: Network-AI npm package before 5.15.2, MCP Server-Sent Events transport, `Origin` validation, and unauthenticated health/status endpoints.
- Exploit or incident status: public CVE and NVD record; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to 5.15.2 or later and enforce exact allowed origins independently of bind address.
- Confidence: high for affected range and issue shape from the NVD/CVE record.
- Residual risk: local-agent transports remain browser-reachable unless Host, Origin, DNS-rebinding, and authentication checks are enforced together.

## Control Implications

- Treat MCP SSE and Streamable HTTP transports as web-exposed attack surfaces even during local development.
- Reject reflected localhost-origin shortcuts when a service can bind beyond loopback.
- Regression-test unauthenticated endpoints with hostile `Origin` and `Host` combinations.

## Authoritative Sources

- [October 13 topic collector source](../../../raw/processed/2026-10-13/ai-security-wiki-topic-news-collector-2026-10-13T232603Z.json)
- [NVD CVE-2026-109332](https://nvd.nist.gov/vuln/detail/CVE-2026-109332)
- [CVE Services CVE-2026-109332](https://cveawg.mitre.org/api/cve/CVE-2026-109332)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Network-AI ClaudeHookBridge deny-pattern bypass](network-ai-claudehookbridge-deny-pattern-bypass.md)
- [Network-AI ApprovalInbox authorization bypass](network-ai-approval-inbox-authorization-bypass.md)

## Open Questions

- Which Network-AI 5.15.2 commit or release note proves the exact origin-validation fix?

## Maintenance Notes

- Created on 2026-10-14 from the October 13 topic collector after routing broad Network-AI product context upstream.
