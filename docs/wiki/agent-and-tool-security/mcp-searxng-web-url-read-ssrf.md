---
type: "Topic"
title: "mcp-searxng web_url_read SSRF"
description: "Security analysis for CVE-2026-58485 mcp-searxng DNS-resolved private-hostname SSRF in web_url_read."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# mcp-searxng web_url_read SSRF

## Current Understanding

The [September 15 topic collector source](../../../raw/processed/2026-09-15/ai-security-wiki-topic-news-collector-2026-09-15T233112Z.json) records [CVE-2026-58485](https://cveawg.mitre.org/api/cve/CVE-2026-58485) for mcp-searxng before 1.7.1. Broad MCP server catalog and SearXNG coverage belongs upstream; this page owns the local web-reading tool, DNS resolution, and prompt-injection-to-private-network boundary.

The CVE says `web_url_read` validated only the literal hostname before the fetch layer performed operating-system DNS resolution. An attacker-controlled hostname can appear public during validation but resolve to private, loopback, link-local, or cloud metadata addresses at fetch time. The [GitHub advisory](https://github.com/ihor-sokoliuk/mcp-searxng/security/advisories/GHSA-mrvx-jmjw-vggc) also records deployment differences: default HTTP mode lacks authentication, while STDIO exploitation can occur when an AI agent is induced to call the tool with attacker-controlled URLs.

The [September 17 leaf update watch source](../../../raw/processed/2026-09-17/ai-security-wiki-leaf-update-watch-20260917T000423Z.json) adds the direct CVE Services publication timestamp and confirms affected versions through 1.6.0, with 1.7.1 identified as the patched version.

The [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) adds [CVE-2026-54689](https://cveawg.mitre.org/api/cve/CVE-2026-54689) for mcp-searxng before 1.2.0. This older affected range records another `web_url_read` policy bypass while hardening is enabled: redirect targets were not revalidated, `0.0.0.0` was not treated as internal, and IPv4-mapped IPv6 literals were missed.

## Security Impact

- Threat: malicious web content or prompt injection can steer an agent into fetching a crafted URL that reaches internal services through the MCP server.
- Affected boundary: mcp-searxng before 1.2.0 for redirect/private-address hardening gaps and before 1.7.1 for DNS-resolved private-hostname SSRF; `web_url_read`, hostname validation, DNS resolution, redirect handling, private-address blocking, and HTTP or STDIO tool exposure.
- Exploit or incident status: public CVE and GitHub advisory; no local exploitation incident is recorded.
- Mitigation state: upgrade mcp-searxng to 1.7.1 or later, validate resolved addresses at connect time, block private and metadata ranges after DNS and redirects, and require authentication for HTTP mode.
- Confidence: high for the affected range, SSRF class, and fixed release; the GitHub advisory is older but provides primary proof and deployment context.
- Residual risk: web-reading tools bridge untrusted internet content and agent-controlled tool invocation, so URL policies need DNS rebinding, redirect, and identity-aware transport checks.

## Authoritative Sources

- [September 15 topic collector source](../../../raw/processed/2026-09-15/ai-security-wiki-topic-news-collector-2026-09-15T233112Z.json)
- [September 17 leaf update watch source](../../../raw/processed/2026-09-17/ai-security-wiki-leaf-update-watch-20260917T000423Z.json)
- [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json)
- [CVE-2026-58485 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-58485)
- [CVE-2026-54689 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-54689)
- [GitHub advisory GHSA-mrvx-jmjw-vggc](https://github.com/ihor-sokoliuk/mcp-searxng/security/advisories/GHSA-mrvx-jmjw-vggc)
- [mcp-searxng patch pull request](https://github.com/ihor-sokoliuk/mcp-searxng/pull/120)
- [mcp-searxng 1.7.1 release](https://github.com/ihor-sokoliuk/mcp-searxng/releases/tag/v1.7.1)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP data movement exposure controls](../data-and-privacy/mcp-data-movement-exposure-controls.md)
- [Agent network egress controls](agent-network-egress-controls.md)
- [mcp-fetch IPv6 SSRF](mcp-fetch-ipv6-ssrf.md)

## Open Questions

- Does mcp-searxng 1.7.1 validate every resolved address after redirects and across IPv4, IPv6, and DNS rebinding cases?

## Maintenance Notes

- Created on 2026-09-16 from the [September 15 topic collector](../../../raw/processed/2026-09-15/ai-security-wiki-topic-news-collector-2026-09-15T233112Z.json) as an MCP web-reading SSRF leaf.
- Updated on 2026-09-17 from the [September 17 leaf update watch](../../../raw/processed/2026-09-17/ai-security-wiki-leaf-update-watch-20260917T000423Z.json) with direct CVE Services publication metadata and patched-version confirmation.
- Updated on 2026-09-19 from the [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) with CVE-2026-54689 redirect and private-address hardening evidence.
