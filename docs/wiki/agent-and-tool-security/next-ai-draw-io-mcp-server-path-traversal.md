---
type: "Topic"
title: "next-ai-draw-io MCP Server Path Traversal"
description: "Security analysis for CVE-2026-50757, where an MCP export tool can write outside the intended workspace."
---

# next-ai-draw-io MCP Server Path Traversal

## Current Understanding

The [July 22 topic news collector source](../../../raw/processed/2026-07-22/ai-security-wiki-topic-news-collector-2026-07-22T193242-0400.json) records CVE-2026-50757 for next-ai-draw-io 0.4.13. [GitHub issue 754](https://github.com/DayuanJiang/next-ai-draw-io/issues/754) describes unrestricted path handling in the `@next-ai-drawio/mcp-server` `export_diagram` tool, allowing an MCP client or prompt-influenced agent to write files outside the intended working directory.

The [npm package metadata](https://www.npmjs.com/package/@next-ai-drawio/mcp-server) checked during ingest showed `@next-ai-drawio/mcp-server` versions newer than the issue's affected 0.1.16 line, but the raw source did not identify the first fixed version. The [July 24 leaf update watch source](../../../raw/processed/2026-07-24/ai-security-wiki-leaf-update-watch-2026-07-24T200235-0400.json) adds [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-50757) classification as CWE-22, CISA-ADP CVSS 7.8, and SSVC exploitation none. The local security boundary is [agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md) for MCP tools.

## Security Impact

- Threat: prompt injection, a malicious MCP client, or crafted diagram content can influence a tool call that writes outside the expected workspace.
- Affected boundary: next-ai-draw-io 0.4.13 and `@next-ai-drawio/mcp-server` through the issue's affected 0.1.16 line; `export_diagram` path handling.
- Exploit or incident status: public CVE and [GitHub issue 754](https://github.com/DayuanJiang/next-ai-draw-io/issues/754); [July 23 NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-50757) enrichment records SSVC exploitation none.
- Mitigation state: fixed version is unresolved locally; controls should require base-directory constraints, resolved-path containment checks, hidden-path restrictions, and user confirmation for writes outside allowed directories.
- Confidence: medium-high for path traversal mechanics from [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-50757) and the [linked issue](https://github.com/DayuanJiang/next-ai-draw-io/issues/754); medium for remediation because the first fixed package version was not verified.
- Residual risk: local MCP servers often inherit the user's full filesystem permissions, so path traversal can become project contamination or code execution depending on write target and file interpretation.

## Authoritative Sources

- [July 22 topic news collector source](../../../raw/processed/2026-07-22/ai-security-wiki-topic-news-collector-2026-07-22T193242-0400.json)
- [July 23 leaf update watch source](../../../raw/processed/2026-07-23/ai-security-wiki-leaf-update-watch-2026-07-23T200300-0400.json)
- [July 24 leaf update watch source](../../../raw/processed/2026-07-24/ai-security-wiki-leaf-update-watch-2026-07-24T200235-0400.json)
- NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-50757
- GitHub issue 754: https://github.com/DayuanJiang/next-ai-draw-io/issues/754
- npm package metadata checked during ingest: https://www.npmjs.com/package/@next-ai-drawio/mcp-server

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)
- [infrastructure and supply chain](../infrastructure-and-supply-chain/index.md)
- [threats and attacks](../threats-and-attacks/index.md)
- Upstream AI wiki owns broad MCP server catalog context.

## Open Questions

- Which `@next-ai-drawio/mcp-server` release first fixes CVE-2026-50757?

## Maintenance Notes

- Added from the [July 22, 2026 raw collector artifact](../../../raw/processed/2026-07-22/ai-security-wiki-topic-news-collector-2026-07-22T193242-0400.json), linked [GitHub issue 754](https://github.com/DayuanJiang/next-ai-draw-io/issues/754), and [package metadata checks](https://www.npmjs.com/package/@next-ai-drawio/mcp-server); enriched from the [July 23 leaf watcher](../../../raw/processed/2026-07-23/ai-security-wiki-leaf-update-watch-2026-07-23T200300-0400.json) and [July 24 leaf watcher](../../../raw/processed/2026-07-24/ai-security-wiki-leaf-update-watch-2026-07-24T200235-0400.json) with [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-50757) CWE/CVSS and exploitation-status evidence.
