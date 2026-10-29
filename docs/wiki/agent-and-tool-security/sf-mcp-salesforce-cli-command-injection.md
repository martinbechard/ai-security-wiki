---
type: "Topic"
title: "sf-mcp Salesforce CLI Command Injection"
description: "Security analysis for CVE-2026-117561 tool-flag command injection."
tags: ["agent-and-tool-security"]
---

# sf-mcp Salesforce CLI Command Injection

## Current Understanding

The [October 28 collector source](../../../raw/processed/2026-10-28/ai-security-wiki-topic-news-collector-2026-10-28T233111Z.json) records [CVE-2026-117561](https://cveawg.mitre.org/api/cve/CVE-2026-117561): Codefriar sf-mcp through 1.3.2 sends crafted Salesforce CLI flag values through incomplete escaping to `execSync`. Broad tool catalog context belongs upstream; this page owns the agent tool-to-process boundary.

## Security Impact

- Threat: a tool argument executes a shell command as the MCP-server user.
- Affected boundary: sf-mcp through 1.3.2 and Salesforce CLI flag values.
- Exploit or incident status: public CVE; no local incident is recorded.
- Mitigation state: no fixed version is identified; disable or contain the server pending a maintainer fix.
- Confidence: high; residual risk persists when escaping substitutes for argument separation.

## Control Implications

- Invoke Salesforce CLI through validated argv arrays, not `execSync` shell strings.
- Scope credentials and execution identity to the minimum Salesforce permissions.

## Authoritative Sources

- [October 28 collector source](../../../raw/processed/2026-10-28/ai-security-wiki-topic-news-collector-2026-10-28T233111Z.json)
- [CVE-2026-117561](https://cveawg.mitre.org/api/cve/CVE-2026-117561)

## Related Code

- Not yet identified.
## Related Tests

- Not yet identified.
## Related Backlog Items

- Not yet identified.
## Related Wiki Pages

- [agent and tool security](index.md)
## Open Questions

- Which maintained release replaces shell-string invocation?
## Maintenance Notes

- Created on 2026-10-28 from the October 28 collector.
