---
type: "Topic"
title: "PraisonAI MCP Session Exhaustion"
description: "Security analysis for CVE-2026-55531 MCP initialize session exhaustion in PraisonAI."
tags: ["agent-and-tool-security", "testing-and-assurance"]
---

# PraisonAI MCP Session Exhaustion

## Current Understanding

The [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) records [CVE-2026-55531](https://nvd.nist.gov/vuln/detail/CVE-2026-55531) for PraisonAI before 4.6.58. Broad PraisonAI framework context belongs upstream; this page owns the local MCP transport lifecycle and availability boundary.

The advisory evidence says the MCP HTTP Stream implementation created a new session for each initialize request without cleanup or a maximum. The fix adds cleanup plus `PRAISONAI_MCP_MAX_SESSIONS`, making this an agent runtime resource-governance issue rather than a prompt or model issue.

## Security Impact

- Threat: unauthenticated or weakly authenticated initialize requests can exhaust server memory and deny service to local or hosted agent sessions.
- Affected boundary: PraisonAI before 4.6.58 MCP HTTP Stream session lifecycle; CVE-2026-55531; NVD records CWE-400 and CWE-770.
- Exploit or incident status: public vulnerability advisory; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: upgrade to 4.6.58 or later, set conservative session caps, expire idle sessions, and authenticate initialization where possible.
- Confidence: high for advisory identity and fix release from NVD/GitHub evidence.
- Residual risk: agent runtimes remain availability-sensitive when session creation is cheap for callers and expensive for the server.

## Control Implications

- Require explicit session lifecycle limits for MCP transports, including initialization rate limits, idle expiry, and total session caps.
- Monitor failed or unauthenticated initialize bursts as possible browser-origin or network DoS attempts.
- Treat availability of agent control planes as a security property when tools can affect production or operational workflows.

## Authoritative Sources

- [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json)
- [NVD CVE-2026-55531](https://nvd.nist.gov/vuln/detail/CVE-2026-55531)
- [PraisonAI 4.6.58 release](https://github.com/MervinPraison/PraisonAI/releases/tag/v4.6.58)
- [GitHub advisory GHSA-wv94-5qcp-6m36](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-wv94-5qcp-6m36)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Spring AI MCP Streamable HTTP session DoS](spring-ai-mcp-streamable-http-session-dos.md)
- [MCP SDK transport header handling](../infrastructure-and-supply-chain/mcp-sdk-transport-header-handling.md)

## Open Questions

- What default value does PraisonAI 4.6.58 use for `PRAISONAI_MCP_MAX_SESSIONS`, and is it safe for local single-user deployments?

## Maintenance Notes

- Created on 2026-08-26 from the [August 25 late topic collector](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) as a separate MCP session-lifecycle advisory leaf.
