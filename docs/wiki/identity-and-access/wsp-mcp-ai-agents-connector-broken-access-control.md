---
type: "Topic"
title: "WSP MCP AI Agents Connector Broken Access Control"
description: "Security analysis for CVE-2026-93529, a contributor-reachable access control flaw in a WordPress MCP connector."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# WSP MCP AI Agents Connector Broken Access Control

## Current Understanding

The [September 23 topic collector source](../../../raw/processed/2026-09-23/ai-security-wiki-topic-news-collector-2026-09-23T233151Z.json) records [CVE-2026-93529](https://cveawg.mitre.org/api/cve/CVE-2026-93529) for the WordPress WSP MCP - AI Agents Connector plugin through 2.7.0. The Patchstack and CVE metadata classify the issue as broken access control reachable by Contributor users and fixed in 2.7.1, but public operational detail is sparse.

This page keeps the security-specific role boundary locally. Broad WordPress plugin catalog context belongs upstream only if needed.

## Security Impact

- Threat: low-privilege Contributor users can reach an MCP connector capability that should be role-restricted.
- Affected boundary: WordPress WSP MCP - AI Agents Connector through 2.7.0; fixed in 2.7.1.
- Exploit or incident status: public CVE, NVD, and Patchstack advisory; exact vulnerable capability is not identified in the collector metadata.
- Mitigation state: upgrade to 2.7.1 or later and review contributor-accessible MCP connector routes until the exact endpoint is confirmed.
- Confidence: moderate because affected and fixed versions align across CVE/NVD/Patchstack, but impact detail is sparse.
- Residual risk: CMS MCP connectors need explicit role checks because plugin routes can expose content or action surfaces to agent tooling.

## Authoritative Sources

- [September 23 topic collector source](../../../raw/processed/2026-09-23/ai-security-wiki-topic-news-collector-2026-09-23T233151Z.json)
- [CVE-2026-93529 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-93529)
- [NVD CVE-2026-93529](https://nvd.nist.gov/vuln/detail/CVE-2026-93529)
- [Patchstack advisory](https://patchstack.com/database/wordpress/plugin/wsp-mcp-ai-agents-connector/vulnerability/wordpress-wsp-mcp-8211-ai-agents-connector-plugin-2-7-0-broken-access-control-vulnerability?_s_id=cve)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [Agentimus AI SEO MCP WordPress broken access control](agentimus-ai-seo-mcp-wordpress-broken-access-control.md)

## Open Questions

- Which WSP MCP - AI Agents Connector capability is reachable by Contributor users in CVE-2026-93529?

## Maintenance Notes

- Created on 2026-09-24 from the [September 23 topic collector source](../../../raw/processed/2026-09-23/ai-security-wiki-topic-news-collector-2026-09-23T233151Z.json); keep impact language conservative until more public detail is available.
