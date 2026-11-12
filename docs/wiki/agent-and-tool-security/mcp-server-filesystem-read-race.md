---
type: "Topic"
title: "MCP Filesystem Server Read Race"
description: "Security analysis for GHSA-p9cv-8g75-4xcg, a TOCTOU escape from allowed-directory read confinement."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# MCP Filesystem Server Read Race

## Current Understanding

[GHSA-p9cv-8g75-4xcg](https://github.com/modelcontextprotocol/servers/security/advisories/GHSA-p9cv-8g75-4xcg), captured in the [November 11 collector source](../../../raw/processed/2026-11-11/ai-security-wiki-topic-news-collector-2026-11-11T193154-0500.json), reports a symlink-swap race between validation and `read_text_file` access in `@modelcontextprotocol/server-filesystem`. Broad [MCP reference-server coverage](../../../upstream-ai-wiki/mcp-servers/modelcontextprotocol-reference-servers.md) belongs upstream; this page owns the local read-confinement boundary.

The reporter-authored advisory says version 2.1.0 can return a known outside file after a local process swaps a validated directory for a symlink. The advisory API marks 2.3.0 as patched, but the maintainer release tagged `v2.3.0` lists filesystem package 2.2.0; remediation status therefore remains unresolved.

## Security Impact

- Threat: a local process races an allowed path into an outside file read returned to the MCP client.
- Affected boundary: `@modelcontextprotocol/server-filesystem` allowed-directory reads, especially `read_text_file`.
- Exploit or incident status: public reproduction in the reporter-authored advisory; no active-exploitation incident is recorded.
- Mitigation state: do not rely on a claimed 2.3.0 package fix until a matching package release is verified; isolate writable allowed trees and use descriptor-anchored reads.
- Confidence: high for the reported boundary; medium for affected-range and patched-version claims pending maintainer reconciliation.
- Residual risk: path validation before a separate path-based open cannot preserve filesystem authority under concurrent mutation.

## Authoritative Sources

- [November 11 collector source](../../../raw/processed/2026-11-11/ai-security-wiki-topic-news-collector-2026-11-11T193154-0500.json)
- [GHSA-p9cv-8g75-4xcg](https://github.com/modelcontextprotocol/servers/security/advisories/GHSA-p9cv-8g75-4xcg)
- [v2.3.0 release](https://github.com/modelcontextprotocol/servers/releases/tag/v2.3.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)

## Open Questions

- Does a published `@modelcontextprotocol/server-filesystem` 2.3.0 exist, and which release contains the descriptor-anchored read fix?

## Maintenance Notes

- Created on 2026-11-11 with an explicit advisory-versus-release reconciliation boundary.
