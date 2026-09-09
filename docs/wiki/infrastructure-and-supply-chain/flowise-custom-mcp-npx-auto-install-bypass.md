---
type: "Topic"
title: "Flowise Custom MCP npx auto-install bypass"
description: "Security analysis for Flowise 3.1.3 Custom MCP server npm_config_yes auto-install bypass."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# Flowise Custom MCP npx auto-install bypass

## Current Understanding

The [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json) records an in-window NVD update for a Flowise Custom MCP server `npx` auto-install bypass fixed in 3.1.3. Broad Flowise and MCP product context belongs upstream; this page owns the dependency-install boundary where agent-builder MCP configuration can cause package installation or command execution.

The source identifies `npm_config_yes` as the bypass mechanism. The durable control is that MCP server launchers must treat package installation as a separate approved dependency action, not an implicit side effect of a model- or user-configured tool.

## Security Impact

- Threat: a Custom MCP server configuration can bypass install confirmation and auto-install packages through `npx`.
- Affected boundary: Flowise versions before 3.1.3; Custom MCP server launch paths and `npx` package installation.
- Exploit or incident status: public NVD/CVE/GitHub advisory evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade to Flowise 3.1.3 or later; block implicit package installation and require pinned, reviewed MCP server dependencies.
- Confidence: high for NVD update timing and fixed-version signal; medium for exact exploit prerequisites.
- Residual risk: MCP launchers are supply-chain boundaries when server names, package sources, or environment variables can be influenced by workspace content.

## Authoritative Sources

- [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json)
- [Flowise 3.1.3 release](https://github.com/FlowiseAI/Flowise/releases/tag/flowise@3.1.3)
- [CVE-2026-70477 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-70477)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent build and dependency execution boundaries](agent-build-and-dependency-execution-boundaries.md)
- [agent and tool security](../agent-and-tool-security/index.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-08 from the September 8 topic collector after verifier correction split the Flowise release wave into focused security-boundary leaves.
