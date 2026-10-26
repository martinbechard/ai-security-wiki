---
type: "Topic"
title: "designer-mcp Reference Path Traversal"
description: "Security analysis for CVE-2026-116045 MCP get_reference path traversal in designer-mcp."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# designer-mcp Reference Path Traversal

## Current Understanding

The [October 25 topic collector source](../../../raw/processed/2026-10-25/ai-security-wiki-topic-news-collector-2026-10-25T232906Z.json) records [CVE-2026-116045](https://nvd.nist.gov/vuln/detail/CVE-2026-116045): designer-mcp through 2.1.0 passes the MCP `get_reference` Name input into a path construction flow, enabling path traversal. Broad MCP-server catalog coverage belongs upstream; this page owns the tool-to-host filesystem authority boundary.

## Security Impact

- Threat: a tool argument selects a host path outside the intended reference root.
- Affected boundary: designer-mcp through 2.1.0, `get_reference` and reference Markdown paths.
- Exploit or incident status: NVD reports public exploit availability; the maintainer patch confirms traversal and symlink-escape cases.
- Mitigation state: apply the named patch or a release containing it; reject separators, traversal, absolute paths, and NUL bytes, then resolve and re-check paths against a trusted real root.
- Confidence: high for the vulnerable boundary and patch behavior; the maintained fixed release version is not yet identified.
- Residual risk: other explicitly caller-chosen-path tools require separate authority review and must not inherit this constraint by assumption.

## Authoritative Sources

- [October 25 topic collector source](../../../raw/processed/2026-10-25/ai-security-wiki-topic-news-collector-2026-10-25T232906Z.json)
- [CVE-2026-116045](https://nvd.nist.gov/vuln/detail/CVE-2026-116045)
- [maintainer patch](https://github.com/1999AZZAR/designer-mcp/commit/c8c2951dcbed9b1710a745993f028317f10a3f10)
- [issue 14](https://github.com/1999AZZAR/designer-mcp/issues/14)

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

- Which published designer-mcp release first contains the patch, and which exposed tools intentionally retain caller-selected host paths?

## Maintenance Notes

- Created on 2026-10-25 from CVE-2026-116045 with the patch's realpath and containment checks as maintainer evidence.
