---
type: "Topic"
title: "esp-mcp Tool-Parameter Command Injection"
description: "Security analysis for CVE-2026-117567 shell execution from agent tool parameters."
tags: ["agent-and-tool-security"]
---

# esp-mcp Tool-Parameter Command Injection

## Current Understanding

The [October 28 collector source](../../../raw/processed/2026-10-28/ai-security-wiki-topic-news-collector-2026-10-28T233111Z.json) records [CVE-2026-117567](https://cveawg.mitre.org/api/cve/CVE-2026-117567): esp-mcp through commit `28afddf` passes agent-controlled values to `asyncio.create_subprocess_shell`. Broad tool catalog context belongs upstream; this page owns the tool-parameter shell boundary.

## Security Impact

- Threat: prompt-injection-reachable parameters execute commands as the server user.
- Affected boundary: esp-mcp through `28afddf9ff41ada117bb45fd49b526d3bf89749e`; target, port, project path, and project name.
- Exploit or incident status: public CVE; no local incident is recorded.
- Mitigation state: no fixed release is identified; pin away or disable the server.
- Confidence: high; residual risk remains for shell-based tool adapters.

## Control Implications

- Treat tool arguments as data through process execution and use argv APIs.
- Isolate embedded-development tooling from sensitive hosts and credentials.

## Authoritative Sources

- [October 28 collector source](../../../raw/processed/2026-10-28/ai-security-wiki-topic-news-collector-2026-10-28T233111Z.json)
- [CVE-2026-117567](https://cveawg.mitre.org/api/cve/CVE-2026-117567)

## Related Code

- Not yet identified.
## Related Tests

- Not yet identified.
## Related Backlog Items

- Not yet identified.
## Related Wiki Pages

- [agent and tool security](index.md)
## Open Questions

- Is a non-shell invocation patch available upstream?
## Maintenance Notes

- Created on 2026-10-28 from the October 28 collector.
