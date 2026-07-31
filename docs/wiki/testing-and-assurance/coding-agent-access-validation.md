---
type: "Topic"
title: "Coding Agent Access Validation"
description: "Assurance workflow for proving expected allow and block behavior across coding-agent security boundaries."
tags: ["testing-and-assurance"]
---

# Coding Agent Access Validation

## Current Understanding

Coding agent access validation tests the deployed boundary rather than assuming configuration text is effective. Each probe states whether the operation should be allowed or blocked, uses synthetic files and disposable services, and is run through the same agent surface and account used for development.

The local validation baselines split evidence by control surface:

- The [Codex access-validation guide](../../../guides/agent-security/Codex-Access-Validation-Scripts-Guide.md) and its [PowerShell generator](../../../guides/agent-security/scripts/Generate-Codex-Access-Validation-Scripts.ps1) create explicit setup, test, and cleanup scripts with reviewed literal Windows paths.
- The [Codex security guide](../../../guides/agent-security/Codex-Development-Security-Guide.md) adds deployment checks for permission profiles, local Git, network egress, product tools, task mode, and cloud-environment operating practice.
- The [Junie profile in the JetBrains AI Development Security Guide](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md) requires one-command-at-a-time approval tests rather than a wrapper that would collapse several decisions into one.

Validation output is evidence only when the expected result is compared with the observed result. A network diagnostic can execute successfully while reporting that a port is closed, so service reachability must be judged from its result fields rather than process exit alone.

The [July 30 leaf update watch source](../../../raw/processed/2026-07-30/ai-security-wiki-leaf-update-watch-2026-07-30T200159-0400.json) adds [Junie Headless mode](https://junie.jetbrains.com/docs/junie-headless.html) as an assurance target for exact-project trust markers, parent-directory trust markers, and unknown-project restricted mode in non-interactive contexts.

## Assurance Workflow

1. Review every literal path and expected result before generating or running probes.
2. Create only synthetic sentinel files and use a disposable development schema.
3. Run the test through the non-elevated agent surface under the intended development identity.
4. Compare every filesystem, Git, tool, loopback, database, public-network, remote-system, and feature result with its declared allow or block expectation.
5. Run cleanup directly as the developer and confirm that only the named synthetic artifacts were removed.
6. Re-run the suite after agent, sandbox, authentication, policy, toolchain, artifact proxy, network, or database changes.
7. Probe exact-project trust, parent-directory trust, and unknown-project restricted mode separately when non-interactive agent modes can load repository-controlled inputs.

## Authoritative Sources

- [Codex Access Validation Scripts Guide](../../../guides/agent-security/Codex-Access-Validation-Scripts-Guide.md)
- [Generate Codex Access Validation Scripts](../../../guides/agent-security/scripts/Generate-Codex-Access-Validation-Scripts.ps1)
- [Codex Development Security Guide](../../../guides/agent-security/Codex-Development-Security-Guide.md)
- [JetBrains AI Development Security Guide - Junie profile](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md)
- [JetBrains AI Development Security Guide - AI Assistant profile](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md)
- [July 30 leaf update watch source](../../../raw/processed/2026-07-30/ai-security-wiki-leaf-update-watch-2026-07-30T200159-0400.json)

## Related Code

- [PowerShell generator](../../../guides/agent-security/scripts/Generate-Codex-Access-Validation-Scripts.ps1)

## Related Tests

- The generated `Setup-Codex-Access-Validation.ps1`, `Test-Codex-Access-Validation.ps1`, and `Cleanup-Codex-Access-Validation.ps1` scripts are the executable validation artifacts.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [testing and assurance](index.md)
- [AI development workstation containment](../infrastructure-and-supply-chain/ai-development-workstation-containment.md)
- [coding agent command approval boundaries](../agent-and-tool-security/coding-agent-command-approval-boundaries.md)

## Open Questions

- Which machine-readable evidence format should retain expected and observed access results across workstation deployments?

## Maintenance Notes

- Created on 2026-07-30 from the [access-validation guide](../../../guides/agent-security/Codex-Access-Validation-Scripts-Guide.md), [PowerShell generator](../../../guides/agent-security/scripts/Generate-Codex-Access-Validation-Scripts.ps1), and deployment-verification sections of the [Codex](../../../guides/agent-security/Codex-Development-Security-Guide.md), [Junie CLI](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md), and [IntelliJ AI Assistant](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md) security guides; enriched from the [July 30 leaf watcher](../../../raw/processed/2026-07-30/ai-security-wiki-leaf-update-watch-2026-07-30T200159-0400.json) with trust-marker and restricted-mode validation evidence.
