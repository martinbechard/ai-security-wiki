---
type: "Topic"
title: "Mistral Vibe Windows git.exe Pre-Trust Execution"
description: "Security analysis for CVE-2026-122133 untrusted git.exe resolution at Mistral Vibe session start."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Mistral Vibe Windows git.exe Pre-Trust Execution

## Current Understanding

The [November 5 collector source](../../../raw/processed/2026-11-05/ai-security-wiki-topic-news-collector-2026-11-05T003237Z.json) records [CVE-2026-122133](https://github.com/advisories/GHSA-4c2h-cpg4-cvr2) for Mistral Vibe before 2.25.5 on Windows. Product context and coding-agent workflow remain upstream; this page owns the pre-trust executable-resolution boundary.

The advisory says a `git.exe` placed in a repository root can be selected by `SessionLogger` or `ProjectContextProvider` at session start before a trust prompt. It references [v2.25.5](https://github.com/mistralai/mistral-vibe/releases/tag/v2.25.5) as the fixed release.

## Security Impact

- Threat: an attacker-supplied repository-local executable runs when the agent resolves Git during session startup.
- Affected boundary: Mistral Vibe before 2.25.5 on Windows; `SessionLogger`, `ProjectContextProvider`, and `git.exe` search-path resolution.
- Exploit or incident status: public advisory; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to 2.25.5 or later and resolve Git to a trusted absolute path outside the opened repository.
- Confidence: high for the Windows-specific affected line and pre-trust execution condition.
- Residual risk: process launchers that inherit a repository-root working directory can select local executables before tool or project trust is established.

## Authoritative Sources

- [November 5 collector source](../../../raw/processed/2026-11-05/ai-security-wiki-topic-news-collector-2026-11-05T003237Z.json)
- [GitHub advisory GHSA-4c2h-cpg4-cvr2](https://github.com/advisories/GHSA-4c2h-cpg4-cvr2)
- [Mistral Vibe 2.25.5 release](https://github.com/mistralai/mistral-vibe/releases/tag/v2.25.5)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Mistral Vibe gpg.program pre-trust execution](mistral-vibe-gpg-program-pretrust-execution.md)
- [Mistral Vibe Git filter-driver pre-trust execution](mistral-vibe-git-filter-driver-pretrust-execution.md)

## Open Questions

- Does 2.25.5 use an absolute trusted Git path for every Windows session-start component?

## Maintenance Notes

- Created on 2026-11-05 from the November 5 collector; this Windows executable-resolution flaw remains separate from the Git configuration advisories.
