---
type: "Topic"
title: "knowns LSP Binary Config Execution"
description: "Security analysis for CVE-2026-86540 repository-local LSP binary execution in knowns."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# knowns LSP Binary Config Execution

## Current Understanding

The [October 7 topic collector source](../../../raw/processed/2026-10-07/ai-security-wiki-topic-news-collector-2026-10-07T233304Z.json) records October 6 GitHub Advisory Database publication of [GHSA-mc52-mwq4-vfx3](https://github.com/advisories/GHSA-mc52-mwq4-vfx3) for [CVE-2026-86540](https://cveawg.mitre.org/api/cve/CVE-2026-86540). Broad knowns tool and product context belongs upstream, and general repository-local configuration trust practice belongs in ai-dev-wiki unless it is framed as a concrete security vulnerability. This page owns the local workspace supply-chain boundary.

knowns before 0.30.0 does not validate `settings.lsp.languages` binary paths in `.knowns/config.json`. Opening a repository with a crafted config can execute attacker-selected binaries under the user's account, turning repository-local configuration into an execution surface for AI knowledge and documentation tooling.

## Security Impact

- Threat: opening an untrusted repository can execute repository-selected LSP binaries through knowns configuration.
- Affected boundary: knowns npm package before 0.30.0, `.knowns/config.json`, `settings.lsp.languages`, LSP binary discovery, and developer workstation process execution.
- Exploit or incident status: reviewed GitHub advisory, CVE Services record, VulnCheck advisory, and release reference; no local exploitation incident is recorded.
- Mitigation state: update to knowns 0.30.0 or later, ignore repository-supplied absolute executable paths by default, and require explicit user or policy approval for per-repository LSP binary overrides.
- Confidence: medium-high for the in-window GitHub advisory publication and affected-version boundary; medium for exact validation behavior until the patch is inspected.
- Residual risk: AI repository tools need a shared trust label for project-local configuration because safe file reads do not imply safe process launch.

## Authoritative Sources

- [October 7 topic collector source](../../../raw/processed/2026-10-07/ai-security-wiki-topic-news-collector-2026-10-07T233304Z.json)
- [GHSA-mc52-mwq4-vfx3](https://github.com/advisories/GHSA-mc52-mwq4-vfx3)
- [CVE-2026-86540 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-86540)
- [knowns v0.30.0 release](https://github.com/knowns-dev/knowns/releases/tag/v0.30.0)
- [VulnCheck knowns LSP binary advisory](https://www.vulncheck.com/advisories/knowns-before-0.30.0-arbitrary-code-execution-via-lsp-binary)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent build and dependency execution boundaries](agent-build-and-dependency-execution-boundaries.md)
- [AI development workstation containment](ai-development-workstation-containment.md)
- [knowns MCP doc and memory path traversal](../agent-and-tool-security/knowns-mcp-doc-memory-path-traversal.md)
- [knowns code.find path traversal](../agent-and-tool-security/knowns-code-find-path-traversal.md)

## Open Questions

- Which knowns 0.30.0 patch rejects or constrains repository-local LSP binary paths?

## Maintenance Notes

- Created on 2026-10-08 from the [October 7 topic collector source](../../../raw/processed/2026-10-07/ai-security-wiki-topic-news-collector-2026-10-07T233304Z.json) as a repository-local configuration execution boundary.
