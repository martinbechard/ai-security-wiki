---
type: "Topic"
title: "Meta Ads MCP Image Fetch SSRF"
description: "Security analysis for CVE-2026-54549 SSRF in Meta Ads MCP upload_ad_image."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# Meta Ads MCP Image Fetch SSRF

## Current Understanding

The [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json) records [CVE-2026-54549](https://nvd.nist.gov/vuln/detail/CVE-2026-54549) for Meta Ads MCP before 1.0.115. Broad Meta Ads MCP product context belongs upstream; this page owns the local URL-fetch and credential-ordering boundary.

The source says `upload_ad_image` fetches attacker-controlled URLs before credential validation. That ordering allows SSRF to loopback, private networks, cloud metadata endpoints, or redirect-chained internal targets. The related [Meta Ads MCP operator token fallback](../identity-and-access/meta-ads-mcp-operator-token-fallback.md) page owns CVE-2026-54547; this page keeps the fetch boundary separate.

## Security Impact

- Threat: unauthenticated or weakly authenticated tool calls can force the MCP server to fetch internal URLs before credential checks run.
- Affected boundary: Meta Ads MCP before 1.0.115, `upload_ad_image`, server-side URL fetch, credential validation order, redirects, private networks, loopback, and metadata endpoints.
- Exploit or incident status: public NVD record; no local exploitation incident is recorded.
- Mitigation state: upgrade to 1.0.115 or later, validate caller credentials before fetching, and block private and metadata address ranges after DNS and redirect resolution.
- Confidence: high for vulnerability shape and fixed version from NVD; medium for implementation detail until primary repository/advisory references are reconciled.
- Residual risk: advertising MCP servers combine delegated account authority and network fetch tools, so authentication and egress controls need independent enforcement.

## Authoritative Sources

- [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json)
- [NVD CVE-2026-54549](https://nvd.nist.gov/vuln/detail/CVE-2026-54549)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Meta Ads MCP operator token fallback](../identity-and-access/meta-ads-mcp-operator-token-fallback.md)
- Upstream AI wiki owns broad Meta Ads MCP product context.

## Open Questions

- Which primary Meta Ads MCP advisory or patch describes the `upload_ad_image` credential-ordering fix?

## Maintenance Notes

- Created on 2026-10-01 from the [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json); keep CVE-2026-54549 separate from the related operator-token fallback identity issue.
