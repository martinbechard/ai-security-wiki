---
type: "Topic"
title: "OpenPanel MCP Token Query Logging"
description: "Security analysis for CVE-2026-93982 plaintext logging of OpenPanel MCP authentication tokens supplied in URL query parameters."
tags: ["data-and-privacy", "identity-and-access", "agent-and-tool-security"]
---

# OpenPanel MCP Token Query Logging

## Current Understanding

The [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json) adds disclosed vulnerability evidence dated 2026-09-19T11:53:34.982Z: CVE Services published an OpenPanel MCP issue where authentication tokens passed in URL query parameters are logged in plaintext, enabling replay by actors with log access.

The [September 19 topic collector source](../../../raw/processed/2026-09-19/ai-security-wiki-topic-news-collector-2026-09-19T233221Z.json) records [CVE-2026-93982](https://cveawg.mitre.org/api/cve/CVE-2026-93982) for OpenPanel through commit `bad75bdd`. Broad OpenPanel analytics-product context belongs upstream; this page owns the local MCP credential logging and replay-risk boundary.

The CVE and advisory evidence say MCP authentication tokens supplied in URL query parameters are written to plaintext application logs. For an analytics MCP server, log access can therefore become delegated tool access: anyone with stdout or centralized-log access may replay the token and query project analytics through MCP.

## Security Impact

- Threat: MCP bearer material captured in logs can be replayed by operators, support tooling, or log readers outside the intended agent session.
- Affected boundary: OpenPanel through commit `bad75bdd`; MCP authentication token handling, URL query parameters, application stdout, and centralized logs.
- Exploit or incident status: public CVE/GHSA publication; no local exploitation incident is recorded.
- Mitigation state: fixed version not identified in the collector metadata; remove credentials from URLs, redact existing logs, rotate exposed MCP tokens, and prefer header or session-bound credentials.
- Confidence: high for issue mechanics and affected commit boundary; medium for remediation state until a fixed release or commit is identified.
- Residual risk: observability pipelines often have broader readers than production secrets stores, so MCP credential placement must assume logs are a secondary exposure surface.

## Authoritative Sources

- [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json)
- [September 19 topic collector source](../../../raw/processed/2026-09-19/ai-security-wiki-topic-news-collector-2026-09-19T233221Z.json)
- [CVE-2026-93982 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-93982)
- [OpenPanel advisory GHSA-8wx6-g25r-2943](https://github.com/Openpanel-dev/openpanel/security/advisories/GHSA-8wx6-g25r-2943)
- [GitHub advisory GHSA-xvpp-2hfw-c93c](https://github.com/advisories/GHSA-xvpp-2hfw-c93c)
- [VulnCheck OpenPanel advisory](https://www.vulncheck.com/advisories/openpanel-mcp-authentication-token-in-query-parameter-logged-plaintext)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [identity and access](../identity-and-access/index.md)
- [MCP data movement exposure controls](mcp-data-movement-exposure-controls.md)

## Open Questions

- Which OpenPanel release or commit stops query-parameter MCP token logging and documents token rotation guidance?

## Maintenance Notes

- Updated on 2026-09-20 from the [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json) with in-window disclosed vulnerability evidence while preserving local security-boundary scope.
- Created on 2026-09-20 from the [September 19 topic collector source](../../../raw/processed/2026-09-19/ai-security-wiki-topic-news-collector-2026-09-19T233221Z.json) as an MCP credential logging leaf.
