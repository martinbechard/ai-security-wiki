---
type: "Topic"
title: "Agent Build And Dependency Execution Boundaries"
description: "Security controls for agent-triggered builds, project-local caches, wrappers, plugins, and artifact repositories."
tags: ["infrastructure-and-supply-chain"]
---

# Agent Build And Dependency Execution Boundaries

## Current Understanding

Permission to run a build is permission to execute build plugins, annotation processors, tests, generated code, and application code with the build process’s operating-system rights. The [Codex security guide](../../../guides/agent-security/Codex-Development-Security-Guide.md) and [Junie profile in the JetBrains AI Development Security Guide](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md) therefore route dependency resolution through an approved artifact proxy and keep caches inside the project.

Project-local caches avoid a writable user-wide Maven or Gradle repository and isolate artifacts by project. They remain untrusted, disposable execution inputs because the agent can write them. Changes to build files, wrappers, repository declarations, plugins, and dependency sources require separate review from routine test execution.

The [July 30 leaf update watch source](../../../raw/processed/2026-07-30/ai-security-wiki-leaf-update-watch-2026-07-30T200159-0400.json) adds [Junie Action Allowlist](https://junie.jetbrains.com/docs/action-allowlist.html) evidence that Build, RunTest, Preview, and build-script edits are distinct action classes. Build-script edits are especially sensitive because import, refresh, or build execution can turn a text edit into code execution without a later obvious command prompt.

The [August 16 leaf update watch source](../../../raw/processed/2026-08-16/ai-security-wiki-leaf-update-watch-2026-08-16T200300-0400.json) adds current [Junie CLI](https://junie.jetbrains.com/docs/junie-cli.html) evidence that Action Allowlist and Brave mode levels change when sensitive shell commands can run without prompting. The local security implication is not a general Junie feature profile; it is that build, dependency, and shell boundaries must account for both explicit allowlisted actions and broad trust-mode settings before an agent executes project-supplied scripts.

## Control Implications

- Route wrapper, dependency, and plugin downloads through an organization-managed artifact proxy.
- Use download-only artifact credentials and keep them outside the project.
- Redirect Maven, Gradle, and agent caches into a project-local ignored directory.
- Do not share agent-writable caches as trusted binary caches with other projects or users.
- Approval-gate changes to build files, wrappers, plugin configuration, and repository sources.
- Evaluate network policy and artifact provenance together; an allowlisted proxy reduces sources but does not make every artifact safe.
- Treat Build, RunTest, Preview, and build-script edits as separate approval classes.
- Review project import and dependency refresh as execution triggers when an agent can edit build scripts.
- Audit Brave mode or equivalent trust-level settings separately from per-action allowlists because broad modes can change whether sensitive commands prompt at runtime.

## Authoritative Sources

- [Codex Development Security Guide](../../../guides/agent-security/Codex-Development-Security-Guide.md)
- [JetBrains AI Development Security Guide - Junie profile](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md)
- [July 30 leaf update watch source](../../../raw/processed/2026-07-30/ai-security-wiki-leaf-update-watch-2026-07-30T200159-0400.json)
- [August 16 leaf update watch source](../../../raw/processed/2026-08-16/ai-security-wiki-leaf-update-watch-2026-08-16T200300-0400.json)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [AI development workstation containment](ai-development-workstation-containment.md)
- [AI guardrail dependency compromise](ai-guardrail-dependency-compromise.md)
- Upstream AI development wiki owns general [sensitive-data and supply-chain controls](../../../upstream-ai-dev-wiki/governance-and-risk/sensitive-data-and-supply-chain-controls.md).

## Open Questions

- Which artifact-proxy attestations and malware checks are required before an agent-writable project cache may be reused?

## Maintenance Notes

- Created on 2026-07-30 from the build, cache, and artifact-proxy sections of the [Codex](../../../guides/agent-security/Codex-Development-Security-Guide.md) and [Junie CLI](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md) security guides; enriched from the [July 30 leaf watcher](../../../raw/processed/2026-07-30/ai-security-wiki-leaf-update-watch-2026-07-30T200159-0400.json) with Junie build/test/preview and build-script execution evidence.
- Updated on 2026-08-16 from the [August 16 leaf watcher](../../../raw/processed/2026-08-16/ai-security-wiki-leaf-update-watch-2026-08-16T200300-0400.json) with Junie Action Allowlist and Brave mode command-prompting boundaries.
