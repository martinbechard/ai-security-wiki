---
type: "Topic"
title: "DBHub Readonly Database Enforcement Failure"
description: "Security analysis for CVE-2026-61788, where DBHub read-only mode relied on SQL keyword classification instead of database connection enforcement."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# DBHub Readonly Database Enforcement Failure

## Current Understanding

The [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) records [CVE-2026-61788](https://cveawg.mitre.org/api/cve/CVE-2026-61788) for DBHub before 0.22.6. Broad [DBHub](../../../upstream-ai-wiki/mcp-servers/dbhub.md) MCP server cataloging and general database-agent workflow belongs upstream; this page owns the local database-native read-only enforcement boundary.

Before 0.22.6, setting `readonly = true` on the `execute_sql` tool did not make the database connection read-only because connector read-only setup was gated on an unpopulated config value. The remaining guard classified the first SQL keyword, allowing side-effecting `SELECT` statements through.

## Security Impact

- Threat: callers can write or trigger database side effects despite DBHub read-only mode.
- Affected boundary: DBHub before 0.22.6, `execute_sql`, read-only connection setup, and database roles across Postgres, MySQL, SQL Server, Oracle, MariaDB, and SQLite.
- Exploit or incident status: public CVE, NVD, and GitHub Security Advisory evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: upgrade to 0.22.6 or later, enforce read-only at the database role and connection layer, and avoid privileged database users for MCP tools.
- Confidence: high for affected version and bypass class; medium for database-specific write impact outside PostgreSQL examples.
- Residual risk: SQL keyword classifiers are not a least-privilege substitute for database-native authorization.

## Authoritative Sources

- [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json)
- [CVE-2026-61788 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-61788)
- [NVD CVE-2026-61788](https://nvd.nist.gov/vuln/detail/CVE-2026-61788)
- [GHSA-mwwr-p57h-56pf](https://github.com/bytebase/dbhub/security/advisories/GHSA-mwwr-p57h-56pf)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [DBHub HTTP transport DNS rebinding](dbhub-http-transport-dns-rebinding.md)
- [final query authorization for AI data tools](final-query-authorization-for-ai-data-tools.md)

## Open Questions

- Which DBHub connector implementations besides PostgreSQL and SQLite lacked database-native read-only enforcement before 0.22.6?

## Maintenance Notes

- Created on 2026-09-25 from the [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) after splitting DBHub read-only enforcement from HTTP transport DNS rebinding.
