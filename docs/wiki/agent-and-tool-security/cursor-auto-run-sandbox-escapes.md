---
type: "Topic"
title: "Cursor Auto-Run Sandbox Escapes"
description: "Security analysis for Cursor macOS Auto-Run Sandbox escape advisories involving Python environments and Docker."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Cursor Auto-Run Sandbox Escapes

## Current Understanding

Cursor Auto-Run Sandbox escapes are advisory-family evidence that a coding-agent sandbox can be bypassed through developer-environment artifacts. The [August 11 topic news collector source](../../../raw/processed/2026-08-11/ai-security-wiki-topic-news-collector-2026-08-11T233115Z.json) records CVE-2026-73217 for Cursor IDE before 3.1.2 on macOS and CVE-2026-73218 for Cursor before 3.0.0.

CVE-2026-73217 describes an agent replacing a virtual-environment Python executable so the Microsoft Python extension later invokes host commands outside the sandbox. CVE-2026-73218 describes a Docker Desktop and Dev Containers path where Docker's `virtiofs0` can expose home-directory read/write and host command execution without an additional prompt. Broad Cursor product and usage coverage belongs upstream; this page owns the local host-boundary and patch-control analysis.

## Security Impact

- Threat: an autonomous coding agent can mutate environment or container artifacts that trusted developer tooling later executes outside the intended sandbox.
- Affected boundary: Cursor IDE on macOS before 3.1.2 for CVE-2026-73217, Cursor before 3.0.0 for CVE-2026-73218, Python virtual environments, Microsoft Python extension execution, Docker Desktop, Dev Containers, home-directory mounts, and host command execution.
- Exploit or incident status: public vulnerability advisories and vulnerability-database updates; no confirmed in-the-wild exploitation in the collected source.
- Mitigation state: upgrade Cursor to patched versions; review Python environment executables and Docker/Dev Containers exposure where Auto-Run Sandbox was used.
- Confidence: high for CVE-2026-73217 because GitHub advisory and vulnerability feeds agree; medium-high for CVE-2026-73218 until the canonical GHSA details are captured directly.
- Residual risk: sandbox trust can fail when external tools treat agent-writable files as later host-executable configuration.

## Control Implications

- Treat virtual-environment executables, shell hooks, devcontainer files, Docker mounts, and IDE extension state as host-boundary artifacts.
- Keep agent-writable workspace paths separate from host-executed interpreter and container configuration where possible.
- Require a fresh prompt or deterministic policy gate before IDE extensions execute artifacts modified by an autonomous agent.
- Inventory developer tools that run outside the agent sandbox but consume workspace-controlled files.
- Patch coding-agent IDEs quickly when sandbox escape advisories affect host command execution.

## Authoritative Sources

- [August 11 topic news collector source](../../../raw/processed/2026-08-11/ai-security-wiki-topic-news-collector-2026-08-11T233115Z.json)
- Cursor advisory for CVE-2026-73217: https://github.com/cursor/cursor/security/advisories/GHSA-p9g2-cr55-cw9c
- Vulners CVE-2026-73217 record: https://vulners.com/cve/CVE-2026-73217
- Tenable CVE feed: https://www.tenable.com/cve

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [local agent execution and processing boundaries](local-agent-execution-and-processing-boundaries.md)
- [AI development workstation containment](../infrastructure-and-supply-chain/ai-development-workstation-containment.md)
- [AI agent sandbox escape host file access](../infrastructure-and-supply-chain/ai-agent-sandbox-escape-host-file-access.md)
- Upstream AI wiki owns broad Cursor developer-tool context.

## Open Questions

- What canonical advisory URL and affected-version details should be captured for CVE-2026-73218?
- Which IDE extensions besides Microsoft Python can execute agent-modified environment artifacts outside the sandbox?

## Maintenance Notes

- Created on 2026-08-11 from the [August 11 topic collector](../../../raw/processed/2026-08-11/ai-security-wiki-topic-news-collector-2026-08-11T233115Z.json) as one closely coupled Cursor sandbox-escape advisory family.
