---
type: "Topic"
title: "djust MCP Template-Path Readability Oracle"
description: "Security analysis for CVE-2026-113731 path-boundary disclosure in the djust local MCP server."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# djust MCP Template-Path Readability Oracle

## Current Understanding

The [October 21 topic collector source](../../../raw/processed/2026-10-21/ai-security-wiki-topic-news-collector-2026-10-21T193103-0400.json) records [CVE-2026-113731](https://nvd.nist.gov/vuln/detail/CVE-2026-113731) / [GHSA-r57g-mc79-8hj2](https://github.com/djust-org/djust/security/advisories/GHSA-r57g-mc79-8hj2). Broad djust and MCP coverage belongs upstream; this leaf owns the local tool's workspace-path capability boundary.

## Security Impact

- Threat: `find_handlers_for_template` accepts a readable absolute path outside configured templates and reveals file existence, readability, and matching snippets.
- Affected boundary: djust 0.9.0 before 1.0.10, 1.1.7, 1.2.4, or 1.3.0rc8; local stdio MCP clients running as the same operating-system user.
- Exploit or incident status: public GitHub advisory and NVD record; no local exploitation incident is recorded.
- Mitigation state: upgrade to the applicable fixed release and enforce canonical path containment before reading.
- Confidence: high for scope and fixed versions from maintainer-linked references.
- Residual risk: a local transport or same-user client is not automatically entitled to all readable files.

## Authoritative Sources

- [October 21 topic collector source](../../../raw/processed/2026-10-21/ai-security-wiki-topic-news-collector-2026-10-21T193103-0400.json)
- [October 23 leaf update watch source](../../../raw/processed/2026-10-23/ai-security-wiki-leaf-update-watch-20261023T000535Z.json)
- [GitHub advisory GHSA-r57g-mc79-8hj2](https://github.com/djust-org/djust/security/advisories/GHSA-r57g-mc79-8hj2)
- [NVD CVE-2026-113731](https://nvd.nist.gov/vuln/detail/CVE-2026-113731)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [browse-mcp file path boundary](browse-mcp-file-path-boundary.md)

## Open Questions

- Do local djust deployments expose the tool to untrusted editor extensions or other same-user processes?

## Maintenance Notes

- Updated on 2026-10-23 with watcher provenance; no distinct security delta was reported.
- Created on 2026-10-21 from the October 21 topic collector; low severity does not remove the capability-boundary concern.
