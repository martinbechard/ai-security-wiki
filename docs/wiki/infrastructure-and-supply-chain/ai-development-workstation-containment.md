---
type: "Topic"
title: "AI Development Workstation Containment"
description: "Security controls for containing AI-assisted development through account privilege, exact workspace, context selection, and managed configuration."
tags: ["infrastructure-and-supply-chain"]
---

# AI Development Workstation Containment

## Current Understanding

AI development workstation containment limits the files, processes, configuration, and local services exposed to an assistant. The [Codex security guide](../../../guides/agent-security/Codex-Development-Security-Guide.md) uses a managed elevated Windows sandbox with explicit filesystem permissions. The [Junie profile in the JetBrains AI Development Security Guide](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md) relies on the launching standard Windows account, exact-project trust, managed discovery locations, and ACL-protected configuration because an approval prompt is not an operating-system sandbox. The [AI Assistant profile in the JetBrains AI Development Security Guide](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md) uses the developer's existing standard Windows account and a non-agent feature profile.

The operating-system boundary is product-specific:

- Codex executes sandboxed commands through its dedicated lower-privilege `CodexSandboxOffline` and `CodexSandboxOnline` accounts after administrator-approved setup.
- Junie CLI executes commands with the Windows account that launched it.
- IntelliJ and AI Assistant share the developer's existing `<Developer Account>` access; there is no second IntelliJ or AI account.

For IntelliJ Chat, the opened project, selected context, explicit attachments, `.aiignore`, and absence of agent tools determine what enters model context, but they do not form an operating-system filesystem sandbox.

The [July 30 leaf update watch source](../../../raw/processed/2026-07-30/ai-security-wiki-leaf-update-watch-2026-07-30T200159-0400.json) adds [Junie Headless mode](https://junie.jetbrains.com/docs/junie-headless.html) evidence that unknown-project restricted mode uses temporary writable Junie storage outside the repository and avoids repository-controlled MCP servers, hooks, agents, skills, and guidelines when trust-marker enforcement is active.

The [August 4 leaf update watch source](../../../raw/processed/2026-08-04/ai-security-wiki-leaf-update-watch-2026-08-04T161500Z.json) records a 2026-08-03 [Junie Headless mode](https://junie.jetbrains.com/docs/junie-headless.html) update for Gateway and ACP non-interactive execution. The local workstation-containment implication is narrow: when marker-aware restricted behavior is enabled, unknown projects should avoid repository-controlled MCP, hook, agent, skill, and guideline loading; when the rollout toggle is disabled, Gateway and ACP retain the trusted behavior path and cannot be counted as restricted-mode containment.

## Control Implications

- For Codex, require the managed elevated Windows sandbox and verify its dedicated lower-privilege sandbox accounts.
- For Junie CLI, use the developer's standard account without administrator elevation and constrain exact-project trust, managed discovery, and command approvals.
- For IntelliJ AI Assistant, use the developer's standard account without administrator elevation and constrain AI context through the opened project, selected attachments, `.aiignore`, and non-agent Chat mode.
- Bind trust and write authority to the exact repository, not a parent directory containing multiple projects.
- Deny outside-project reads by default where an enforceable sandbox supports that policy; for Junie or IntelliJ, the developer account retains its filesystem access and must not approve, open, or attach unrelated files.
- Disable unreviewed configuration, model, MCP, command, agent, skill, plugin, browser, and remote-control discovery surfaces when the product supports those controls.
- Keep restricted-mode temporary storage outside the repository and verify repository-controlled MCP, hook, agent, skill, and guideline loading is disabled for unknown projects.
- For non-interactive Gateway and ACP runs, preserve rollout-state evidence before relying on unknown-project restricted mode as workstation containment.
- Keep administrator-managed policy and allowlist files read-only to the development account.
- Treat writable local Git metadata as an explicit recoverability tradeoff: checkpoint commits help, but destructive Git operations can still lose local-only work.

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

- [infrastructure and supply chain](index.md)
- [agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)
- [coding agent access validation](../testing-and-assurance/coding-agent-access-validation.md)
- Upstream AI wiki owns general [AI agent runtime containment](../../../upstream-ai-wiki/techniques/ai-agent-runtime-containment.md).

## Open Questions

- Which endpoint-management controls should verify that managed agent configuration remains non-writable to the development account?

## Maintenance Notes

- Created on 2026-07-30 from the Windows workstation control models in the [Codex](../../../guides/agent-security/Codex-Development-Security-Guide.md), [Junie CLI](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md), and [IntelliJ AI Assistant](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md) security guides; enriched from the [July 30 leaf watcher](../../../raw/processed/2026-07-30/ai-security-wiki-leaf-update-watch-2026-07-30T200159-0400.json) and [August 4 leaf watcher](../../../raw/processed/2026-08-04/ai-security-wiki-leaf-update-watch-2026-08-04T161500Z.json) with Junie restricted-mode temporary-storage, rollout-state, and repository-controlled input evidence.
