---
type: "Topic"
title: "Junie CLI Untrusted-Project MCP Configuration Execution"
description: "Security analysis for CVE-2026-111091 execution through MCP configuration supplied by an untrusted project."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# Junie CLI Untrusted-Project MCP Configuration Execution

## Current Understanding

The [October 16 topic collector source](../../../raw/processed/2026-10-16/ai-security-wiki-topic-news-collector-2026-10-16T232823Z.json) records [CVE-2026-111091](https://cveawg.mitre.org/api/cve/CVE-2026-111091): Junie CLI before 26.8.3 can execute code from an untrusted project's MCP server configuration. Broad Junie workflow context belongs upstream; this page owns the repository-supplied MCP configuration execution boundary.

## Security Impact

- Threat: processing an untrusted project's MCP configuration can execute a project-controlled command locally.
- Affected boundary: Junie CLI earlier than 26.8.3; project-supplied MCP configuration loading.
- Exploit or incident status: public CVE; no local exploitation incident is recorded.
- Mitigation state: upgrade to 26.8.3 or later, treat project MCP configuration as executable supply-chain input, and require a separate trust decision before activation.
- Confidence: high for the affected version and code-execution claim; public evidence does not detail the exact activation sequence.
- Residual risk: a project trust indicator is insufficient if alternative configuration paths or startup modes can activate MCP servers before that trust decision.

## Control Implications

- Parse project MCP configuration without launching referenced commands until trust is explicit.
- Present the command, environment, and network target for each proposed server before activation.
- Test clone, open, review, headless, and explicit-configuration paths against an untrusted repository.

## Authoritative Sources

- [October 16 topic collector source](../../../raw/processed/2026-10-16/ai-security-wiki-topic-news-collector-2026-10-16T232823Z.json)
- [CVE-2026-111091 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-111091)
- [JetBrains security issues fixed](https://www.jetbrains.com/privacy-security/issues-fixed/)
- [October 17 leaf update watch source](../../../raw/processed/2026-10-17/ai-security-wiki-leaf-update-watch-20261018T000146Z.json)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [Local agent execution and processing boundaries](../agent-and-tool-security/local-agent-execution-and-processing-boundaries.md)
- [Kimi Code MCP configuration loader command injection](../agent-and-tool-security/kimi-code-mcp-configuration-loader-command-injection.md)

## Open Questions

- Which Junie CLI startup paths can still load project MCP configuration before a user-visible trust decision?

## Maintenance Notes

- Created on 2026-10-16 from CVE-2026-111091; preserve the distinction between configuration parsing and command activation.
- Confirmed on 2026-10-17 by the [leaf watcher](../../../raw/processed/2026-10-17/ai-security-wiki-leaf-update-watch-20261018T000146Z.json); it retains 26.8.3 as the reported fixed version and user interaction as a precondition.
