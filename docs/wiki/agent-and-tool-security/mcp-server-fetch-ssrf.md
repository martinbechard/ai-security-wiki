---
type: "Topic"
title: "MCP Server Fetch SSRF"
description: "Security analysis for CVE-2026-104120 SSRF in modelcontextprotocol mcp-server-fetch and mcp-server-everything Fetch Tool."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# MCP Server Fetch SSRF

## Current Understanding

The [October 2 topic collector source](../../../raw/processed/2026-10-02/ai-security-wiki-topic-news-collector-2026-10-02T233227Z.json) records [CVE-2026-104120](https://cveawg.mitre.org/api/cve/CVE-2026-104120) for `modelcontextprotocol` `mcp-server-fetch` and `mcp-server-everything`. Broad Model Context Protocol server catalog context belongs upstream; this page owns the local fetch-tool egress and URL-validation boundary.

The CVE record says versions 2026.6.0 through 2026.6.4 are affected when manipulation of the `fetch_url` URL or path argument initiates server-side request forgery. The record marks the exploit as public. A live check of the referenced [GitHub pull request 4890](https://github.com/modelcontextprotocol/servers/pull/4890) found it open and unmerged during this ingest, so the local mitigation state remains patch-pending rather than fixed-version-complete.

## Security Impact

- Threat: a caller, prompt, or agent plan can steer a fetch MCP server into internal services, loopback resources, private networks, or cloud metadata endpoints.
- Affected boundary: `mcp-server-fetch` and `mcp-server-everything` 2026.6.0 through 2026.6.4, `mcp_server_fetch/server.py`, `fetch_url`, URL/path validation, redirects, DNS resolution, and network egress.
- Exploit or incident status: public CVE record with public issue and patch references; no confirmed exploitation incident is recorded locally.
- Mitigation state: treat the official patch as pending until an accepted release or merged fix is confirmed; deploy outbound allow-lists, private-address blocks after DNS and redirect resolution, and network egress controls around fetch tools.
- Confidence: high for affected versions and SSRF class from CVE Services; medium for remediation timing because the referenced fix PR was open during ingest.
- Residual risk: first-party-looking MCP fetch servers can become high-trust egress pivots when clients allow model-selected URLs without independent network policy.

## Authoritative Sources

- [October 2 topic collector source](../../../raw/processed/2026-10-02/ai-security-wiki-topic-news-collector-2026-10-02T233227Z.json)
- [CVE-2026-104120 record](https://cveawg.mitre.org/api/cve/CVE-2026-104120)
- [NVD CVE-2026-104120](https://nvd.nist.gov/vuln/detail/CVE-2026-104120)
- [GitHub issue 4492](https://github.com/modelcontextprotocol/servers/issues/4492)
- [GitHub pull request 4890](https://github.com/modelcontextprotocol/servers/pull/4890)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent network egress controls](agent-network-egress-controls.md)
- [mcp-fetch IPv6 SSRF](mcp-fetch-ipv6-ssrf.md)
- Upstream AI wiki owns broad Model Context Protocol server catalog context.
- Upstream AI development wiki owns general MCP fetch-tool governance practice.

## Open Questions

- Which modelcontextprotocol release first includes the CVE-2026-104120 fix, and does it cover redirects, DNS rebinding, private IPv4/IPv6 ranges, and cloud metadata endpoints consistently?

## Maintenance Notes

- Created on 2026-10-03 from the [October 2 topic collector source](../../../raw/processed/2026-10-02/ai-security-wiki-topic-news-collector-2026-10-02T233227Z.json); live PR status was open and unmerged during ingest, so fixed-version status remains open.
