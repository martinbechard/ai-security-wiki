---
type: "Topic"
title: "ToFu MCP Server Security Findings"
description: "Security analysis for secondary reporting that ToFu testing found manually verified bug classes across open-source MCP servers."
tags: ["testing-and-assurance", "agent-and-tool-security"]
---

# ToFu MCP Server Security Findings

## Current Understanding

The [October 12 topic collector source](../../../raw/processed/2026-10-12/ai-security-wiki-topic-news-collector-2026-10-12T233447Z.json) records [CSO Online reporting](https://www.csoonline.com/article/4233811/researchers-bypass-6-ai-agent-frameworks-with-a-simple-repeat-after-me-prompt.html) that ToFu testing found 253 manually verified bugs across 118 of 273 open-source MCP servers the researchers could run. Broad MCP ecosystem catalog context belongs upstream; this page owns the local assurance lesson for MCP server test coverage.

The reported bug classes include path traversal, SSRF, data exfiltration, and OS command injection. The finding supports the existing local pattern that MCP server security depends on tool-specific input validation, filesystem and network containment, and explicit authority boundaries rather than protocol conformance alone.

## Security Impact

- Threat: open-source MCP servers can expose recurring high-impact bug classes when tool handlers lack containment.
- Affected boundary: secondary reporting covers 118 runnable open-source MCP servers out of 273 evaluated; exact server names and versions are not captured locally.
- Exploit or incident status: public research reporting; primary data and advisories are not captured in local evidence.
- Mitigation state: use ToFu-style runnable-server tests as assurance input, but verify each concrete server finding against primary evidence before creating product-specific leaves.
- Confidence: moderate because the numeric findings come from secondary reporting and need primary paper or project evidence.
- Residual risk: MCP server inventories can look compliant while individual tools still expose filesystem, network, credential, or command authority.

## Control Implications

- Maintain MCP server test suites that exercise each tool's path, URL, command, credential, and output boundaries.
- Require manual verification or reproducible evidence before promoting a scanner result into a durable advisory leaf.
- Keep bug-class synthesis separate from concrete product advisories until primary evidence names affected packages and versions.

## Authoritative Sources

- [October 12 topic collector source](../../../raw/processed/2026-10-12/ai-security-wiki-topic-news-collector-2026-10-12T233447Z.json)
- [CSO Online Repeat-After-Me report](https://www.csoonline.com/article/4233811/researchers-bypass-6-ai-agent-frameworks-with-a-simple-repeat-after-me-prompt.html)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [testing and assurance](index.md)
- [agent runtime security evidence](agent-runtime-security-evidence.md)
- [Repeat-After-Me tool-call authorization bypass](../agent-and-tool-security/repeat-after-me-tool-call-authorization-bypass.md)

## Open Questions

- Where are the ToFu primary paper, tool, dataset, or advisory mappings for the 253 manually verified MCP server bugs?

## Maintenance Notes

- Created on 2026-10-13 from secondary October 12 reporting as an assurance leaf, not as product-specific advisory coverage.
