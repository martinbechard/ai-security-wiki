---
type: "Topic"
title: "ArcadeDB MCP Server Setting Authorization Bypass"
description: "Security analysis for CVE-2026-75845 role bypass in ArcadeDB MCP server setting changes."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# ArcadeDB MCP Server Setting Authorization Bypass

## Current Understanding

The [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) records CVE-2026-75845 / GHSA-2c26-2qqv-6r9c for ArcadeDB 26.4.2 through 26.7.3. Broad database product context belongs upstream; this page owns the local MCP tool-level least-privilege boundary.

The advisory says any authenticated read-only user can invoke the `set_server_setting` MCP server-level tool when `allowAdmin=true` because `SetServerSettingTool.execute` checks the server setting but not the caller role. ArcadeDB 26.8.1 is listed as fixed.

The [August 21 leaf update watch source](../../../raw/processed/2026-08-21/ai-security-wiki-leaf-update-watch-20260822T000454Z.json) keeps the same affected-version boundary from NVD and advisory mirrors: ArcadeDB 26.4.2 through 26.7.3 are affected, and 26.8.1 is the fixed version. The update does not change the durable control: server-level MCP administration needs per-caller role enforcement even when a global `allowAdmin` setting is enabled.

## Security Impact

- Threat: authentication without role enforcement lets read-only users drive administrative MCP tools.
- Affected boundary: ArcadeDB 26.4.2 through 26.7.3 with MCP server-level setting tools exposed.
- Exploit or incident status: public GitHub advisory and NVD record.
- Mitigation state: upgrade to 26.8.1 and enforce caller role checks at each MCP administrative tool.
- Confidence: high for advisory mechanics, affected versions, and fixed version.
- Residual risk: `allowAdmin` style global configuration does not replace per-caller authorization evidence.

## Authoritative Sources

- [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json)
- [August 21 leaf update watch source](../../../raw/processed/2026-08-21/ai-security-wiki-leaf-update-watch-20260822T000454Z.json)
- [GitHub advisory GHSA-2c26-2qqv-6r9c](https://github.com/advisories/GHSA-2c26-2qqv-6r9c)
- [ArcadeDB advisory GHSA-pff6-hp53-pj54](https://github.com/ArcadeData/arcadedb/security/advisories/GHSA-pff6-hp53-pj54)
- [NVD CVE-2026-75845](https://nvd.nist.gov/vuln/detail/CVE-2026-75845)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MCP tool-level IAM authorization](mcp-tool-level-iam-authorization.md)
- [approval metadata access control](../agent-and-tool-security/approval-metadata-access-control.md)

## Open Questions

- Which MCP clients surface caller role and server-level permission decisions in audit logs?

## Maintenance Notes

- Created on 2026-08-19 from the [August 18 topic collector](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) as an MCP least-privilege advisory leaf.
- Updated on 2026-08-21 from the [August 21 watcher](../../../raw/processed/2026-08-21/ai-security-wiki-leaf-update-watch-20260822T000454Z.json) with repeated NVD/advisory mirror version and fix evidence.
