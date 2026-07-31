---
type: "Topic"
title: "AI Development Context Exclusion Controls"
description: "Security controls for preventing secrets, sensitive files, and unrelated project data from entering assistant context."
tags: ["data-and-privacy"]
---

# AI Development Context Exclusion Controls

## Current Understanding

AI development context exclusion controls reduce which project and workstation data can enter prompts, model context, request logs, and session history. The security baselines use different control layers:

- The [AI Assistant profile in the JetBrains AI Development Security Guide](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md) uses `.aiignore`, explicit context selection, disabled detailed code-data sharing, and review of the AI requests log.
- The [Codex security guide](../../../guides/agent-security/Codex-Development-Security-Guide.md) uses enforceable filesystem denials for `.env` files and sensitive user folders.
- The [Junie profile in the JetBrains AI Development Security Guide](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md) uses disabled outside-project discovery and approval while sharing the launching account's filesystem access.

Ignore files are context-selection controls, not secret stores or operating-system access controls. IntelliJ and AI Assistant share the developer account's OS access; AI context is selected through the opened project, editor context, Codebase Mode, explicit attachments, and `.aiignore`. Real credentials and sensitive data stay outside the project and must not be opened or attached as AI context. Logs, heap dumps, IDE database metadata, build output, agent caches, prompts, and tool results are treated as potentially sensitive context.

The [July 30 leaf update watch source](../../../raw/processed/2026-07-30/ai-security-wiki-leaf-update-watch-2026-07-30T200159-0400.json) adds [Junie Action Allowlist](https://junie.jetbrains.com/docs/action-allowlist.html) evidence that project-root `.aiignore` patterns can restrict files and folders the agent may access. Treat that as a product-specific access and context-minimization layer, not a substitute for keeping production secrets outside the repository.

## Control Implications

- Keep production credentials and production data outside the repository, and do not open or attach personal files or unrelated customer files as assistant context.
- Deny access to sensitive paths at the filesystem boundary when the product supports enforcement.
- Use `.aiignore` or equivalent context filters as an additional minimization layer, not as the sole protection for secrets.
- Select project-wide context only when required; otherwise attach only the current file or reviewed files.
- Classify request logs and session histories as sensitive because they can contain prompts, code, instructions, and tool output.
- Review provider processing, retention, training-use, data-sharing, and jurisdiction terms before customer source enters model context.
- Keep project-root `.aiignore` patterns under review when a product uses them as an access restriction, not only as prompt-context guidance.

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

- [data and privacy](index.md)
- [AI coding telemetry redaction controls](ai-coding-telemetry-redaction-controls.md)
- [local agent execution and processing boundaries](../agent-and-tool-security/local-agent-execution-and-processing-boundaries.md)

## Open Questions

- Which assistant request and session logs are retained locally or by providers for each approved development profile?

## Maintenance Notes

- Created on 2026-07-30 from the context, filesystem, and data-handling controls in the [Codex](../../../guides/agent-security/Codex-Development-Security-Guide.md), [Junie CLI](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md), and [IntelliJ AI Assistant](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md) security guides; enriched from the [July 30 leaf watcher](../../../raw/processed/2026-07-30/ai-security-wiki-leaf-update-watch-2026-07-30T200159-0400.json) with Junie `.aiignore` access-restriction evidence.
