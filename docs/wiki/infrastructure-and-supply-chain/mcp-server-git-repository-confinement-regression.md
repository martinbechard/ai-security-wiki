---
type: "Topic"
title: "MCP Git Server Repository-Confinement Regression"
description: "Security analysis for GHSA-q74p-4wrc-q7w6, an incomplete repository-confinement fix."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# MCP Git Server Repository-Confinement Regression

## Current Understanding

[GHSA-q74p-4wrc-q7w6](https://github.com/modelcontextprotocol/servers/security/advisories/GHSA-q74p-4wrc-q7w6), captured in the [November 11 collector source](../../../raw/processed/2026-11-11/ai-security-wiki-topic-news-collector-2026-11-11T193154-0500.json), reports an incomplete `--repository` confinement fix in `mcp-server-git`. Broad [MCP reference-server coverage](../../../upstream-ai-wiki/mcp-servers/modelcontextprotocol-reference-servers.md) and developer-workflow coverage belongs upstream; this page owns the Git alternate-object and linked-worktree containment regression.

The advisory identifies `objects/info/alternates` and linked-worktree `common_dir` handling as paths around the earlier validation. It claims a 2026.11.11 patch, but no matching maintainer release artifact was available during ingestion.

## Security Impact

- Threat: a repository-scoped coding agent reads or modifies repository state beyond its delegated path.
- Affected boundary: `mcp-server-git` >= 2026.10.28 and < 2026.11.11, `--repository` confinement.
- Exploit or incident status: public advisory; no active-exploitation incident is recorded.
- Mitigation state: validate Git worktree, common-dir, and alternate-object paths before operations; retain untrusted repositories outside privileged tool scope until a fixed release is verified.
- Confidence: high for the reported regression; medium for fixed-version status.
- Residual risk: filesystem-prefix checks do not capture Git’s indirection semantics.

## Authoritative Sources

- [November 11 collector source](../../../raw/processed/2026-11-11/ai-security-wiki-topic-news-collector-2026-11-11T193154-0500.json)
- [GHSA-q74p-4wrc-q7w6](https://github.com/modelcontextprotocol/servers/security/advisories/GHSA-q74p-4wrc-q7w6)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [mcp-server-git repository boundary bypasses](mcp-server-git-repository-boundary-bypasses.md)

## Open Questions

- Which maintainer release verifies that both alternate-object and linked-worktree paths are constrained?

## Maintenance Notes

- Created on 2026-11-11 from the November 11 collector source.
