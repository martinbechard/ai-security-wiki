---
type: "Topic"
title: "1MCP Agent OAuth Tag Scope Bypass"
description: "Security analysis for CVE-2026-108586 OAuth tag-scope bypass in 1MCP Agent."
tags: ["identity-and-access"]
---

# 1MCP Agent OAuth Tag Scope Bypass

## Current Understanding

The [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) records [CVE-2026-108586](https://cveawg.mitre.org/api/cve/CVE-2026-108586) for 1MCP Agent, also published as `@1mcp/agent`, 0.20.0 through 0.39.0. Broad 1MCP product context belongs upstream; this page owns OAuth scope enforcement and tool-gateway least-privilege implications.

Authenticated clients holding a token for one tag can use negated advanced tag-filter expressions such as `not <granted-tag>`. The result is listing and invoking tools on backend MCP servers outside the granted tag scope, which turns tag metadata into an authorization boundary rather than only a discovery feature.

## Security Impact

- Threat: single-tag OAuth credentials can invoke tools outside their granted scope.
- Affected boundary: 1MCP Agent 0.20.0 through 0.39.0, OAuth tag-scope enforcement, advanced tag filters, backend MCP server tool listing and invocation.
- Exploit or incident status: public CVE Services and NVD evidence; no confirmed exploitation incident is recorded locally.
- Mitigation state: patch to a fixed release when available, evaluate tag-filter expressions against positive grants, and deny negated filters that expand beyond token scope.
- Confidence: high for the authorization bypass and affected range from CVE evidence.
- Residual risk: tool gateways need policy evaluation on final resolved tool sets, not only on filter syntax or user-visible tags.

## Authoritative Sources

- [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json)
- [CVE-2026-108586 record](https://cveawg.mitre.org/api/cve/CVE-2026-108586)
- [NVD CVE-2026-108586](https://nvd.nist.gov/vuln/detail/CVE-2026-108586)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MCP tool-level IAM authorization](mcp-tool-level-iam-authorization.md)
- [MCP Atlassian toolset authorization bypass](mcp-atlassian-toolset-authorization-bypass.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-10-11 from the [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) after upstream index routing kept broad product and framework context outside the local security wiki.
