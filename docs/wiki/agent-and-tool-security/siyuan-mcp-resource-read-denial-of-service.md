---
type: "Topic"
title: "SiYuan MCP Resource-Read Denial of Service"
description: "Security analysis for CVE-2026-123492 in SiYuan MCP resource reads."
tags: ["agent-and-tool-security"]
---

# SiYuan MCP Resource-Read Denial of Service

## Current Understanding

The [November 8 collector source](../../../raw/processed/2026-11-08/ai-security-wiki-topic-news-collector-2026-11-08T003537Z.json) records [CVE-2026-123492 / GHSA-2x3p-x74g-442x](https://github.com/siyuan-note/siyuan/security/advisories/GHSA-2x3p-x74g-442x). In SiYuan through v3.8.8, an authenticated MCP client can request a nonexistent resource through `resources/read`; the `privateCacheMiddleware` error path dereferences a typed nil result and can terminate the kernel process. Broad SiYuan product coverage belongs upstream; this page owns the MCP availability boundary.

## Security Impact

- Threat: an authenticated MCP client can convert an invalid resource read into a process interruption.
- Affected boundary: an initialized, authenticated MCP session and the `resources/read` nonexistent-resource error path; the advisory identifies v3.8.7 and v3.8.8 as affected.
- Exploit or incident status: a public advisory includes a controlled reproduction; no retained evidence establishes unauthenticated compromise, active exploitation, or a local incident.
- Mitigation state: upgrade to v3.8.9 or later and preserve authentication at the MCP boundary; test invalid-resource handling after deployment.
- Confidence: high for the affected and patched version boundaries; medium for operational impact outside the advisory's tested environments.
- Residual risk: authenticated clients remain capable of exercising availability-sensitive MCP paths, and restart policies can mask but do not remove interrupted work.

## Authoritative Sources

- [November 8 collector source](../../../raw/processed/2026-11-08/ai-security-wiki-topic-news-collector-2026-11-08T003537Z.json)
- [CVE-2026-123492 / GHSA-2x3p-x74g-442x](https://github.com/siyuan-note/siyuan/security/advisories/GHSA-2x3p-x74g-442x)
- [SiYuan MCP endpoint authorization risk](https://github.com/siyuan-note/siyuan/security/advisories/GHSA-hp8g-g2qj-wgpj)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP endpoint authorization risk in ai-wiki](https://github.com/martinbechard/ai-wiki/blob/main/docs/wiki/techniques/siyuan-mcp-endpoint-authorization-risk.md)

## Open Questions

- Does SiYuan publish a regression test or release note that describes the v3.8.9 fix beyond the advisory's version boundary?

## Maintenance Notes

- Created on 2026-11-08 from an NVD-timed disclosure. The older GitHub advisory corroborates technical and remediation detail but does not establish the collector's qualifying date.
