---
type: "Topic"
title: "nmap-mcp Intrusive Script Allowlist Bypass"
description: "Security analysis for CVE-2026-117570 delegated scan-capability bypass."
tags: ["agent-and-tool-security"]
---

# nmap-mcp Intrusive Script Allowlist Bypass

## Current Understanding

The [October 28 collector source](../../../raw/processed/2026-10-28/ai-security-wiki-topic-news-collector-2026-10-28T233111Z.json) records [CVE-2026-117570](https://cveawg.mitre.org/api/cve/CVE-2026-117570): Vorota-ai [nmap-mcp](../../../upstream-ai-wiki/mcp-servers/nmap-mcp.md) can bypass a script-category allowlist and run intrusive, brute-force, exploit, or denial-of-service scripts. General Nmap MCP context belongs upstream; this page owns the capability-enforcement boundary.

## Security Impact

- Threat: delegated scan authority exceeds the policy that a caller selected.
- Affected boundary: nmap-mcp through `3636afa6ad4e159c7ad07ca35ede644f37db9c5e`, at `scan_vulnerabilities` category handling.
- Exploit or incident status: public CVE; no local incident is recorded.
- Mitigation state: no fixed release is identified; enforce script policy at the execution layer.
- Confidence: high; residual risk persists when capability class names are caller-controlled.

## Control Implications

- Bind authorizations to a server-enforced script allowlist, not classification strings.
- Keep intrusive and exploit scripts disabled in the worker runtime by default.

## Authoritative Sources

- [October 28 collector source](../../../raw/processed/2026-10-28/ai-security-wiki-topic-news-collector-2026-10-28T233111Z.json)
- [CVE-2026-117570](https://cveawg.mitre.org/api/cve/CVE-2026-117570)

## Related Code

- Not yet identified.
## Related Tests

- Not yet identified.
## Related Backlog Items

- Not yet identified.
## Related Wiki Pages

- [agent and tool security](index.md)
## Open Questions

- Does any maintained nmap-mcp revision make capability enforcement non-bypassable?
## Maintenance Notes

- Created on 2026-10-28 from the October 28 collector.
