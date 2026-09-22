---
type: "Topic"
title: "MCP-for-Stata Package Install Command Injection"
description: "Security analysis for CVE-2026-55071 command injection in the MCP-for-Stata package-install tool."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# MCP-for-Stata Package Install Command Injection

## Current Understanding

The [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json) records [CVE-2026-55071](https://cveawg.mitre.org/api/cve/CVE-2026-55071) for SepineTam MCP-for-Stata before 1.19.0. Broad Stata and MCP product context belongs upstream; this page owns the local security boundary where an MCP package-management tool becomes host command execution.

The `ado_package_install` MCP tool and equivalent Python API concatenate caller-controlled input into a Stata command. A caller who can invoke the tool can inject newline-delimited Stata commands, including shell escapes, and run operating-system commands as the Stata-MCP server user. The [GitHub advisory](https://github.com/SepineTam/mcp-for-stata/security/advisories/GHSA-49m4-vp58-wgc9) and [1.19.0 release](https://github.com/SepineTam/mcp-for-stata/releases/tag/v1.19.0) identify version 1.19.0 as the patch boundary.

## Security Impact

- Threat: an agent-exposed package-install affordance can cross from dependency management into arbitrary shell execution.
- Affected boundary: MCP-for-Stata before 1.19.0; `ado_package_install` MCP tool and equivalent Python API.
- Exploit or incident status: public CVE, NVD record, GitHub advisory, and release reference; no local exploitation evidence is recorded.
- Mitigation state: upgrade to 1.19.0 or later, avoid command-string concatenation for package tools, and require explicit allowlists for package names and install targets.
- Confidence: high because CVE Services, NVD, the project advisory, and the release reference agree on product, impact, and fix.
- Residual risk: MCP package-management tools remain high-risk when tool arguments are later interpreted by a shell, REPL, or domain command language.

## Authoritative Sources

- [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json)
- [CVE-2026-55071 JSON](https://cveawg.mitre.org/api/cve/CVE-2026-55071)
- [NVD CVE-2026-55071](https://nvd.nist.gov/vuln/detail/CVE-2026-55071)
- [GitHub advisory GHSA-49m4-vp58-wgc9](https://github.com/SepineTam/mcp-for-stata/security/advisories/GHSA-49m4-vp58-wgc9)
- [MCP-for-Stata 1.19.0 release](https://github.com/SepineTam/mcp-for-stata/releases/tag/v1.19.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP shell command policy bypasses](mcp-shell-command-policy-bypasses.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-21 from the [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json); upstream routing keeps broad MCP/Stata context out of the local security leaf.
