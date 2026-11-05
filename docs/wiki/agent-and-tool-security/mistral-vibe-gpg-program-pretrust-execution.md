---
type: "Topic"
title: "Mistral Vibe gpg.program Pre-Trust Execution"
description: "Security analysis for CVE-2026-122135 repository-configured gpg.program execution during context collection."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Mistral Vibe gpg.program Pre-Trust Execution

## Current Understanding

The [November 5 collector source](../../../raw/processed/2026-11-05/ai-security-wiki-topic-news-collector-2026-11-05T003237Z.json) records [CVE-2026-122135](https://github.com/advisories/GHSA-qx7j-gch3-gv7c) for Mistral Vibe before 3.0.3. Mistral Vibe product context and coding-agent onboarding practice remain upstream; this page owns the repository-configured Git execution boundary before a trust prompt.

The advisory says a crafted repository can set `gpg.program` and `log.showSignature` so project-context `git log` invokes an attacker program at session start. The advisory references [v3.0.3](https://github.com/mistralai/mistral-vibe/releases/tag/v3.0.3) as the fixed release.

## Security Impact

- Threat: repository configuration executes an attacker program while the agent collects startup context, before the user can approve trust.
- Affected boundary: Mistral Vibe before 3.0.3; project-context `git log`, repository Git configuration, and signature display.
- Exploit or incident status: public advisory; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to 3.0.3 or later and prevent repository configuration from selecting executable Git helpers before trust.
- Confidence: high for the affected release line and execution path from advisory evidence.
- Residual risk: any pre-trust Git invocation may load repository-controlled configuration or helpers unless explicitly isolated.

## Authoritative Sources

- [November 5 collector source](../../../raw/processed/2026-11-05/ai-security-wiki-topic-news-collector-2026-11-05T003237Z.json)
- [GitHub advisory GHSA-qx7j-gch3-gv7c](https://github.com/advisories/GHSA-qx7j-gch3-gv7c)
- [Mistral Vibe 3.0.3 release](https://github.com/mistralai/mistral-vibe/releases/tag/v3.0.3)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Mistral Vibe Git filter-driver pre-trust execution](mistral-vibe-git-filter-driver-pretrust-execution.md)
- [Mistral Vibe Windows git.exe pre-trust execution](mistral-vibe-windows-git-exe-pretrust-execution.md)

## Open Questions

- Does 3.0.3 run all pre-trust Git operations with repository configuration disabled, or only harden signature-log collection?

## Maintenance Notes

- Created on 2026-11-05 from the November 5 collector; kept separate because this configuration path and fixed-version line differ from the other Mistral Vibe advisories.
