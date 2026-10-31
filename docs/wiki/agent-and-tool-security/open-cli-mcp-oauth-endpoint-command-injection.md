---
type: "Topic"
title: "Open CLI MCP OAuth Endpoint Command Injection"
description: "Security analysis for CVE-2026-119025 at the MCP OAuth endpoint to local PowerShell boundary."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# Open CLI MCP OAuth Endpoint Command Injection

## Current Understanding

The [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json) records [CVE-2026-119025](https://nvd.nist.gov/vuln/detail/CVE-2026-119025): open 7.2.0 before 11.0.0 passes an MCP-provided OAuth authorization endpoint to PowerShell, allowing crafted subexpressions to execute on Windows or WSL. Broad open and MCP catalog context remains upstream; this leaf owns the untrusted authorization-metadata to shell boundary.

## Security Impact

- Threat: a malicious MCP server can turn OAuth endpoint metadata into local code execution.
- Affected boundary: open 7.2.0 before 11.0.0, OAuth authorization endpoint handling, and PowerShell on Windows or WSL.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: upgrade to 11.0.0 or later and prevent remote authorization metadata from reaching shell interpreters.
- Confidence and residual risk: high for the disclosed version range; developer environments remain exposed when they authorize untrusted MCP servers.

## Authoritative Sources

- [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json)
- [NVD CVE-2026-119025](https://nvd.nist.gov/vuln/detail/CVE-2026-119025)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)

## Open Questions

- Does the upstream remediation also constrain every non-PowerShell authorization-launch path?

## Maintenance Notes

- Created on 2026-10-30 from NVD-backed collector evidence.
