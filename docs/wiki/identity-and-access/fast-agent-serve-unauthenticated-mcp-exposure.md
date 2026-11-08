---
type: "Topic"
title: "fast-agent Serve Unauthenticated MCP Exposure"
description: "Security analysis for CVE-2026-102610 in fast-agent's default MCP listener and shell-tool authority."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# fast-agent Serve Unauthenticated MCP Exposure

## Current Understanding

The [November 8 collector source](../../../raw/processed/2026-11-08/ai-security-wiki-topic-news-collector-2026-11-08T003537Z.json) records [CVE-2026-102610 / GHSA-9vhv-g5hf-m7m7](https://github.com/evalstate/fast-agent/security/advisories/GHSA-9vhv-g5hf-m7m7). In `fast-agent-mcp` through 0.7.20, `fast-agent serve` defaults to an HTTP MCP listener on `0.0.0.0:8000` without authentication; adding `--shell` lets a reachable client drive shell-tool execution as the server user. Broad fast-agent framework coverage belongs upstream; this page owns the listener-authentication and delegated-authority boundary.

## Security Impact

- Threat: a network-reachable, unauthenticated caller can invoke the exposed agent; with the optional shell tool, this can result in operating-system command execution as the service account.
- Affected boundary: `fast-agent-mcp` <= 0.7.20, its default HTTP listener and `/mcp` endpoint, plus shell-tool authority when `--shell` is enabled.
- Exploit or incident status: the public advisory documents controlled unauthenticated invocation and shell execution; no retained evidence establishes active exploitation or a local incident.
- Mitigation state: upgrade to 0.7.21 or later; bind to a restricted interface or network segment; require authenticated transport; and disable or narrowly scope the shell tool.
- Confidence: high for the default configuration, affected versions, and fixed release stated by the advisory.
- Residual risk: authentication alone does not reduce the impact of broadly delegated shell authority, so listener reachability and tool scope require separate review.

## Authoritative Sources

- [November 8 collector source](../../../raw/processed/2026-11-08/ai-security-wiki-topic-news-collector-2026-11-08T003537Z.json)
- [CVE-2026-102610 / GHSA-9vhv-g5hf-m7m7](https://github.com/evalstate/fast-agent/security/advisories/GHSA-9vhv-g5hf-m7m7)
- [fast-agent 0.7.21 release](https://github.com/evalstate/fast-agent/releases/tag/v0.7.21)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)

## Open Questions

- Which supported deployment modes make authenticated transport mandatory, rather than an operator-selected configuration?

## Maintenance Notes

- Created on 2026-11-08 from an NVD-timed disclosure. The GitHub advisory was published before the collector window and is retained as primary technical evidence.
