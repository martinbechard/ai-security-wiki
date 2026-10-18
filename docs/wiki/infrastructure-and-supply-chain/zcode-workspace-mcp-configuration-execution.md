---
type: "Topic"
title: "ZCode Workspace MCP Configuration Execution"
description: "Security analysis for CVE-2026-88755 repository workspace configuration automatically connecting attacker-controlled MCP servers."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# ZCode Workspace MCP Configuration Execution

## Current Understanding

The [October 17 topic collector source](../../../raw/processed/2026-10-17/ai-security-wiki-topic-news-collector-2026-10-17T193139-0400.json) records [CVE-2026-88755](https://nvd.nist.gov/vuln/detail/CVE-2026-88755): Z.ai ZCode 3.11.2.6792 automatically connects to MCP servers declared in a repository workspace configuration. Opening a crafted repository can therefore grant attacker-supplied server commands execution authority. General ZCode coverage belongs upstream; this page owns the repository-configuration supply-chain boundary.

## Security Impact

- Affected boundary: workspace-declared MCP servers in ZCode 3.11.2.6792.
- Exploit or incident status: public CVE; no exploitation is reported by the source.
- Mitigation state: require an explicit trust and command-review decision before connecting repository-declared servers; no fixed version is established by the source.
- Confidence: high for automatic connection and execution impact; residual risk remains in alternate workspace import paths.

## Authoritative Sources

- [October 17 topic collector source](../../../raw/processed/2026-10-17/ai-security-wiki-topic-news-collector-2026-10-17T193139-0400.json)
- [CVE-2026-88755](https://nvd.nist.gov/vuln/detail/CVE-2026-88755)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [Junie CLI untrusted-project MCP configuration execution](junie-cli-untrusted-project-mcp-configuration-execution.md)

## Open Questions

- Which ZCode release changes automatic workspace MCP connection behavior?

## Maintenance Notes

- Created on 2026-10-17 from CVE-2026-88755.
