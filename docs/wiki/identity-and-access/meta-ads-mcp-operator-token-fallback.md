---
type: "Topic"
title: "Meta Ads MCP Operator Token Fallback"
description: "Security analysis for CVE-2026-54547 Meta Ads MCP requests falling back to operator Meta credentials."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# Meta Ads MCP Operator Token Fallback

## Current Understanding

The [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) records [CVE-2026-54547](https://cveawg.mitre.org/api/cve/CVE-2026-54547) for Meta Ads MCP before 1.0.115. Broad Meta Ads MCP server entity coverage belongs upstream; this page owns the local MCP delegated-authority and operator-credential fallback boundary.

The CVE says streamable-http requests are rejected only when both `auth_token` and `pipeboard_token` are absent, while `X-Pipeboard-Token` is not recognized as a primary credential. A caller can pass the guard and make tools fall back to the server operator's `META_ACCESS_TOKEN`, causing Meta Ads reads or modifications under operator authority.

## Security Impact

- Threat: weak MCP request authentication can cause ad-account tools to run with server-operator Meta credentials.
- Affected boundary: Meta Ads MCP before 1.0.115, streamable-http `AuthInjectionMiddleware`, `X-Pipeboard-Token`, and operator `META_ACCESS_TOKEN` fallback.
- Exploit or incident status: public CVE and upstream patch references; no local exploitation incident is recorded.
- Mitigation state: update to 1.0.115 or later, fail closed when caller credentials are missing or malformed, remove ambient operator-token fallback for remote calls, and audit Meta Ads changes by caller principal.
- Confidence: medium-high; direct CVE Services publication predates the collector window but NVD update and upstream patch references provide concrete current evidence.
- Residual risk: MCP business-account connectors must avoid ambient operator credentials because tool callers can otherwise inherit high-value commercial authority.

## Authoritative Sources

- [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json)
- [CVE-2026-54547 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-54547)
- [Meta Ads MCP patch commit](https://github.com/pipeboard-co/meta-ads-mcp/commit/95e852793b7ff8604a8132e85d5facd08c91a36e)
- [Meta Ads MCP pull request 137](https://github.com/pipeboard-co/meta-ads-mcp/pull/137)
- [Meta Ads MCP 1.0.115 release](https://github.com/pipeboard-co/meta-ads-mcp/releases/tag/1.0.115)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [NetLicensing MCP Server operator key fallback](netlicensing-mcp-server-operator-key-fallback.md)
- [MCP tool-level IAM authorization](mcp-tool-level-iam-authorization.md)

## Open Questions

- Which deployments expose Meta Ads MCP streamable-http transport with operator Meta credentials configured?

## Maintenance Notes

- Created on 2026-09-19 from the [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json).
