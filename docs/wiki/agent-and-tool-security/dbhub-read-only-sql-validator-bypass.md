---
type: "Topic"
title: "DBHub Read-Only SQL Validator Bypass"
description: "Security analysis for CVE-2026-61789 SQL parser disagreement."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# DBHub Read-Only SQL Validator Bypass

## Current Understanding

The [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json) records [CVE-2026-61789](https://nvd.nist.gov/vuln/detail/CVE-2026-61789): [DBHub](../../../upstream-ai-wiki/mcp-servers/dbhub.md) before 0.22.6 parses double-dash comments differently from MySQL and MariaDB, allowing prompt-influenced SQL to hide write or DDL statements from its read-only validator. Broad DBHub catalog context remains upstream; this leaf owns parser-consistency risk.

## Security Impact

- Threat: an apparent read-only agent query executes state-changing database statements.
- Affected boundary: DBHub before 0.22.6, SQL validation, and MySQL or MariaDB parsing.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: upgrade to 0.22.6 or later and enforce database-native read-only privileges.
- Confidence and residual risk: high for parser disagreement; tool-side validation cannot replace database authorization.

## Authoritative Sources

- [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json)
- [NVD CVE-2026-61789](https://nvd.nist.gov/vuln/detail/CVE-2026-61789)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [DBHub read-only database enforcement failure](dbhub-readonly-database-enforcement-failure.md)

## Open Questions

- Does the 0.22.6 fix use a dialect-aware parser or rely solely on database roles?

## Maintenance Notes

- Created on 2026-10-30 as a parser-consistency boundary distinct from connection enforcement.
