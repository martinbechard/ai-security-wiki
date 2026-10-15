---
type: "Topic"
title: "obsidian-tc Resolved-Path ACL Bypass"
description: "Security analysis for CVE-2026-77361 lexical-versus-resolved path authorization in obsidian-tc."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# obsidian-tc Resolved-Path ACL Bypass

## Current Understanding

[The October 14 collector](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json) records [CVE-2026-77361](https://nvd.nist.gov/vuln/detail/CVE-2026-77361) for obsidian-tc before 1.3.1. Broad Obsidian context belongs upstream; this page owns the tool-accessible vault ACL canonicalization boundary.

## Security Impact

- Threat: an in-vault symlink can expose denied files when read ACL checks use lexical paths but containment uses resolved paths.
- Affected boundary: obsidian-tc before 1.3.1, vault read ACL checks, and symlink resolution.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: version 1.3.1 applies ACL filtering to resolved paths.
- Confidence and residual risk: high for the affected range and fix; any agent-accessible knowledge store needs canonical-path authorization.

## Control Implications

- Authorize after canonicalization and test symlink, hard-link, and nested-path cases.
- Keep tool-returned knowledge scoped to the caller after resolving all filesystem references.

## Authoritative Sources

- [October 14 topic collector source](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json)
- [NVD CVE-2026-77361](https://nvd.nist.gov/vuln/detail/CVE-2026-77361)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [obsidian-tc local MCP DNS-rebinding exposure](obsidian-tc-local-mcp-dns-rebinding-exposure.md)

## Open Questions

- Do 1.3.1 regression tests cover every bridge path that dereferences vault files?

## Maintenance Notes

- Created on 2026-10-14 from the October 14 collector.
