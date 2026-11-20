---
type: "Topic"
title: "Junie CLI agent file-tool project escape"
description: "Security analysis for CVE-2026-133195, where Junie CLI agent file tools could write outside the approved project."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# Junie CLI agent file-tool project escape

## Current Understanding

The [November 20 collector source](../../../raw/processed/2026-11-20/ai-security-wiki-topic-news-collector-2026-11-20T003127Z.json) records [CVE-2026-133195](https://nvd.nist.gov/vuln/detail/CVE-2026-133195) in JetBrains Junie CLI before 26.6.29. Broad Junie product and coding-agent workflow context belong upstream; this leaf owns the project-scoped file authority boundary.

Agent file tools could modify paths outside the project directory. This is distinct from Junie's untrusted MCP configuration execution: the delegated tool itself failed to contain its filesystem effects. Upgrade to 26.6.29 or later and independently verify that symlink, relative-path, and absolute-path operations remain inside the approved workspace.

## Security Impact

- Threat: a project-scoped agent can modify files beyond its approved workspace.
- Affected boundary: Junie CLI before 26.6.29 and agent file-tool path resolution.
- Exploit or incident status: public NVD/vendor issue record; no confirmed exploitation or local incident is recorded.
- Mitigation state: upgrade to 26.6.29 or later and test containment for path traversal, symlinks, and absolute paths.
- Confidence: high for the version boundary and containment failure; tool-level reachability details are not identified.
- Residual risk: workspace selection alone does not provide confinement without resolved-path enforcement.

## Authoritative Sources

- [November 20 collector source](../../../raw/processed/2026-11-20/ai-security-wiki-topic-news-collector-2026-11-20T003127Z.json)
- [CVE-2026-133195 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-133195)
- [JetBrains security issues fixed](https://www.jetbrains.com/privacy-security/issues-fixed/)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [Junie CLI untrusted-project MCP configuration execution](junie-cli-untrusted-project-mcp-configuration-execution.md)

## Open Questions

- Which Junie CLI file-tool operations enforce resolved-path containment after upgrading?

## Maintenance Notes

- Created on 2026-11-20 from the November 20 collector. This boundary is maintained separately from repository-supplied MCP configuration execution.
