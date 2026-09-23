---
type: "Topic"
title: "MCP Atlassian Jira Confluence Filter Bypass"
description: "Security analysis for CVE-2026-77251 and CVE-2026-77252 bypassing mcp-atlassian Jira and Confluence allowlists."
tags: ["data-and-privacy", "identity-and-access", "agent-and-tool-security"]
---

# MCP Atlassian Jira Confluence Filter Bypass

## Current Understanding

The [September 22 topic collector source](../../../raw/processed/2026-09-22/ai-security-wiki-topic-news-collector-2026-09-22T233219Z.json) records [CVE-2026-77251](https://cveawg.mitre.org/api/cve/CVE-2026-77251) and [CVE-2026-77252](https://cveawg.mitre.org/api/cve/CVE-2026-77252) for mcp-atlassian versions before 0.22.0. Broad Jira and Confluence product context belongs upstream; this page owns the local data allowlist and search-filter boundary.

The affected controls are `JIRA_PROJECTS_FILTER` and `CONFLUENCE_SPACES_FILTER`. The collector records one issue where forbidden project or space content can be exfiltrated despite configured filters, and another where caller-supplied search filters can replace administrator-configured Jira and Confluence allowlists.

## Security Impact

- Threat: agents or MCP callers can retrieve Jira and Confluence content outside the administrator-configured project or space scope.
- Affected boundary: mcp-atlassian versions before 0.22.0, Jira project filters, Confluence space filters, search filters, and SaaS data returned to MCP clients.
- Exploit or incident status: public CVE cluster with shared v0.22.0 remediation evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade to 0.22.0 or later, enforce configured allowlists server-side after caller filters are parsed, and audit query logs for disallowed project or space access.
- Confidence: high for advisory existence and affected filter names; medium for exact exfiltration paths until each deployment's exposed tools are known.
- Residual risk: retrieval restrictions for agent-accessible SaaS data need immutable server-side policy, not caller-editable query parameters.

## Authoritative Sources

- [September 22 topic collector source](../../../raw/processed/2026-09-22/ai-security-wiki-topic-news-collector-2026-09-22T233219Z.json)
- [CVE-2026-77251 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-77251)
- [CVE-2026-77252 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-77252)
- [mcp-atlassian PR 1448](https://github.com/sooperset/mcp-atlassian/pull/1448)
- [mcp-atlassian v0.22.0 release](https://github.com/sooperset/mcp-atlassian/releases/tag/v0.22.0)

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

- Which Jira and Confluence tools returned out-of-allowlist content before the 0.22.0 fix?

## Maintenance Notes

- Created on 2026-09-23 from the [September 22 topic collector source](../../../raw/processed/2026-09-22/ai-security-wiki-topic-news-collector-2026-09-22T233219Z.json) as a data-filter and allowlist bypass leaf.
