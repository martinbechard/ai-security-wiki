---
type: "Topic"
title: "Google MCP Toolbox allowedLocalRoots Symlink Bypass"
description: "Security analysis for CVE-2026-102242, where symlink resolution bypasses allowedLocalRoots in Google MCP Toolbox."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# Google MCP Toolbox allowedLocalRoots Symlink Bypass

## Current Understanding

The [September 29 topic collector source](../../../raw/processed/2026-09-29/ai-security-wiki-topic-news-collector-2026-09-29T233133Z.json) records [CVE-2026-102242](https://nvd.nist.gov/vuln/detail/CVE-2026-102242) for [Google](../../../upstream-ai-wiki/companies/google-ai.md) [MCP Toolbox for Databases](../../../upstream-ai-wiki/mcp-servers/mcp-toolbox-for-databases.md) versions 1.2.0 through 1.9.0. General Google and MCP Toolbox product context belongs upstream; this page owns the local symlink boundary, delegated tool authority, and filesystem exposure risk.

The source says an authenticated remote attacker with tool execution permissions could use improper symlink resolution to bypass `allowedLocalRoots` restrictions, then access or overwrite local files outside configured roots. [Google PR 3810](https://github.com/googleapis/mcp-toolbox/pull/3810) is the linked vendor patch candidate, but the first fixed release still needs release-note confirmation.

## Security Impact

- Threat: delegated MCP tool execution can cross configured local filesystem roots when symlinks are resolved after or outside the containment check.
- Affected boundary: Google MCP Toolbox for Databases 1.2.0 through 1.9.0; `allowedLocalRoots`; local filesystem read and write authority reachable through database tools.
- Exploit or incident status: public NVD entry with linked vendor pull request; no public exploitation was identified in the collector source.
- Mitigation state: upgrade to a release containing the [Google PR 3810](https://github.com/googleapis/mcp-toolbox/pull/3810) fix and regression-test symlink, dangling-symlink, and final-realpath containment.
- Confidence: high for the affected range and tool-authority boundary from NVD; medium for the fixed release until vendor release notes identify the first patched version.
- Residual risk: other MCP file or database tools can repeat the issue if they validate requested paths but execute against a different resolved path.

## Authoritative Sources

- [September 29 topic collector source](../../../raw/processed/2026-09-29/ai-security-wiki-topic-news-collector-2026-09-29T233133Z.json)
- [CVE-2026-102242 NVD entry](https://nvd.nist.gov/vuln/detail/CVE-2026-102242)
- [Google PR 3810](https://github.com/googleapis/mcp-toolbox/pull/3810)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Google MCP Toolbox BigQuery forecast boundary bypass](google-mcp-toolbox-bigquery-forecast-boundary-bypass.md)
- [final query authorization for AI data tools](final-query-authorization-for-ai-data-tools.md)
- [data and privacy](../data-and-privacy/index.md)
- Upstream AI wiki owns broad Google and MCP Toolbox product context.

## Open Questions

- Which Google MCP Toolbox release first includes the CVE-2026-102242 symlink-resolution fix from PR 3810?

## Maintenance Notes

- Created on 2026-09-30 from the [September 29 topic collector source](../../../raw/processed/2026-09-29/ai-security-wiki-topic-news-collector-2026-09-29T233133Z.json) after routing general MCP Toolbox product context upstream.
