---
type: "Topic"
title: "AWS Labs Postgres MCP Server Readonly Bypass"
description: "Security analysis for CVE-2026-85787 SQL validation bypass in awslabs.postgres-mcp-server."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# AWS Labs Postgres MCP Server Readonly Bypass

## Current Understanding

The [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json) records CVE-2026-85787 for `awslabs.postgres-mcp-server` before 1.1.7. Broad AWS Labs MCP catalog coverage belongs upstream; this page owns SQL validation, read-only scope enforcement, and content-to-tool injection risk.

[CVE-2026-85787](https://cveawg.mitre.org/api/cve/CVE-2026-85787) and [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-85787) describe an incomplete disallowed-input list in SQL validation. Crafted SQL can be placed into content that an authenticated user later submits to the MCP server, letting an unauthenticated actor influence a tool path that may modify data beyond the intended read-only scope. The CVE recommends upgrading to 1.1.7 or later.

## Security Impact

- Threat: content-to-tool injection bypasses a read-only database-tool boundary.
- Affected boundary: awslabs.postgres-mcp-server before 1.1.7.
- Exploit or incident status: public CVE; no local exploitation evidence is recorded.
- Mitigation state: upgrade to 1.1.7 or later and replace denylist checks with final-query authorization and least-privilege database identities.
- Confidence: high for affected and fixed versions from direct CVE evidence.
- Residual risk: a user-authenticated MCP session can amplify attacker-supplied content when SQL validation is not based on the final executable statement.

## Authoritative Sources

- [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json)
- [CVE-2026-85787](https://cveawg.mitre.org/api/cve/CVE-2026-85787)
- [NVD CVE-2026-85787](https://nvd.nist.gov/vuln/detail/CVE-2026-85787)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [final query authorization for AI data tools](final-query-authorization-for-ai-data-tools.md)

## Open Questions

- Which SQL constructs remain permitted after the 1.1.7 validation change?

## Maintenance Notes

- Created on 2026-09-04 from the [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json).
