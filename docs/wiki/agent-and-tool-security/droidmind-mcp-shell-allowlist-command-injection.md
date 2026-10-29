---
type: "Topic"
title: "DroidMind MCP Shell Allowlist Command Injection"
description: "Security analysis for CVE-2026-117559 shell allowlist bypass."
tags: ["agent-and-tool-security"]
---

# DroidMind MCP Shell Allowlist Command Injection

## Current Understanding

The [October 28 collector source](../../../raw/processed/2026-10-28/ai-security-wiki-topic-news-collector-2026-10-28T233111Z.json) records [CVE-2026-117559](https://cveawg.mitre.org/api/cve/CVE-2026-117559): DroidMind through 0.4.0 can accept `$()` or backticks that bypass a command allowlist. Product context belongs upstream; this page owns the agent-to-device shell boundary.

## Security Impact

- Threat: prompt-influenced MCP input can execute commands as the server user.
- Affected boundary: DroidMind through 0.4.0, `Device.run_shell`, and unvalidated `Device.list_directory` input.
- Exploit or incident status: public CVE; no local incident is recorded.
- Mitigation state: no fixed version is identified; disable or isolate the tooling.
- Confidence: high; residual risk persists wherever shell strings are policy-filtered.

## Control Implications

- Use argument-vector execution and narrowly typed capabilities instead of a shell allowlist.
- Run device tooling without production credentials or broad host access.

## Authoritative Sources

- [October 28 collector source](../../../raw/processed/2026-10-28/ai-security-wiki-topic-news-collector-2026-10-28T233111Z.json)
- [CVE-2026-117559](https://cveawg.mitre.org/api/cve/CVE-2026-117559)

## Related Code

- Not yet identified.
## Related Tests

- Not yet identified.
## Related Backlog Items

- Not yet identified.
## Related Wiki Pages

- [agent and tool security](index.md)
## Open Questions

- Has DroidMind published a non-shell remediation?
## Maintenance Notes

- Created on 2026-10-28 from the October 28 collector.
