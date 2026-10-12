---
type: "Topic"
title: "phpMyFAQ MCP FAQ Search ACL Bypass"
description: "Security analysis for CVE-2026-108851 phpMyFAQ MCP faq_search restricted-content exposure."
tags: ["data-and-privacy", "identity-and-access"]
---

# phpMyFAQ MCP FAQ Search ACL Bypass

## Current Understanding

The [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json) records [CVE-2026-108851](https://nvd.nist.gov/vuln/detail/CVE-2026-108851) for phpMyFAQ through 4.1.10. Broad phpMyFAQ product context belongs upstream if needed; this page owns MCP search preservation of native FAQ access controls.

The CVE evidence says the MCP server `faq_search` tool exposes restricted FAQ content because `Search::searchDatabase()` does not apply user or group permission checks.

## Security Impact

- Threat: MCP clients can retrieve restricted knowledge-base content through a search tool that bypasses native ACLs.
- Affected boundary: phpMyFAQ through 4.1.10, MCP `faq_search`, `Search::searchDatabase()`, FAQ user and group permissions, and restricted content.
- Exploit or incident status: public NVD and CVE Services records; no confirmed exploitation incident is recorded locally.
- Mitigation state: apply native user/group permission filters to MCP search, verify MCP results match UI-visible content, and audit restricted FAQ retrieval.
- Confidence: high for affected range and permission-check gap from CVE evidence.
- Residual risk: MCP adapters must preserve application-layer ACLs in search and retrieval tools, not only in direct UI paths.

## Authoritative Sources

- [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json)
- [NVD CVE-2026-108851](https://nvd.nist.gov/vuln/detail/CVE-2026-108851)
- [CVE-2026-108851 record](https://cveawg.mitre.org/api/cve/CVE-2026-108851)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [Odoo MCP field ACL bypass](odoo-mcp-field-acl-bypass.md)
- [MCP Atlassian Jira Confluence filter bypass](mcp-atlassian-jira-confluence-filter-bypass.md)
- [final query authorization for AI data tools](../agent-and-tool-security/final-query-authorization-for-ai-data-tools.md)

## Open Questions

- Which phpMyFAQ release first applies FAQ user and group ACLs to MCP search?

## Maintenance Notes

- Created on 2026-10-12 from the [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json).
