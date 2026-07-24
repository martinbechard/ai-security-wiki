---
type: "Topic"
title: "Agent Tool Filesystem Path Containment"
description: "Security controls for constraining file paths used by agent tools and environment-management features."
---

# Agent Tool Filesystem Path Containment

## Current Understanding

Agent tool filesystem path containment keeps model-influenced or caller-controlled paths inside an intended directory boundary. The control applies to local MCP tools such as [next-ai-draw-io MCP server path traversal](../agent-and-tool-security/next-ai-draw-io-mcp-server-path-traversal.md) and to persistent runtime features such as [Network-AI environment restore path traversal](network-ai-environment-restore-path-traversal.md).

The durable rule is to authorize the resolved path, not the raw string. `..`, absolute paths, symlinks, extension appends, and backup IDs can all move the actual filesystem target outside the human-visible intent. The [July 23 leaf update watch source](../../../raw/processed/2026-07-23/ai-security-wiki-leaf-update-watch-2026-07-23T200300-0400.json) reinforces this from the Network-AI restore issue: containment must be checked after joining user-controlled identifiers, not only before path assembly.

## Control Implications

- Resolve paths against an explicit base directory and verify the result remains inside that base before read, write, copy, export, or restore.
- Reject path separators or traversal tokens for identifiers such as backup IDs when a flat namespace is intended.
- Restrict writes to project, export, or environment directories unless a human grants a broader path.
- Avoid writing hidden files or configuration paths from model-controlled tool parameters.
- Test traversal, absolute-path, symlink, and cross-project cases for every file-capable agent tool.

## Authoritative Sources

- [next-ai-draw-io MCP server path traversal](../agent-and-tool-security/next-ai-draw-io-mcp-server-path-traversal.md)
- [Network-AI environment restore path traversal](network-ai-environment-restore-path-traversal.md)
- [July 22 topic news collector source](../../../raw/processed/2026-07-22/ai-security-wiki-topic-news-collector-2026-07-22T193242-0400.json)
- [July 23 leaf update watch source](../../../raw/processed/2026-07-23/ai-security-wiki-leaf-update-watch-2026-07-23T200300-0400.json)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [threats and attacks](../threats-and-attacks/index.md)

## Open Questions

- Which local MCP clients expose user-visible consent metadata for file writes outside an expected base directory?

## Maintenance Notes

- Created as a reusable control leaf during July 22, 2026 raw-source ingest; enriched from the [July 23 leaf watcher](../../../raw/processed/2026-07-23/ai-security-wiki-leaf-update-watch-2026-07-23T200300-0400.json) with post-join containment evidence.
