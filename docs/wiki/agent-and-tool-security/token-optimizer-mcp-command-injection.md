---
type: "Topic"
title: "token-optimizer-mcp Command Injection"
description: "Security analysis for CVE-2026-55157 command-injection risk in token-optimizer-mcp MCP tooling."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# token-optimizer-mcp Command Injection

## Current Understanding

The [August 15 topic news collector source](../../../raw/processed/2026-08-15/ai-security-wiki-topic-news-collector-2026-08-15T233140Z.json) records [GitHub Advisory Database evidence](https://github.com/advisories/GHSA-86qw-c7qw-gp4c) for CVE-2026-55157 in token-optimizer-mcp, with package-level command injection affecting MCP tooling that runs optimizer-related commands. Broad MCP server catalog context belongs upstream in the AI wiki; this local page owns the security boundary where an agent-delegated optimization helper can cross from tool invocation into host command execution.

The collector names GHSA-86qw-c7qw-gp4c, while a [Tenable package plugin page](https://www.tenable.com/plugins/cloud-security/445980) for the same CVE names GHSA-49mq-fc6q-3h46 and version 5.1.0 as the update target. Preserve that advisory-id discrepancy until primary GitHub or CVE metadata is reconciled; do not collapse the two identifiers into one without source confirmation.

The [August 16 leaf update watch source](../../../raw/processed/2026-08-16/ai-security-wiki-leaf-update-watch-2026-08-16T200300-0400.json) adds [GitLab Advisory Database](https://advisories.gitlab.com/npm/%40ooples/token-optimizer-mcp/CVE-2026-55157/) evidence that CVE-2026-55157 affects `@ooples/token-optimizer-mcp` through the `smart_user/get-user-info` boundary and identifies 5.1.0 as fixed. It also repeats GHSA-49mq-fc6q-3h46, so the alias conflict remains unresolved against the earlier GitHub identifier.

## Security Impact

- Threat: command injection inside an MCP server can turn a model-selected tool call into arbitrary host command execution.
- Affected boundary: token-optimizer-mcp package deployments and any agent or MCP client that can invoke optimizer commands with attacker-influenced inputs.
- Exploit or incident status: disclosed vulnerability advisory; no in-the-wild exploitation was captured by the source.
- Mitigation state: update `@ooples/token-optimizer-mcp` to 5.1.0 or later where that package lineage applies, isolate MCP servers from sensitive host credentials, and restrict command-capable tools to least-privilege runtimes.
- Confidence: high that CVE-2026-55157 is security-relevant to MCP command execution and that GitLab names 5.1.0 as fixed; medium for advisory alias reconciliation pending primary GitHub or CVE metadata.
- Residual risk: downstream agents can still expose host command surfaces when command-building tools share a broad shell, writable workspace, or unrestricted environment variables.

## Control Implications

- Treat optimizer and token-budget helper MCP servers as code-execution dependencies, not passive analysis tools.
- Pin package versions and record advisory identifiers in dependency inventories.
- Run command-capable MCP servers with constrained filesystem, network, shell, and environment-variable access.
- Log agent identity, delegated user, tool name, command template, arguments, package version, and command result for incident reconstruction.

## Authoritative Sources

- [August 15 topic news collector source](../../../raw/processed/2026-08-15/ai-security-wiki-topic-news-collector-2026-08-15T233140Z.json)
- [August 16 leaf update watch source](../../../raw/processed/2026-08-16/ai-security-wiki-leaf-update-watch-2026-08-16T200300-0400.json)
- GitHub Advisory Database: https://github.com/advisories/GHSA-86qw-c7qw-gp4c
- CVE Program record: https://www.cve.org/CVERecord?id=CVE-2026-55157
- GitLab Advisory Database: https://advisories.gitlab.com/npm/%40ooples/token-optimizer-mcp/CVE-2026-55157/
- Tenable package plugin page: https://www.tenable.com/plugins/cloud-security/445980

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent build and dependency execution boundaries](../infrastructure-and-supply-chain/agent-build-and-dependency-execution-boundaries.md)
- [AI guardrail dependency compromise](../infrastructure-and-supply-chain/ai-guardrail-dependency-compromise.md)
- Upstream AI wiki owns broad Model Context Protocol and MCP server catalog coverage.

## Open Questions

- Which GitHub advisory identifier is authoritative for CVE-2026-55157: GHSA-86qw-c7qw-gp4c or GHSA-49mq-fc6q-3h46?

## Maintenance Notes

- Created on 2026-08-15 from the [August 15 topic collector](../../../raw/processed/2026-08-15/ai-security-wiki-topic-news-collector-2026-08-15T233140Z.json) after routing broad MCP package catalog context upstream.
- Updated on 2026-08-16 from the [August 16 leaf watcher](../../../raw/processed/2026-08-16/ai-security-wiki-leaf-update-watch-2026-08-16T200300-0400.json) with GitLab fixed-version evidence and the `smart_user/get-user-info` boundary.
