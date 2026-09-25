---
type: "Topic"
title: "mcp-remote Browser Open Code Execution"
description: "Security analysis for CVE-2026-51997, where mcp-remote browser open handling could reach arbitrary code execution."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# mcp-remote Browser Open Code Execution

## Current Understanding

The [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) records [CVE-2026-51997](https://cveawg.mitre.org/api/cve/CVE-2026-51997) for mcp-remote 0.1.16 through 0.1.38. Broad mcp-remote package cataloging belongs upstream; this page owns the local browser-open target boundary in remote MCP authorization flows.

The CVE source identifies arbitrary code execution through `open()` functions. In an MCP OAuth bridge, browser-launch targets are delegated-control inputs because remote authorization metadata can influence what local helper opens.

## Security Impact

- Threat: attacker-influenced browser-open targets can become local code execution instead of a safe authorization navigation.
- Affected boundary: mcp-remote 0.1.16 through 0.1.38; `open()` function use during remote MCP authorization handling.
- Exploit or incident status: public CVE/NVD records and public mcp-remote OAuth security write-up; no local incident evidence is recorded.
- Mitigation state: upgrade beyond the affected range and restrict browser-open helpers to validated HTTP(S) authorization destinations.
- Confidence: high for affected range and code-execution class; medium for exact platform-specific launch mechanics.
- Residual risk: local browser helpers in agent authorization flows need URL scheme and argument isolation controls.

## Authoritative Sources

- [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json)
- [CVE-2026-51997 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-51997)
- [NVD CVE-2026-51997](https://nvd.nist.gov/vuln/detail/CVE-2026-51997)
- [mcp-remote OAuth security write-up](https://github.com/playb0t/mcp-remote-oauth-security#readme)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [mcp-remote server URL hash code execution](../infrastructure-and-supply-chain/mcp-remote-server-url-hash-code-execution.md)
- [MCP client OAuth redirect URI handling](../identity-and-access/mcp-client-oauth-redirect-uri-handling.md)

## Open Questions

- Which URL schemes or arguments reached `open()` in affected mcp-remote releases?

## Maintenance Notes

- Created on 2026-09-25 from the [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) as the mcp-remote browser-open execution leaf.
