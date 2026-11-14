---
type: "Topic"
title: "pgEdge Postgres MCP Read-Only SQL Bypass"
description: "Security analysis for CVE-2026-126196 simple-query execution outside pgEdge read-only statement recognition."
tags: ["agent-and-tool-security", "database-security"]
---

# pgEdge Postgres MCP Read-Only SQL Bypass

## Current Understanding

The [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json) records [CVE-2026-126196](https://nvd.nist.gov/vuln/detail/CVE-2026-126196): before 1.1.0, pgEdge Postgres MCP Server's `read_only` path could route unrecognized statements through PostgreSQL simple-query execution. Broad pgEdge context belongs upstream; this leaf owns the server-side read-only enforcement boundary.

## Security Impact

- Threat: a caller can bypass a read-only expectation through statement classification and execution fallback.
- Affected boundary: pgEdge Postgres MCP Server before 1.1.0 `read_only` SQL execution.
- Exploit or incident status: public CVE disclosure; no active exploitation or local incident is established.
- Mitigation state: upgrade to 1.1.0 or later and enforce database roles that cannot write, independently of tool or statement classification.
- Confidence: high because NVD and the upstream 1.1.0 release are cited by the source.
- Residual risk: client- or server-side intent labels cannot replace database least privilege.

## Authoritative Sources

- [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json)
- [NVD CVE-2026-126196](https://nvd.nist.gov/vuln/detail/CVE-2026-126196)
- [pgEdge Postgres MCP Server 1.1.0](https://github.com/pgEdge/pgedge-postgres-mcp/releases/tag/v1.1.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)

## Open Questions

- Which statement classes and protocol paths are rejected rather than delegated to simple-query execution in 1.1.0?

## Maintenance Notes

- Created on 2026-11-13; this is distinct from injection and confirmation-boundary findings in the same product release.
