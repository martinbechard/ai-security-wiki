---
type: "Topic"
title: "mcp-server-git Repository Boundary Bypasses"
description: "Security analysis for CVE-2025-68143 and CVE-2025-68145 repository path boundary failures in official mcp-server-git."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# mcp-server-git Repository Boundary Bypasses

## Current Understanding

The [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json) records [CVE-2025-68143](https://nvd.nist.gov/vuln/detail/CVE-2025-68143) and [CVE-2025-68145](https://nvd.nist.gov/vuln/detail/CVE-2025-68145) for official Model Context Protocol `mcp-server-git`. Broad MCP server catalog context belongs upstream; this page owns the local repository path containment and neighboring-repository exposure boundary.

CVE-2025-68143 says `git_init` accepted arbitrary filesystem paths and made those directories eligible for later Git operations before the tool was removed. CVE-2025-68145 says `--repository` restrictions did not validate subsequent `repo_path` arguments against the configured repository, allowing operations on other accessible repositories. The records point to upgrades at or after 2025.9.25 and 2025.12.17 respectively.

## Security Impact

- Threat: an apparently repository-scoped MCP Git tool can inspect or mutate other local repositories when path boundaries are not revalidated for every operation.
- Affected boundary: official `mcp-server-git`, `git_init`, `--repository`, later `repo_path` arguments, and local repository filesystem access.
- Exploit or incident status: public NVD records; no local exploitation incident is recorded.
- Mitigation state: remove or avoid `git_init` exposure, upgrade to versions with repository-boundary validation, and enforce final resolved repository paths before executing Git operations.
- Confidence: high for affected versions and boundary shape from NVD text; medium for exact GHSA identifiers until GitHub advisory pages are reconciled.
- Residual risk: source-control MCP servers need path containment and operation-level authorization because Git repositories frequently contain credentials, prompts, build scripts, and release configuration.

## Authoritative Sources

- [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json)
- [NVD CVE-2025-68143](https://nvd.nist.gov/vuln/detail/CVE-2025-68143)
- [NVD CVE-2025-68145](https://nvd.nist.gov/vuln/detail/CVE-2025-68145)
- [Model Context Protocol servers advisories](https://github.com/modelcontextprotocol/servers/security/advisories)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [Agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)
- Upstream AI wiki owns broad MCP server catalog context.

## Open Questions

- Which GitHub advisory identifiers correspond to CVE-2025-68143 and CVE-2025-68145?

## Maintenance Notes

- Created on 2026-10-01 from the [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json).
