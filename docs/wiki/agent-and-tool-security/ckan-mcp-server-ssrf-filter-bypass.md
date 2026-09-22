---
type: "Topic"
title: "CKAN MCP Server SSRF Filter Bypass"
description: "Security analysis for CKAN MCP Server hostname and DNS-resolution SSRF filtering bypasses."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# CKAN MCP Server SSRF Filter Bypass

## Current Understanding

The [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) records CVE-2026-53509 for CKAN MCP Server before 0.4.106. The [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json) adds CVE-2026-61612 for a follow-on DNS-resolution bypass before 0.4.108. Broad MCP catalog coverage belongs upstream; this page owns the local connector SSRF boundary where an agent-facing data tool can reach local or private resources.

The [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-53509) and linked [GitHub advisory](https://github.com/ondata/ckan-mcp-server/security/advisories/GHSA-g84h-j7jj-x32p) describe a hostname-validation bypass: the server inspected parsed hostname strings before issuing outbound requests, but aliases such as `ip6-localhost` could still resolve to loopback or private destinations. The [0.4.106 release](https://github.com/ondata/ckan-mcp-server/releases/tag/v0.4.106) is the patch boundary captured by the source.

The [CVE-2026-61612 record](https://cveawg.mitre.org/api/cve/CVE-2026-61612) and linked [GitHub advisory](https://github.com/ondata/ckan-mcp-server/security/advisories/GHSA-798p-78g2-v556) describe a third guard bypass: `validateServerUrl` checks the supplied hostname string without resolving DNS before outbound requests, so a hostname that resolves to loopback, private ranges, or the cloud metadata address can pass the preflight check. The [0.4.108 release](https://github.com/ondata/ckan-mcp-server/releases/tag/v0.4.108) is the captured fix boundary for this bypass.

This issue belongs near [mcp-webresearch browser SSRF](mcp-webresearch-browser-ssrf.md), [GoMarble Facebook Ads MCP SSRF](gomarble-facebook-ads-mcp-ssrf.md), and [agent network egress controls](agent-network-egress-controls.md) because all three make final-destination validation more important than surface-level URL parsing.

## Security Impact

- Threat: an MCP data connector can become an SSRF pivot from an agent tool invocation into loopback, metadata, or private network resources.
- Affected boundary: CKAN MCP Server before 0.4.106 for hostname-alias filtering and before 0.4.108 for DNS-resolution validation of caller-supplied `server_url` values.
- Exploit or incident status: public CVE and GitHub security advisory; no local exploitation evidence is recorded.
- Mitigation state: upgrade to 0.4.108 or later, and validate resolved addresses, redirects, aliases, and final destinations against an explicit egress policy.
- Confidence: high for advisory existence, affected ranges, and fix versions from CVE Services, NVD, linked GitHub advisories, and release references.
- Residual risk: MCP SSRF defenses remain fragile when they trust strings before DNS resolution, redirects, proxy handling, or network-layer allowlists.

## Authoritative Sources

- [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json)
- [August 23 leaf update watch source](../../../raw/processed/2026-08-23/ai-security-wiki-leaf-update-watch-20260824T000259Z.json)
- [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json)
- [NVD CVE-2026-53509](https://nvd.nist.gov/vuln/detail/CVE-2026-53509)
- [GitHub advisory GHSA-g84h-j7jj-x32p](https://github.com/ondata/ckan-mcp-server/security/advisories/GHSA-g84h-j7jj-x32p)
- [CKAN MCP Server 0.4.106 release](https://github.com/ondata/ckan-mcp-server/releases/tag/v0.4.106)
- [CVE-2026-61612 JSON](https://cveawg.mitre.org/api/cve/CVE-2026-61612)
- [NVD CVE-2026-61612](https://nvd.nist.gov/vuln/detail/CVE-2026-61612)
- [GitHub advisory GHSA-798p-78g2-v556](https://github.com/ondata/ckan-mcp-server/security/advisories/GHSA-798p-78g2-v556)
- [CKAN MCP Server 0.4.108 release](https://github.com/ondata/ckan-mcp-server/releases/tag/v0.4.108)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent network egress controls](agent-network-egress-controls.md)
- [mcp-webresearch browser SSRF](mcp-webresearch-browser-ssrf.md)
- [GoMarble Facebook Ads MCP SSRF](gomarble-facebook-ads-mcp-ssrf.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-08-22 from the [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) as a separate MCP connector SSRF leaf.
- Updated on 2026-09-21 from the [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json) after routing broad CKAN/MCP catalog context upstream and keeping the follow-on DNS-resolution SSRF bypass locally.
