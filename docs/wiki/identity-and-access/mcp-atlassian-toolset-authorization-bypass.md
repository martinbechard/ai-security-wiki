---
type: "Topic"
title: "MCP Atlassian Toolset Authorization Bypass"
description: "Security analysis for CVE-2026-77243 direct invocation of hidden mcp-atlassian tools."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# MCP Atlassian Toolset Authorization Bypass

## Current Understanding

The [September 22 topic collector source](../../../raw/processed/2026-09-22/ai-security-wiki-topic-news-collector-2026-09-22T233219Z.json) records [CVE-2026-77243](https://cveawg.mitre.org/api/cve/CVE-2026-77243) for mcp-atlassian versions before 0.22.0. Broad MCP server catalog context belongs upstream; this page owns the local delegated-tool authorization boundary.

The issue is that `ENABLED_TOOLS` and `TOOLSETS` hiding controls do not prevent direct invocation of hidden tools. In an agent workflow, discovery-layer hiding is therefore not equivalent to tool-call authorization.

## Security Impact

- Threat: an MCP caller or prompt-injected agent can invoke hidden Jira or Confluence tools even when operators intended to expose only a restricted toolset.
- Affected boundary: mcp-atlassian versions before 0.22.0, `ENABLED_TOOLS`, `TOOLSETS`, tool listing, and direct tool dispatch.
- Exploit or incident status: public CVE cluster with shared v0.22.0 remediation evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade to 0.22.0 or later and enforce allowlists at invocation time, not only during tool discovery.
- Confidence: high for advisory existence and authorization-control class; medium for per-tool blast radius without deployment-specific toolsets.
- Residual risk: MCP servers should treat discovery filters as user experience controls unless the dispatch path rechecks them.

## Authoritative Sources

- [September 22 topic collector source](../../../raw/processed/2026-09-22/ai-security-wiki-topic-news-collector-2026-09-22T233219Z.json)
- [CVE-2026-77243 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-77243)
- [mcp-atlassian PR 1448](https://github.com/sooperset/mcp-atlassian/pull/1448)
- [mcp-atlassian v0.22.0 release](https://github.com/sooperset/mcp-atlassian/releases/tag/v0.22.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MCP tool-level IAM authorization](mcp-tool-level-iam-authorization.md)
- [agent and tool security](../agent-and-tool-security/index.md)

## Open Questions

- Which hidden tools were reachable in common mcp-atlassian deployments before 0.22.0?

## Maintenance Notes

- Created on 2026-09-23 from the [September 22 topic collector source](../../../raw/processed/2026-09-22/ai-security-wiki-topic-news-collector-2026-09-22T233219Z.json) as an invocation-time tool authorization leaf.
