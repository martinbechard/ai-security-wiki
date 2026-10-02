---
type: "Topic"
title: "Office PowerPoint MCP Server Path Traversal"
description: "Security analysis for CVE-2025-71427 file read and write path traversal in Office-PowerPoint-MCP-Server."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# Office PowerPoint MCP Server Path Traversal

## Current Understanding

The [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json) records [CVE-2025-71427](https://cveawg.mitre.org/api/cve/CVE-2025-71427) for Office-PowerPoint-MCP-Server through 2.0.7. Broad PowerPoint automation context belongs upstream if needed; this page owns the local MCP file read/write path boundary.

The source says MCP callers can read and write files outside the intended working directory by supplying absolute paths or `../` sequences. Document automation servers often run near user workspaces, making path containment a data and tool-authority boundary rather than only a filesystem bug.

## Security Impact

- Threat: delegated MCP callers can escape the working directory and read or write unrelated files.
- Affected boundary: Office-PowerPoint-MCP-Server through 2.0.7; MCP file read/write operations and path normalization.
- Exploit or incident status: public CVE record; no confirmed exploitation is recorded in the source.
- Mitigation state: fixed-version detail requires primary repository or advisory confirmation; operators should canonicalize paths, reject absolute paths, enforce root containment after symlink resolution, and minimize server filesystem permissions.
- Confidence: medium-high for CVE timing and class; medium for patch status until repository references are captured.
- Residual risk: MCP document tools should treat every file argument as untrusted and enforce path allowlists at the final resolved path.

## Authoritative Sources

- [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json)
- [CVE-2025-71427 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2025-71427)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [browse-mcp file path boundary](browse-mcp-file-path-boundary.md)
- [mcp-file-context-server path traversal](mcp-file-context-server-path-traversal.md)
- [data and privacy](../data-and-privacy/index.md)

## Open Questions

- Which upstream repository, advisory, or release note identifies the fixed version for CVE-2025-71427?

## Maintenance Notes

- Created on 2026-10-02 from the [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json).
