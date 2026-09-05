---
type: "Topic"
title: "Postgres MCP Pro RangeFunction Bypass"
description: "Security analysis for CVE-2026-85620 restricted-mode SQL validation bypass in Postgres MCP Pro."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# Postgres MCP Pro RangeFunction Bypass

## Current Understanding

The [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json) records CVE-2026-85620 for Postgres MCP Pro 0.3.0. General PostgreSQL and MCP-server catalog coverage belongs upstream; this page owns the local final-query authorization and SQL-tool containment boundary.

[CVE-2026-85620](https://cveawg.mitre.org/api/cve/CVE-2026-85620) and [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-85620) describe restricted-mode validation that checks function names in ordinary call positions but misses `RangeFunction` nodes in `FROM` clauses. An attacker can use syntax such as a `FROM`-clause call to `pg_read_file` to read arbitrary files despite the intended restricted SQL mode.

## Security Impact

- Threat: final SQL validation misses an alternate AST location for dangerous database functions.
- Affected boundary: Postgres MCP Pro 0.3.0 restricted mode.
- Exploit or incident status: public CVE; no local exploitation evidence is recorded.
- Mitigation state: parse and authorize the fully assembled query across all AST node types before execution.
- Confidence: high for the validation gap from direct CVE evidence; fixed-version detail remains an open confirmation item.
- Residual risk: database-backed agent tools can expose host files or privileged database functions even when the natural-language task appears read-only.

## Authoritative Sources

- [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json)
- [CVE-2026-85620](https://cveawg.mitre.org/api/cve/CVE-2026-85620)
- [NVD CVE-2026-85620](https://nvd.nist.gov/vuln/detail/CVE-2026-85620)

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

- Which Postgres MCP Pro version closes CVE-2026-85620 and what parser coverage does the fix add?

## Maintenance Notes

- Created on 2026-09-04 from the [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json).
