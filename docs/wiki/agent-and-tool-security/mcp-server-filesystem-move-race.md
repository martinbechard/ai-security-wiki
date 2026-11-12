---
type: "Topic"
title: "MCP Filesystem Server Same-Device Move Race"
description: "Security analysis for GHSA-7m4x-rv66-mxhh, a TOCTOU escape through same-device file moves."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# MCP Filesystem Server Same-Device Move Race

## Current Understanding

[GHSA-7m4x-rv66-mxhh](https://github.com/modelcontextprotocol/servers/security/advisories/GHSA-7m4x-rv66-mxhh), captured in the [November 11 collector source](../../../raw/processed/2026-11-11/ai-security-wiki-topic-news-collector-2026-11-11T193154-0500.json), reports that `move_file` can re-resolve an already validated source during a same-device rename. Broad [MCP reference-server coverage](../../../upstream-ai-wiki/mcp-servers/modelcontextprotocol-reference-servers.md) belongs upstream; this page owns the tool’s source-path authority boundary.

The reporter advisory distinguishes this path from cross-device copy logic that anchors the source. Its patched-version claim conflicts with the published `v2.3.0` release manifest, which lists filesystem 2.2.0 rather than 2.3.0.

## Security Impact

- Threat: a local process swaps a source parent with an outside-pointing symlink so a protected file becomes readable through the allowed destination.
- Affected boundary: `@modelcontextprotocol/server-filesystem` `move_file` same-device rename path.
- Exploit or incident status: public reporter reproduction; no active-exploitation incident is recorded.
- Mitigation state: keep allowed source trees free of untrusted concurrent writers and require a verified package release before treating the advisory’s patch claim as deployed.
- Confidence: high for the reported race; medium for exact range and remediation state.
- Residual risk: validated destinations do not constrain a separately re-resolved source path.

## Authoritative Sources

- [November 11 collector source](../../../raw/processed/2026-11-11/ai-security-wiki-topic-news-collector-2026-11-11T193154-0500.json)
- [GHSA-7m4x-rv66-mxhh](https://github.com/modelcontextprotocol/servers/security/advisories/GHSA-7m4x-rv66-mxhh)
- [v2.3.0 release](https://github.com/modelcontextprotocol/servers/releases/tag/v2.3.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP filesystem server read race](mcp-server-filesystem-read-race.md)

## Open Questions

- Does a published filesystem 2.3.0 fix same-device source pinning as well as read-path pinning?

## Maintenance Notes

- Created on 2026-11-11 with an explicit advisory-versus-release reconciliation boundary.
