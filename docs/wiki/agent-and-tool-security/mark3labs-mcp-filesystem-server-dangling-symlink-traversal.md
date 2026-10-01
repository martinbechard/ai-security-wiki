---
type: "Topic"
title: "mark3labs mcp-filesystem-server Dangling Symlink Traversal"
description: "Security analysis for CVE-2026-79534, where dangling symlinks bypass allowed-directory checks in mark3labs mcp-filesystem-server."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# mark3labs mcp-filesystem-server Dangling Symlink Traversal

## Current Understanding

The [September 29 topic collector source](../../../raw/processed/2026-09-29/ai-security-wiki-topic-news-collector-2026-09-29T233133Z.json) records [CVE-2026-79534](https://nvd.nist.gov/vuln/detail/CVE-2026-79534) for `mark3labs mcp-filesystem-server` v0.11.1. Broad MCP filesystem server catalog context belongs upstream; this page owns the local allowed-directory containment failure.

The source says `validatePath` mishandles dangling symlinks. File-writing tools can follow a symlink inside an allowed directory and create or modify files outside configured allowed directories, turning delegated file-write authority into broader host filesystem mutation.

The [September 30 leaf update watch source](../../../raw/processed/2026-09-30/ai-security-wiki-leaf-update-watch-20261001T000313Z.json) corroborates CVE Services publication/update evidence and preserves the open fixed-release question.

## Security Impact

- Threat: MCP file-write tools can escape configured roots through dangling symlink behavior.
- Affected boundary: `mark3labs mcp-filesystem-server` v0.11.1; `validatePath`; allowed directory containment for file creation and modification.
- Exploit or incident status: public NVD entry and Traceforce advisory; no active exploitation was identified in the collector source.
- Mitigation state: avoid affected builds, reject dangling symlinks, resolve parent directories before creation, and enforce final path containment after write-target resolution.
- Confidence: high for affected version and path-containment boundary from NVD and Traceforce; medium for fixed-version status because the collector did not identify a patched release.
- Residual risk: create-before-resolve and parent-symlink handling are recurring file-tool hazards across local MCP servers.

## Authoritative Sources

- [September 29 topic collector source](../../../raw/processed/2026-09-29/ai-security-wiki-topic-news-collector-2026-09-29T233133Z.json)
- [September 30 leaf update watch source](../../../raw/processed/2026-09-30/ai-security-wiki-leaf-update-watch-20261001T000313Z.json)
- [CVE-2026-79534 NVD entry](https://nvd.nist.gov/vuln/detail/CVE-2026-79534)
- [Traceforce advisory](https://www.traceforce.ai/security-advisories/cve-2026-79534)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [mcp-file-context-server path traversal](mcp-file-context-server-path-traversal.md)
- [chrome-devtools-mcp symlink root bypass](chrome-devtools-mcp-symlink-root-bypass.md)
- [Google MCP Toolbox allowedLocalRoots symlink bypass](google-mcp-toolbox-allowedlocalroots-symlink-bypass.md)
- Upstream AI wiki owns broad MCP filesystem server catalog context.

## Open Questions

- Which mark3labs mcp-filesystem-server release fixes CVE-2026-79534?

## Maintenance Notes

- Created on 2026-09-30 from the [September 29 topic collector source](../../../raw/processed/2026-09-29/ai-security-wiki-topic-news-collector-2026-09-29T233133Z.json) after routing general MCP server catalog context upstream.
- Updated on 2026-10-01 from the [September 30 leaf update watch source](../../../raw/processed/2026-09-30/ai-security-wiki-leaf-update-watch-20261001T000313Z.json) with CVE Services provenance and no duplicate digest item.
