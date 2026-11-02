---
type: "Topic"
title: "github-kanban-mcp-server Issue-List Command Injection"
description: "Security analysis for CVE-2026-116369 agent-provided issue-filter values reaching an operating-system command boundary."
tags: ["agent-and-tool-security"]
---

# github-kanban-mcp-server Issue-List Command Injection

## Current Understanding

The [November 2 collector source](../../../raw/processed/2026-11-02/ai-security-wiki-topic-news-collector-2026-11-02T003500Z.json) records [CVE-2026-116369](https://nvd.nist.gov/vuln/detail/CVE-2026-116369): github-kanban-mcp-server through 0.4.0 lets manipulated `state` or `labels` arguments reach the `handleListIssues` operating-system command path. General MCP-server catalog context belongs upstream; this page owns the agent-filter-to-host-command boundary.

## Security Impact

- Threat: a crafted issue-list filter can turn a read-oriented MCP tool call into host command execution.
- Affected boundary: github-kanban-mcp-server through 0.4.0, `handleListIssues`, and `state` or `labels` parameters; NVD describes a remote path requiring user interaction.
- Exploit or incident status: public NVD disclosure; no local incident or confirmed exploitation is recorded.
- Mitigation state: the collector records patch `253d93bbdf7ee9fe42bd8fdf15feea93ae59cbae` and release 0.4.1 as remediation references; upgrade and confirm deployed package provenance.
- Confidence: high for the affected and fixed version boundary.
- Residual risk: even after patching, agent-controlled filters should be passed as validated arguments rather than shell strings and the MCP process should lack sensitive host access.

## Control Implications

- Use structured argument execution and reject shell metacharacters rather than concatenating tool input into a command.
- Treat read-only tool descriptions as insufficient authorization evidence when implementation invokes a host shell.

## Authoritative Sources

- [November 2 collector source](../../../raw/processed/2026-11-02/ai-security-wiki-topic-news-collector-2026-11-02T003500Z.json)
- [NVD CVE-2026-116369](https://nvd.nist.gov/vuln/detail/CVE-2026-116369)
- [Maintainer patch](https://github.com/Sunwood-ai-labs/github-kanban-mcp-server/commit/253d93bbdf7ee9fe42bd8fdf15feea93ae59cbae)
- [0.4.1 release](https://github.com/Sunwood-ai-labs/github-kanban-mcp-server/releases/tag/v0.4.1)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [mcp-ffmpeg Command Injection](mcp-ffmpeg-command-injection.md)
- [coding-agent command approval boundaries](coding-agent-command-approval-boundaries.md)

## Open Questions

- Which deployed github-kanban-mcp-server instances still accept the affected filter parameters?

## Maintenance Notes

- Created on 2026-11-02 from the November 2 collector as a distinct issue-filter command-execution boundary.
