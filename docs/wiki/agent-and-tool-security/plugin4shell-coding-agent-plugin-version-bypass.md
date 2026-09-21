---
type: "Topic"
title: "Plugin4Shell Coding-Agent Plugin Version Bypass"
description: "Security analysis for Plugin4Shell, a coding-agent plugin supply-chain flaw where pinned plugin versions can install repository-controlled code."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain", "identity-and-access"]
---

# Plugin4Shell Coding-Agent Plugin Version Bypass

## Current Understanding

The [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json) adds demonstrated research evidence dated 2026-09-18: Air Security reported a plugin source version-lock bypass affecting AI coding-agent plugin installation; reporting says Claude Code and Codex fixes shipped while Copilot and Gemini CLI remained unresolved or retiring.

The [September 19 topic collector source](../../../raw/processed/2026-09-19/ai-security-wiki-topic-news-collector-2026-09-19T233221Z.json) records [Air Security's Plugin4Shell disclosure](https://www.air.security/blog/plugin4shell) and secondary reporting. Broad [Claude Code](../../../upstream-ai-wiki/developer-tools/claude-code.md), [OpenAI Codex](../../../upstream-ai-wiki/developer-tools/openai-codex.md), [GitHub Copilot](../../../upstream-ai-wiki/developer-tools/github-copilot.md), and [Gemini CLI](../../../upstream-ai-wiki/developer-tools/gemini-cli.md) product coverage belongs upstream, and general [plugin-governance practice](../../../upstream-ai-dev-wiki/retrieval-and-tools/portable-agent-plugin-packaging-and-governance.md) belongs in ai-dev-wiki. This page owns the local exploit mechanics and coding-agent plugin supply-chain boundary.

The captured reports say a plugin repository owner can make an agent fetch an approved plugin snapshot while installing code that does not match the pinned commit. The reported attack uses branch or repository state that resembles the trusted commit enough to bypass agent-side version locking, producing zero-click code execution in developer environments. Reports captured by the collector say Claude Code 2.1.179 and Codex 0.146.0 are fixed, while GitHub Copilot and Gemini CLI remained unfixed or would not be patched in that reporting window.

## Security Impact

- Threat: a plugin repository owner can swap reviewed plugin bytes for malicious code despite a pinned plugin version.
- Affected boundary: AI coding-agent plugin installation, commit pinning, repository fetch verification, local developer workstations, shell/file/Git credentials adjacent to agent plugins.
- Exploit or incident status: public disclosure and reputable secondary reporting; no local exploitation incident is recorded.
- Mitigation state: reported fixed versions are Claude Code 2.1.179 and Codex 0.146.0; Copilot and Gemini CLI remediation remained unresolved in captured reporting.
- Confidence: medium-high for shared exploit class and affected products; medium for exact vendor fix matrix until primary vendor advisories are captured.
- Residual risk: pinning is only a control when the installed bytes are verified against immutable commit identity, not just a repository name, branch, or display string.

## Authoritative Sources

- [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json)
- [September 19 topic collector source](../../../raw/processed/2026-09-19/ai-security-wiki-topic-news-collector-2026-09-19T233221Z.json)
- [Air Security Plugin4Shell report](https://www.air.security/blog/plugin4shell)
- [The Hacker News Plugin4Shell report](https://thehackernews.com/2026/09/plugin4shell-lets-repository-owners.html)
- [Help Net Security Plugin4Shell report](https://www.helpnetsecurity.com/2026/09/18/plugin4shell-ai-coding-agents/)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [coding agent command approval boundaries](coding-agent-command-approval-boundaries.md)
- [local agent execution and processing boundaries](local-agent-execution-and-processing-boundaries.md)
- [Codex PowerShell stop-parsing approval bypass](codex-powershell-stop-parsing-approval-bypass.md)

## Open Questions

- Which primary vendor advisories or release notes confirm the Plugin4Shell fix boundaries for each affected coding agent?
- Should local coding-agent policy require byte-level plugin integrity verification before plugin code can execute?

## Maintenance Notes

- Updated on 2026-09-20 from the [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json) with in-window demonstrated research evidence while preserving local security-boundary scope.
- Created on 2026-09-20 from the [September 19 topic collector source](../../../raw/processed/2026-09-19/ai-security-wiki-topic-news-collector-2026-09-19T233221Z.json) as a coding-agent plugin supply-chain leaf.
