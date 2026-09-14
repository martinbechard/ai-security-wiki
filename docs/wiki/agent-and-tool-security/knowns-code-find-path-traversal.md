---
type: "Topic"
title: "knowns code.find path traversal"
description: "Security analysis for CVE-2026-88938 path traversal in the knowns MCP code.find tool."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# knowns code.find path traversal

## Current Understanding

The [September 13 topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json) records [CVE-2026-88938](https://cveawg.mitre.org/api/cve/CVE-2026-88938) for knowns through 0.33.0. Broad knowns and MCP-server catalog context belongs upstream in ai-wiki; this page owns the local MCP tool path-containment boundary for code-search access.

The CVE, VulnCheck advisory, GitHub advisory, and vulnerable-code references say the `code.find` MCP tool did not restrict its `path` argument to the configured project root. A caller could supply absolute paths or traversal sequences and retrieve complete file contents outside the intended project directory.

## Security Impact

- Threat: MCP code-search tools can become arbitrary local file readers when path arguments are not resolved and checked against the project root.
- Affected boundary: knowns through 0.33.0, specifically the `code.find` MCP handler and file-content return path.
- Exploit or incident status: public CVE, advisory, and vulnerable-code evidence; no local exploitation incident is recorded.
- Mitigation state: require resolved-path containment for code-search arguments, reject absolute or traversal-derived paths outside the root, and apply the same checks to read, write, search, and memory/document tool families.
- Confidence: high because the CVE, VulnCheck advisory, GitHub advisory, and vulnerable-code references describe the same `code.find` containment failure.
- Residual risk: adjacent MCP file and search tools need sibling-prefix, symlink, absolute-path, and traversal tests because a project-root check in one handler does not prove the control is shared.

## Authoritative Sources

- [September 13 topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json)
- [CVE-2026-88938 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-88938)
- [VulnCheck knowns code.find advisory](https://www.vulncheck.com/advisories/knowns-through-0.33.0-path-traversal-via-code-find-mcp-tool)
- [knowns GitHub advisory GHSA-5cj9-fcqq-g2h7](https://github.com/knowns-dev/knowns/security/advisories/GHSA-5cj9-fcqq-g2h7)
- [knowns vulnerable code.find handler](https://github.com/knowns-dev/knowns/blob/v0.33.0/internal/mcp/handlers/code.go#L873-L902)
- [knowns vulnerable file-content path](https://github.com/knowns-dev/knowns/blob/v0.33.0/internal/mcp/handlers/code.go#L1293-L1354)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [knowns MCP doc and memory path traversal](knowns-mcp-doc-memory-path-traversal.md)
- [Agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)
- Upstream AI wiki owns broad knowns and MCP-server catalog coverage.

## Open Questions

- Which knowns release fixes CVE-2026-88938, and does the fix centralize containment for all MCP file/search handlers?

## Maintenance Notes

- Created on 2026-09-13 from the [September 13 topic collector](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json) as a distinct `code.find` path-containment leaf rather than folding it into the earlier doc/memory traversal page.
