---
type: "Topic"
title: "Coding Agent Command Approval Boundaries"
description: "Security controls for exact command allowlists, escalation prompts, unattended execution, and approval scope."
tags: ["agent-and-tool-security"]
---

# Coding Agent Command Approval Boundaries

## Current Understanding

Command approval limits which local actions a coding agent may execute without a fresh human decision. The durable boundary is the complete operation, not only the executable name. Broad prefixes such as `git`, `java`, `powershell`, or `curl` can authorize unrelated subcommands, scripts, network destinations, and destructive effects.

The local security baselines split approval behavior by product:

- The [Junie profile in the JetBrains AI Development Security Guide](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md) uses exact reviewed Maven, health-check, and local Git commands with a default decision of ask.
- The [Codex security guide](../../../guides/agent-security/Codex-Development-Security-Guide.md) combines permission profiles, network policy, and explicit command rules.
- The [AI Assistant profile in the JetBrains AI Development Security Guide](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md) chooses a narrower feature boundary: Chat proposes edits, while the developer retains all command execution.

Approval applies to the launched process. Approving a shell or wrapper script can authorize every operation inside it, so a single approval prompt does not imply per-step review. Headless execution does not reduce authority; it removes the opportunity to answer a prompt and must fit entirely inside an already reviewed allowlist.

The [July 30 leaf update watch source](../../../raw/processed/2026-07-30/ai-security-wiki-leaf-update-watch-2026-07-30T200159-0400.json) adds [Junie Action Allowlist](https://junie.jetbrains.com/docs/action-allowlist.html) evidence for terminal, MCP, outside-project read/write, build/test, preview, and build-script action classes. Its shell guidance reinforces that command patterns must avoid chaining and shell metacharacter expansion when the intent is one reviewed operation.

## Control Implications

- Match exact commands or tightly bounded argument patterns instead of executable prefixes.
- Keep remote Git, external-system CLIs, direct database clients, package managers, and destructive repository operations approval-gated.
- Do not allowlist a wrapper merely to hide multiple otherwise reviewable operations.
- Use the same or narrower allowlist for unattended execution; never broaden authority because no person is present.
- Treat disabling agent mode and tool access as a valid approval design when interactive, reviewed editing is sufficient.
- Pair approval rules with operating-system, filesystem, network, and service-identity controls because prompts are not containment.
- Treat terminal, MCP, outside-project read/write, build, test, preview, and build-script edits as separate action classes unless a product proves a narrower policy model.
- Reject shell-chaining and metacharacter patterns in allowlists unless the whole expanded shell behavior has been reviewed.

## Authoritative Sources

- [Codex Development Security Guide](../../../guides/agent-security/Codex-Development-Security-Guide.md)
- [JetBrains AI Development Security Guide - Junie profile](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md)
- [JetBrains AI Development Security Guide - AI Assistant profile](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md)
- [July 30 leaf update watch source](../../../raw/processed/2026-07-30/ai-security-wiki-leaf-update-watch-2026-07-30T200159-0400.json)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [coding agent access validation](../testing-and-assurance/coding-agent-access-validation.md)
- Upstream AI wiki owns the general [coding agent approval boundary](../../../upstream-ai-wiki/techniques/coding-agent-approval-boundary.md).
- Upstream AI development wiki owns general [human-agent approval boundaries](../../../upstream-ai-dev-wiki/adoption-and-operating-model/human-agent-approval-boundaries.md) and [terminal agent workflows](../../../upstream-ai-dev-wiki/agent-workflows/terminal-agent-workflows.md).

## Open Questions

- Which command-rule formats can bind approval to canonical paths and destinations across supported coding agents?

## Maintenance Notes

- Created on 2026-07-30 from the [Codex](../../../guides/agent-security/Codex-Development-Security-Guide.md), [Junie CLI](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md), and [IntelliJ AI Assistant](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md) security guides; enriched from the [July 30 leaf watcher](../../../raw/processed/2026-07-30/ai-security-wiki-leaf-update-watch-2026-07-30T200159-0400.json) with Junie action-class and shell-pattern evidence.
