---
type: "Topic"
title: "Local Agent Execution And Processing Boundaries"
description: "Security controls that distinguish local command execution from hosted model processing and hosted agent execution."
tags: ["agent-and-tool-security"]
---

# Local Agent Execution And Processing Boundaries

## Current Understanding

“Local” is not a single security property. A development assistant can read files and execute commands on a workstation while still sending prompts and selected project context to a hosted model service. A hosted agent task is a separate execution surface and is not governed by workstation sandbox, account, or network controls.

The local security baselines establish three distinct profiles:

- Codex local or worktree tasks execute through a managed local sandbox, while Codex cloud remains a separate hosted execution mode.
- Junie CLI executes local commands with the launching Windows account’s rights, while model requests use JetBrains AI.
- IntelliJ AI Assistant Chat sends selected context to JetBrains AI but leaves command execution and operational tools with the developer.

An assurance statement must therefore name both the execution location and the model-processing destination. “Runs locally” must not be used to imply local inference, no external processing, or enforcement against a separately available cloud task mode.

The [July 30 leaf update watch source](../../../raw/processed/2026-07-30/ai-security-wiki-leaf-update-watch-2026-07-30T200159-0400.json) adds [Junie Headless mode](https://junie.jetbrains.com/docs/junie-headless.html) evidence for a non-interactive trust-marker boundary. JetBrains currently documents that enforcement as controlled by a disabled rollout toggle, so piped, one-shot, ACP, and Gateway modes retain existing trusted behavior today. When enforcement is enabled, exact-project or parent-directory trust markers govern whether repository-controlled MCP servers, hooks, agents, skills, and guidelines load; unknown projects instead enter restricted behavior.

The [August 4 leaf update watch source](../../../raw/processed/2026-08-04/ai-security-wiki-leaf-update-watch-2026-08-04T161500Z.json) records a 2026-08-03 [Junie Headless mode](https://junie.jetbrains.com/docs/junie-headless.html) update that keeps Gateway and ACP modes on the trusted behavior path while the non-interactive rollout toggle is disabled. The same source says enabling that toggle applies marker-aware restricted behavior without prompting, so non-interactive execution needs rollout-state evidence before it is treated as an enforced local processing boundary.

## Control Implications

- Record local command execution, hosted model processing, and hosted agent execution as separate data-flow and authority boundaries.
- Verify the selected task mode before each session when a product exposes both local and cloud execution.
- Treat a user-interface selection or empty cloud-environment list as an operating check unless an administrator-enforced control prevents hosted execution.
- Require contractual and data-classification approval before customer source or project context is sent to a hosted model.
- State which controls govern each surface; do not claim that a local sandbox controls connectors, browser automation, MCP servers, or hosted tasks.
- Establish exact-project trust interactively before non-interactive use, and do not rely on trust markers as an enforced control while the documented rollout toggle remains disabled.
- Validate the rollout state explicitly. Once enforcement is enabled, verify exact-project or parent trust markers and restricted unknown-project behavior before relying on them as security boundaries.
- For Gateway and ACP mode, record whether the documented trusted behavior or marker-aware restricted behavior applies before classifying a non-interactive task as locally constrained.

## Authoritative Sources

- [Codex Development Security Guide](../../../guides/agent-security/Codex-Development-Security-Guide.md)
- [JetBrains AI Development Security Guide - Junie profile](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md)
- [JetBrains AI Development Security Guide - AI Assistant profile](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md)
- [July 30 leaf update watch source](../../../raw/processed/2026-07-30/ai-security-wiki-leaf-update-watch-2026-07-30T200159-0400.json)
- [August 4 leaf update watch source](../../../raw/processed/2026-08-04/ai-security-wiki-leaf-update-watch-2026-08-04T161500Z.json)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [AI development context exclusion controls](../data-and-privacy/ai-development-context-exclusion-controls.md)
- Upstream AI wiki owns broad [OpenAI Codex](../../../upstream-ai-wiki/developer-tools/openai-codex.md) product coverage.

## Open Questions

- Which managed account or endpoint controls are required when an individual subscription cannot technically prohibit hosted agent execution?

## Maintenance Notes

- Created on 2026-07-30 from the [Codex](../../../guides/agent-security/Codex-Development-Security-Guide.md), [Junie CLI](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md), and [IntelliJ AI Assistant](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md) security baselines; enriched from the [July 30 leaf watcher](../../../raw/processed/2026-07-30/ai-security-wiki-leaf-update-watch-2026-07-30T200159-0400.json) and [August 4 leaf watcher](../../../raw/processed/2026-08-04/ai-security-wiki-leaf-update-watch-2026-08-04T161500Z.json) with Junie non-interactive trust-marker evidence.
