---
type: "Topic"
title: "mcp-remote OAuth Metadata SSRF"
description: "Security analysis for CVE-2026-51994, where mcp-remote OAuth resource metadata URLs could drive SSRF."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# mcp-remote OAuth Metadata SSRF

## Current Understanding

The [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) records [CVE-2026-51994](https://cveawg.mitre.org/api/cve/CVE-2026-51994) for mcp-remote 0.1.32 through 0.1.38. Broad mcp-remote package cataloging belongs upstream; this page owns the local OAuth metadata URL fetching boundary for remote MCP clients.

The CVE source says mcp-remote extracted a `resource_metadata` URL from a remote MCP server's `WWW-Authenticate` header and could reach SSRF. That makes server discovery itself a network input that needs final-destination validation.

## Security Impact

- Threat: attacker-controlled MCP server metadata can make the client request unintended internal or sensitive destinations.
- Affected boundary: mcp-remote 0.1.32 through 0.1.38; OAuth resource metadata URL handling from `WWW-Authenticate`.
- Exploit or incident status: public CVE/NVD records and public mcp-remote OAuth security write-up; no local incident evidence is recorded.
- Mitigation state: upgrade beyond the affected range and validate final metadata destinations, redirects, DNS resolution, and private address ranges.
- Confidence: high for affected range and SSRF class; medium for reachable network blast radius.
- Residual risk: MCP OAuth discovery endpoints must be treated as untrusted remote input.

## Authoritative Sources

- [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json)
- [CVE-2026-51994 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-51994)
- [NVD CVE-2026-51994](https://nvd.nist.gov/vuln/detail/CVE-2026-51994)
- [mcp-remote OAuth security write-up](https://github.com/playb0t/mcp-remote-oauth-security#readme)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP client OAuth redirect URI handling](../identity-and-access/mcp-client-oauth-redirect-uri-handling.md)
- [agent network egress controls](agent-network-egress-controls.md)

## Open Questions

- Which mcp-remote release first blocks private or link-local metadata destinations for CVE-2026-51994?

## Maintenance Notes

- Created on 2026-09-25 from the [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) after splitting the mcp-remote advisory family by CVE boundary.
