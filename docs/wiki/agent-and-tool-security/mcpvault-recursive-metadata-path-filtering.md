---
type: "Topic"
title: "MCPVault Recursive Metadata Path Filtering"
description: "Security analysis for CVE-2026-57442 nested metadata directory bypasses in MCPVault path filters."
tags: ["agent-and-tool-security", "data-and-privacy", "infrastructure-and-supply-chain"]
---

# MCPVault Recursive Metadata Path Filtering

## Current Understanding

The [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) records CVE-2026-57442 for MCPVault before 0.11.5. Broad MCPVault and Obsidian context belongs upstream; this page owns the local recursive file-policy boundary for agent-selected paths.

The CVE says MCPVault used root-anchored deny-list patterns in `PathFilter`, so nested `.git`, `.obsidian`, and `node_modules` segments did not match restrictions. An attacker influencing an AI agent's selected path could read nested repository or Obsidian metadata, embedded tokens, or pollute tag indexing.

## Security Impact

- Threat: model- or attacker-influenced file paths can bypass root-only metadata filters and expose repository, note-vault, or package metadata.
- Affected boundary: MCPVault before 0.11.5, `PathFilter`, nested metadata directories, tag indexing, and file-read tools.
- Exploit or incident status: public CVE record; no local exploitation incident is recorded.
- Mitigation state: upgrade to 0.11.5 or later and enforce recursive metadata-directory filtering after path normalization.
- Confidence: high for CVE publication, affected version, and bypass shape.
- Residual risk: deny-list policies fail quietly when agents can select nested paths; allowlisted roots still need recursive sensitive-path controls.

## Authoritative Sources

- [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json)
- [CVE-2026-57442 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-57442)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP data movement exposure controls](../data-and-privacy/mcp-data-movement-exposure-controls.md)
- [Agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)

## Open Questions

- Which MCP file servers use root-only deny-list patterns for metadata folders that can reappear below allowed roots?

## Maintenance Notes

- Created on 2026-09-18 from the [September 17 topic collector](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) as a recursive metadata path-filtering leaf.
