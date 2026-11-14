---
type: "Topic"
title: "pgEdge Postgres MCP PL/DO SQL Injection"
description: "Security analysis for CVE-2026-126197 custom pl-do tool input interpolation in pgEdge Postgres MCP Server."
tags: ["agent-and-tool-security", "database-security"]
---

# pgEdge Postgres MCP PL/DO SQL Injection

## Current Understanding

The [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json) records [CVE-2026-126197](https://nvd.nist.gov/vuln/detail/CVE-2026-126197): before 1.1.0, custom pgEdge Postgres MCP Server `pl-do` tools could interpolate attacker input into PostgreSQL `DO` blocks. Broad pgEdge context belongs upstream; this leaf owns the custom-tool SQL construction boundary.

## Security Impact

- Threat: tool input becomes executable SQL or procedural code through string interpolation.
- Affected boundary: pgEdge Postgres MCP Server custom `pl-do` tools before 1.1.0.
- Exploit or incident status: public CVE disclosure; no active exploitation or local incident is established.
- Mitigation state: upgrade to 1.1.0 or later, parameterize SQL inputs, constrain database roles, and review custom tool definitions.
- Confidence: high from the NVD-backed advisory set and upstream release reference.
- Residual risk: custom database tools can exceed intended capability if their grants and parameter handling diverge.

## Authoritative Sources

- [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json)
- [NVD CVE-2026-126197](https://nvd.nist.gov/vuln/detail/CVE-2026-126197)
- [pgEdge Postgres MCP Server 1.1.0](https://github.com/pgEdge/pgedge-postgres-mcp/releases/tag/v1.1.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [pgEdge Postgres MCP read-only SQL bypass](pgedge-postgres-mcp-read-only-sql-bypass.md)

## Open Questions

- Does the 1.1.0 repair parameterize every custom `pl-do` input path and reject unsafe tool definitions?

## Maintenance Notes

- Created on 2026-11-13 as a distinct code-construction boundary.
