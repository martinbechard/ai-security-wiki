---
type: "Topic"
title: "ArcadeDB AI Chat query_database Authorization"
description: "Security analysis for CVE-2026-93595 tenant authorization bypass in ArcadeDB AI chat query_database tool execution."
tags: ["identity-and-access", "agent-and-tool-security", "data-and-privacy"]
---

# ArcadeDB AI Chat query_database Authorization

## Current Understanding

The [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json) adds disclosed vulnerability evidence dated 2026-09-18T13:20:07.472Z: CVE Services published an ArcadeDB AI chat authorization bypass in the query_database tool before 26.9.1, where missing authenticated-principal binding causes ACL checks to no-op.

The [September 19 topic collector source](../../../raw/processed/2026-09-19/ai-security-wiki-topic-news-collector-2026-09-19T233221Z.json) records [CVE-2026-93595](https://cveawg.mitre.org/api/cve/CVE-2026-93595) for ArcadeDB before 26.9.1. Broad ArcadeDB product context belongs upstream; this page owns the local AI-chat database-tool authorization and tenant-boundary issue.

The advisory evidence says the AI chat `query_database` tool can execute database queries without binding the authenticated principal to `DatabaseContext`. That makes natural-language database access a privileged execution path: the chat tool must carry the same tenant, role, and object-scope checks as direct database APIs.

## Security Impact

- Threat: an AI chat database tool can bypass per-tenant authorization when execution context is not bound to the authenticated principal.
- Affected boundary: ArcadeDB before 26.9.1; AI chat endpoints, `query_database`, and `DatabaseContext` authorization binding.
- Exploit or incident status: public CVE and GitHub advisory evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade to ArcadeDB 26.9.1 or later and require server-side principal and tenant binding before tool execution.
- Confidence: high for CVE timing, affected boundary, and fixed-version signal from the collector source.
- Residual risk: text-to-database tools can appear separate from ordinary API routes, so every tool invocation needs explicit identity propagation and audit evidence.

## Authoritative Sources

- [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json)
- [September 19 topic collector source](../../../raw/processed/2026-09-19/ai-security-wiki-topic-news-collector-2026-09-19T233221Z.json)
- [CVE-2026-93595 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-93595)
- [ArcadeDB advisory GHSA-chrr-vr3p-crcc](https://github.com/ArcadeData/arcadedb/security/advisories/GHSA-chrr-vr3p-crcc)
- [VulnCheck ArcadeDB advisory](https://www.vulncheck.com/advisories/arcadedb-before-26.9.1-acl-bypass-via-query-database-tool)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MCP tool-level IAM authorization](mcp-tool-level-iam-authorization.md)
- [ArcadeDB MCP Server Setting Authorization Bypass](arcadedb-mcp-server-setting-authorization-bypass.md)
- [final query authorization for AI data tools](../agent-and-tool-security/final-query-authorization-for-ai-data-tools.md)

## Open Questions

- Which ArcadeDB audit records prove that AI chat tool execution carries the caller principal and tenant scope into `DatabaseContext`?

## Maintenance Notes

- Updated on 2026-09-20 from the [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json) with in-window disclosed vulnerability evidence while preserving local security-boundary scope.
- Created on 2026-09-20 from the [September 19 topic collector source](../../../raw/processed/2026-09-19/ai-security-wiki-topic-news-collector-2026-09-19T233221Z.json) as a focused AI chat database-tool authorization leaf.
