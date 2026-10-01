---
type: "Topic"
title: "MCPVault Case Canonical Path Filtering"
description: "Security analysis for CVE-2026-57441 case-sensitive and non-canonical path filtering in MCPVault."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# MCPVault Case Canonical Path Filtering

## Current Understanding

The [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json) records [CVE-2026-57441](https://nvd.nist.gov/vuln/detail/CVE-2026-57441) for MCPVault. Broad MCPVault and Obsidian context belongs upstream; this page owns the local canonical path filtering boundary for vault and repository metadata.

The source says case-sensitive and non-canonical path filtering lets case variants or Windows trailing dots/spaces reach restricted `.git`, `.obsidian`, or `node_modules` directories on case-insensitive filesystems. Existing [MCPVault recursive metadata path filtering](mcpvault-recursive-metadata-path-filtering.md) owns CVE-2026-57442 for nested restricted segments; this page keeps the filesystem-normalization issue separate.

## Security Impact

- Threat: path filters can miss metadata directories when the requested path differs from the filesystem's final canonical spelling.
- Affected boundary: MCPVault before 0.11.4, `PathFilter`, case-insensitive filesystems, Windows trailing dot or space normalization, `.git`, `.obsidian`, and `node_modules`.
- Exploit or incident status: public NVD record; no local exploitation incident is recorded.
- Mitigation state: upgrade to 0.11.4 or later and validate final canonical paths with filesystem-specific normalization before any read, write, move, search, or list action.
- Confidence: high for vulnerable behavior and fixed version from NVD; medium for release-tag detail until upstream release evidence is checked.
- Residual risk: vault-backed MCP tools need platform-aware canonicalization because model-selected paths may be crafted for the user's operating system.

## Authoritative Sources

- [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json)
- [NVD CVE-2026-57441](https://nvd.nist.gov/vuln/detail/CVE-2026-57441)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCPVault recursive metadata path filtering](mcpvault-recursive-metadata-path-filtering.md)
- [Agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)
- Upstream AI wiki owns broad MCPVault and Obsidian context.

## Open Questions

- Which MCPVault release evidence confirms the CVE-2026-57441 fix in 0.11.4?

## Maintenance Notes

- Created on 2026-10-01 from the [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json).
