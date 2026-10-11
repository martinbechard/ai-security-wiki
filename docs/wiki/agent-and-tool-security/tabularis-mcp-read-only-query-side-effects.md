---
type: "Topic"
title: "Tabularis MCP Read-Only Query Side Effects"
description: "Security analysis for CVE-2026-108604 read-only database gate bypass in Tabularis MCP run_query."
tags: ["agent-and-tool-security"]
---

# Tabularis MCP Read-Only Query Side Effects

## Current Understanding

The [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) records [CVE-2026-108604](https://cveawg.mitre.org/api/cve/CVE-2026-108604) for Tabularis through 0.27.0. Broad Tabularis context belongs upstream; this page owns read-only tool enforcement and database side-effect bypass analysis.

Prompt-injected agents or untrusted MCP clients can submit side-effecting `SELECT` statements. The collector names PostgreSQL examples including:

- `setval`,
- `nextval`, and
- `query_to_xml` with embedded `DELETE`.

Lexical read-only gates are insufficient when database functions can mutate state or execute nested statements.

## Security Impact

- Threat: a read-only MCP database tool can modify data without approval prompts.
- Affected boundary: Tabularis through 0.27.0, MCP `run_query`, PostgreSQL functions, approval prompts, and database privileges.
- Exploit or incident status: public CVE Services and NVD evidence; no confirmed exploitation incident is recorded locally.
- Mitigation state: patch the application gate, enforce read-only roles at the database layer, block known side-effecting functions, and require approval for ambiguous statements.
- Confidence: high for the authorization flaw; medium for data impact because database privileges control final mutation scope.
- Residual risk: database MCP tools need final-query authorization plus database-enforced least privilege, not just SQL verb filtering.

## Authoritative Sources

- [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json)
- [CVE-2026-108604 record](https://cveawg.mitre.org/api/cve/CVE-2026-108604)
- [NVD CVE-2026-108604](https://nvd.nist.gov/vuln/detail/CVE-2026-108604)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [final query authorization for AI data tools](final-query-authorization-for-ai-data-tools.md)
- [DBHub read-only database enforcement failure](dbhub-readonly-database-enforcement-failure.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-10-11 from the [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) after upstream index routing kept broad product and framework context outside the local security wiki.
