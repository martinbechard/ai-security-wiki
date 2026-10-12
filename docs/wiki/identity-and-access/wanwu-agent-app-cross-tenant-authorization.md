---
type: "Topic"
title: "Wanwu Agent App Cross-Tenant Authorization"
description: "Security analysis for CVE-2026-108853 Wanwu agent and RAG application cross-tenant deletion."
tags: ["identity-and-access"]
---

# Wanwu Agent App Cross-Tenant Authorization

## Current Understanding

The [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json) records [CVE-2026-108853](https://nvd.nist.gov/vuln/detail/CVE-2026-108853) for Wanwu before 0.6.3. Broad Wanwu product context belongs upstream; this page owns tenant authorization for agent and RAG application lifecycle operations.

The NVD evidence says low-privileged users can delete other tenants' agent or RAG applications by supplying `appId` values. That makes application lifecycle operations an owner-check boundary, not only a user-interface action.

## Security Impact

- Threat: authenticated low-privilege users can delete agent or RAG applications owned by other tenants.
- Affected boundary: Wanwu before 0.6.3, `appId`-selected agent and RAG application deletion, tenant ownership, and lifecycle authorization.
- Exploit or incident status: public NVD and CVE Services records; no confirmed exploitation incident is recorded locally.
- Mitigation state: enforce tenant ownership on application lifecycle endpoints and audit deletions for cross-tenant `appId` use.
- Confidence: high for affected range and cross-tenant deletion boundary from NVD evidence.
- Residual risk: agent and RAG application identifiers need server-side tenant binding because IDs are high-impact control-plane selectors.

## Authoritative Sources

- [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json)
- [NVD CVE-2026-108853](https://nvd.nist.gov/vuln/detail/CVE-2026-108853)
- [CVE-2026-108853 record](https://cveawg.mitre.org/api/cve/CVE-2026-108853)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [Wanwu AppKey and MCP Server Authorization](wanwu-appkey-and-mcp-server-authorization.md)
- [Dify MCP server status tenant ownership](dify-mcp-server-status-tenant-ownership.md)

## Open Questions

- Does Wanwu 0.6.3 also harden adjacent update and read endpoints for agent and RAG application ownership?

## Maintenance Notes

- Created on 2026-10-12 from the [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json).
