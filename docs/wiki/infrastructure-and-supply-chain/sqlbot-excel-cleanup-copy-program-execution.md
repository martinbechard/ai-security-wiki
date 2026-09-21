---
type: "Topic"
title: "SQLBot Excel Cleanup COPY PROGRAM Execution"
description: "Security analysis for CVE-2026-53557 second-order SQL injection reaching PostgreSQL COPY TO PROGRAM in SQLBot."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# SQLBot Excel Cleanup COPY PROGRAM Execution

## Current Understanding

The [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json) adds disclosed vulnerability evidence dated 2026-09-17T21:41:45.155Z: CVE Services published a SQLBot pre-1.9.0 issue where crafted Excel datasource tableName data can reach unsafe identifier use and PostgreSQL COPY PROGRAM execution during cleanup.

The [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) records CVE-2026-53557 for SQLBot before 1.9.0. Broad SQLBot product context belongs upstream; this page owns the local second-order SQL and database-command-execution boundary.

The collector summarizes the issue as second-order SQL injection through Excel datasource cleanup that can invoke PostgreSQL `COPY TO PROGRAM` for command execution.

## Security Impact

- Threat: stored datasource metadata can later become SQL command execution during cleanup.
- Affected boundary: SQLBot before 1.9.0, Excel datasource cleanup, second-order SQL injection, PostgreSQL `COPY TO PROGRAM`, and database role command-execution privileges.
- Exploit or incident status: public CVE record; no local exploitation incident is recorded.
- Mitigation state: upgrade to 1.9.0 or later, parameterize cleanup queries, and ensure AI app database roles cannot invoke `COPY TO PROGRAM`.
- Confidence: high for CVE publication and fixed-version clustering; medium for exact cleanup trigger until a primary advisory is captured.
- Residual risk: RAG/Text-to-SQL ingestion pipelines need delayed-use tests because payloads can execute during cleanup rather than initial upload.

## Authoritative Sources

- [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json)
- [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json)
- [CVE-2026-53557 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-53557)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [final query authorization for AI data tools](../agent-and-tool-security/final-query-authorization-for-ai-data-tools.md)

## Open Questions

- Which SQLBot cleanup jobs run with database roles that can invoke external programs?

## Maintenance Notes

- Updated on 2026-09-20 from the [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json) with in-window disclosed vulnerability evidence while preserving local security-boundary scope.
- Created on 2026-09-18 from the [September 17 topic collector](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) after verifier correction split the SQLBot CVE cluster into focused leaves.
