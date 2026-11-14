---
type: "Topic"
title: "pgEdge Postgres MCP Write-Confirmation Binding"
description: "Security analysis for CVE-2026-126198 client confirmation based on pgEdge tool names instead of write annotations."
tags: ["agent-and-tool-security", "approval-security"]
---

# pgEdge Postgres MCP Write-Confirmation Binding

## Current Understanding

The [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json) records [CVE-2026-126198](https://nvd.nist.gov/vuln/detail/CVE-2026-126198): before 1.1.0, bundled pgEdge Postgres MCP clients based write confirmation on a tool name rather than write annotations. This is a client approval-control defect, not server authorization; broad pgEdge coverage belongs upstream.

## Security Impact

- Threat: a write-capable tool can evade an expected confirmation flow when its name does not encode write intent.
- Affected boundary: bundled pgEdge Postgres MCP clients before 1.1.0.
- Exploit or incident status: public CVE disclosure; no active exploitation or local incident is established.
- Mitigation state: upgrade to 1.1.0 or later, bind confirmation to authoritative capability metadata, and enforce write limits server-side and in database roles.
- Confidence: high from the NVD-backed advisory set and upstream release reference.
- Residual risk: confirmation is a user-interface control and cannot replace server or database authorization.

## Authoritative Sources

- [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json)
- [NVD CVE-2026-126198](https://nvd.nist.gov/vuln/detail/CVE-2026-126198)
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

- Which client releases consume write annotations as the confirmation authority, and how are unknown annotations handled?

## Maintenance Notes

- Created on 2026-11-13; approval is intentionally documented separately from database authorization.
