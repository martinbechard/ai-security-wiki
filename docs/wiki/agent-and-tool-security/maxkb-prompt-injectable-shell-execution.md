---
type: "Topic"
title: "MaxKB Prompt-Injectable Shell Execution"
description: "Security analysis for CVE-2026-77521 prompt-influenced shell execution in MaxKB SandboxShellBackend."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# MaxKB Prompt-Injectable Shell Execution

## Current Understanding

The [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json) records [CVE-2026-77521](https://cveawg.mitre.org/api/cve/CVE-2026-77521) for MaxKB before 2.10.5-lts. Broad MaxKB product context belongs upstream; this page owns prompt-to-shell and human-interruption boundaries.

Assistants with a tool, MCP tool, skill, or sub-application use `SandboxShellBackend`, which exposes an `execute` shell tool without excluding it and omits `execute` from `interrupt_on`. Untrusted chat or ingested content can cause command execution. Source deployments with `MAXKB_SANDBOX` disabled run commands directly as the application user, while the official root container's string-based `gosu` wrapper can execute shell metacharacters outside the intended sandbox. Version 2.10.5-lts fixes the issue.

## Security Impact

- Threat: prompt-influenced content can trigger shell execution without the expected human approval gate.
- Affected boundary: MaxKB before 2.10.5-lts; `SandboxShellBackend`, `execute` tool exposure, and `interrupt_on` approval behavior.
- Exploit or incident status: public GitHub advisory with commit and release references; no local in-the-wild incident is recorded.
- Mitigation state: upgrade to 2.10.5-lts or later, require approval for shell execution, and avoid deployments where sandbox disablement turns assistant actions into direct application-user commands.
- Confidence: high because CVE Services, GitHub advisory, patch, and release evidence agree on mechanism and fix.
- Residual risk: execution tools need explicit approval and isolation even when exposed only through assistants or sub-applications.

## Authoritative Sources

- [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json)
- [CVE-2026-77521 JSON](https://cveawg.mitre.org/api/cve/CVE-2026-77521)
- [GitHub advisory GHSA-f36j-f34j-h3rx](https://github.com/1Panel-dev/MaxKB/security/advisories/GHSA-f36j-f34j-h3rx)
- [MaxKB 2.10.5-lts release](https://github.com/1Panel-dev/MaxKB/releases/tag/v2.10.5-lts)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MaxKB fexecve sandbox escape](../infrastructure-and-supply-chain/maxkb-fexecve-sandbox-escape.md)
- [MaxKB function-library sandbox escape](../infrastructure-and-supply-chain/maxkb-function-library-sandbox-escape.md)

## Open Questions

- Do deployments that disabled `MAXKB_SANDBOX` before 2.10.5-lts need separate incident review for prompt-triggered command execution?

## Maintenance Notes

- Created on 2026-09-21 from the [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json).
