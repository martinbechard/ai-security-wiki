---
type: "Topic"
title: "ai-sdlc MCP Repository Command Injection"
description: "Security analysis for CVE-2026-117558 shell command injection from ai-sdlc MCP repository arguments."
tags: ["agent-and-tool-security"]
---

# ai-sdlc MCP Repository Command Injection

## Current Understanding

The [October 27 collector source](../../../raw/processed/2026-10-27/ai-security-wiki-topic-news-collector-2026-10-27T232925Z.json) records [CVE-2026-117558](https://cveawg.mitre.org/api/cve/CVE-2026-117558): ai-sdlc plugin MCP server versions through 0.31.2 interpolate a repository argument into GitHub CLI commands through `execSync()`. Shell metacharacters can therefore reach OS command execution; the CVE identifies prompt-injected agents as a route to that execution. Broad ai-sdlc and development-workflow context belongs upstream; this page owns the MCP tool-argument to local-shell boundary.

## Security Impact

- Threat: prompt-controlled or otherwise untrusted repository values execute commands with the MCP server user's authority.
- Affected boundary: `check-issue` and `check-pr-status` repository arguments in ai-sdlc plugin MCP server through 0.31.2.
- Exploit or incident status: public CVE disclosure; no active exploitation or local incident is identified.
- Mitigation state: deploy the upstream fix, pass arguments through non-shell process APIs, constrain repository identifiers structurally, and rotate credentials reachable to the vulnerable process if exposure is suspected.
- Confidence: high for the injection mechanism and affected version; the first released fixed version is not established by the collected evidence.
- Residual risk: validation based only on allowed strings remains fragile when any tool argument reaches shell interpretation.

## Authoritative Sources

- [October 27 collector source](../../../raw/processed/2026-10-27/ai-security-wiki-topic-news-collector-2026-10-27T232925Z.json)
- [CVE-2026-117558](https://cveawg.mitre.org/api/cve/CVE-2026-117558)
- [Upstream fix commit](https://github.com/ai-sdlc-framework/ai-sdlc/commit/717d7ecf068b714f65955e50fcf5cb4f9a0b5070)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)

## Open Questions

- Which release first contains the fix, and which credentials or GitHub CLI tokens could be exposed by a successful injection?

## Maintenance Notes

- Created on 2026-10-27 from the collector; product catalog and general development practice remain upstream-owned.
