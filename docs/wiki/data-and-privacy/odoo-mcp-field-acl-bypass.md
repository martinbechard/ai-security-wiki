---
type: "Topic"
title: "Odoo MCP Field ACL Bypass"
description: "Security analysis for CVE-2026-108861 Odoo MCP field-level ACL bypass through execute_method."
tags: ["data-and-privacy", "identity-and-access"]
---

# Odoo MCP Field ACL Bypass

## Current Understanding

The [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json) records [CVE-2026-108861](https://nvd.nist.gov/vuln/detail/CVE-2026-108861) for Odoo MCP 1.0.0 through 1.3.2. Broad Odoo and MCP adapter context belongs upstream if needed; this page owns field-level authorization preservation in MCP method execution.

The CVE evidence says MCP clients can bypass field-level ACLs by invoking `execute_method` with `read` or `search_read` and naming denied fields.

## Security Impact

- Threat: MCP clients can extract fields that the native application ACL denies.
- Affected boundary: Odoo MCP 1.0.0 through 1.3.2, `execute_method`, `read`, `search_read`, field-level ACLs, and denied fields.
- Exploit or incident status: public NVD and CVE Services records; no confirmed exploitation incident is recorded locally.
- Mitigation state: apply Odoo field-level ACL filtering to MCP method calls and test adapter results against native UI/API permissions.
- Confidence: high for affected range and field-level bypass from CVE evidence.
- Residual risk: generic MCP method bridges are high-risk because they can expose lower-level API options that bypass curated tool permissions.

## Authoritative Sources

- [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json)
- [NVD CVE-2026-108861](https://nvd.nist.gov/vuln/detail/CVE-2026-108861)
- [CVE-2026-108861 record](https://cveawg.mitre.org/api/cve/CVE-2026-108861)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [phpMyFAQ MCP FAQ Search ACL Bypass](phpmyfaq-mcp-faq-search-acl-bypass.md)
- [final query authorization for AI data tools](../agent-and-tool-security/final-query-authorization-for-ai-data-tools.md)
- [MCP Atlassian Jira Confluence filter bypass](mcp-atlassian-jira-confluence-filter-bypass.md)

## Open Questions

- Which Odoo MCP release first filters denied fields in `execute_method` calls?

## Maintenance Notes

- Created on 2026-10-12 from the [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json).
