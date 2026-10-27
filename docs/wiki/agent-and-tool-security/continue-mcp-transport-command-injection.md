---
type: "Topic"
title: "Continue MCP Transport Command Injection"
description: "Security analysis for CVE-2026-116109 command injection in Continue MCP transport configuration."
tags: ["agent-and-tool-security"]
---

# Continue MCP Transport Command Injection

## Current Understanding

The October 26 collector records [CVE-2026-116109](https://nvd.nist.gov/vuln/detail/CVE-2026-116109) and [GHSA-3cxv-6mgc-j7c4](https://github.com/advisories/GHSA-3cxv-6mgc-j7c4) in Continue 2.0.0. Broad Continue product coverage belongs upstream; this page owns the MCP connection-configuration boundary where an untrusted transport setting can reach OS command execution.

## Security Impact

- Threat: a remote attacker can manipulate `MCPManagerSingleton.setConnections` in `ConfigHandler.ts` to inject an OS command.
- Affected boundary: Continue 2.0.0 MCP Server Transport configuration.
- Exploit or incident status: public exploit availability is reported by the CVE record; no local incident evidence is recorded.
- Mitigation state: no fixed release is established by the collected evidence; prevent untrusted configuration from selecting shell-capable transports and require a patched release once maintainer remediation is confirmed.
- Confidence: medium because the GitHub advisory is unreviewed and maintainer remediation remains unconfirmed.
- Residual risk: agent and tool configuration becomes code-execution authority whenever validation permits values to reach a shell.

## Authoritative Sources

- [October 26 collector source](../../../raw/processed/2026-10-26/ai-security-wiki-topic-news-collector-2026-10-26T233009Z.json)
- [CVE-2026-116109 record](https://www.cve.org/CVERecord?id=CVE-2026-116109)
- [GHSA-3cxv-6mgc-j7c4](https://github.com/advisories/GHSA-3cxv-6mgc-j7c4)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Continue CLI unattended command denylist bypass](continue-cli-unattended-command-denylist-bypass.md)

## Open Questions

- Which maintained Continue release remediates CVE-2026-116109, and does it remove shell interpretation from transport configuration?

## Maintenance Notes

- Created on 2026-10-26 from the October 26 collector; product context remains upstream.
