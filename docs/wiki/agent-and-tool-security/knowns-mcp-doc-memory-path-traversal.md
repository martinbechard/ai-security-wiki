---
type: "Topic"
title: "knowns MCP doc and memory path traversal"
description: "Security analysis for CVE-2026-86439 path traversal in knowns MCP doc and memory tools."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# knowns MCP doc and memory path traversal

## Current Understanding

The [September 7 topic collector source](../../../raw/processed/2026-09-07/ai-security-wiki-topic-news-collector-2026-09-07T233220Z.json) records [CVE-2026-86439](https://cveawg.mitre.org/api/cve/CVE-2026-86439) for knowns versions before 0.30.0. The CVE says MCP tool arguments for documentation and memory paths were joined without enough containment validation, allowing traversal sequences to reach Markdown files outside the project directory.

This belongs in local agent and tool security because the affected surface is an MCP server mediating agent-accessible documentation and memory files. Broad knowns or MCP-server catalog context belongs upstream in ai-wiki.

## Security Impact

- Threat: a caller that can invoke the MCP doc or memory tools can read, create, overwrite, or delete Markdown files reachable by the server process outside the intended project boundary.
- Affected boundary: knowns npm package before 0.30.0; fixed in 0.30.0 according to the CVE affected range and release reference.
- Exploit or incident status: public CVE, [GitHub advisory](https://github.com/knowns-dev/knowns/security/advisories/GHSA-9gfj-28hw-jchp), [patch commit](https://github.com/knowns-dev/knowns/commit/09c5a96fd5817b941dc86669278c1a17db10ed4e), and [release evidence](https://github.com/knowns-dev/knowns/releases/tag/v0.30.0); no active exploitation evidence is recorded by the source.
- Mitigation state: upgrade to [knowns 0.30.0](https://github.com/knowns-dev/knowns/releases/tag/v0.30.0) or later and validate resolved paths before file reads, writes, deletes, memory-layer access, or documentation updates.
- Confidence: high because the [CVE record](https://cveawg.mitre.org/api/cve/CVE-2026-86439), [NVD entry](https://nvd.nist.gov/vuln/detail/CVE-2026-86439) captured by the collector, vendor advisory, vulnerable-code references, patch commit, and release reference align.
- Residual risk: MCP tools that expose document or memory files still need tests for traversal, absolute paths, symlink escapes, sibling-prefix paths, and write/delete authority.

## Authoritative Sources

- [September 7 topic collector source](../../../raw/processed/2026-09-07/ai-security-wiki-topic-news-collector-2026-09-07T233220Z.json)
- [CVE-2026-86439 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-86439)
- [knowns GitHub advisory GHSA-9gfj-28hw-jchp](https://github.com/knowns-dev/knowns/security/advisories/GHSA-9gfj-28hw-jchp)
- [knowns fix commit 09c5a96fd5817b941dc86669278c1a17db10ed4e](https://github.com/knowns-dev/knowns/commit/09c5a96fd5817b941dc86669278c1a17db10ed4e)
- [knowns v0.30.0 release](https://github.com/knowns-dev/knowns/releases/tag/v0.30.0)
- [NVD CVE-2026-86439](https://nvd.nist.gov/vuln/detail/CVE-2026-86439)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)
- [MCP Atlassian Confluence attachment file read](mcp-atlassian-confluence-attachment-file-read.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-07 from the September 7 topic collector as an MCP file-tool path-containment advisory leaf.
