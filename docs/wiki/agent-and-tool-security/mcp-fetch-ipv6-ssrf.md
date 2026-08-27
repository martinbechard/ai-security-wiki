---
type: "Topic"
title: "mcp-fetch IPv6 SSRF"
description: "Security analysis for CVE-2026-80347 mcp-fetch IPv6 literal SSRF filtering bypass."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# mcp-fetch IPv6 SSRF

## Current Understanding

The [August 26 topic news collector source](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json) records CVE-2026-80347 for `@kazuph/mcp-fetch` through 1.6.3. Broad MCP server catalog and package background belongs upstream in the AI wiki; this page owns the local SSRF guard and model-visible tool-result boundary.

The collector records an IPv6 literal normalization mismatch: `mcp-fetch` checked the target before stripping IPv6 brackets, then the HTTP client connected to the bracket-stripped loopback or IPv4-mapped IPv6 destination. That makes the issue adjacent to [mcp-webresearch browser SSRF](mcp-webresearch-browser-ssrf.md), [CKAN MCP Server SSRF filter bypass](ckan-mcp-server-ssrf-filter-bypass.md), and [agent network egress controls](agent-network-egress-controls.md): agent-facing retrieval tools need final-destination validation after URL parsing, DNS resolution, redirects, and address normalization.

## Security Impact

- Threat: model-influenced MCP fetch arguments can reach loopback, private, or metadata network targets and return internal responses into model context.
- Affected boundary: `@kazuph/mcp-fetch` through 1.6.3; URL validation, IPv6 literal normalization, private-network egress, and model-visible fetch results.
- Exploit or incident status: public NVD/CVE and VulnCheck advisory evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: no fixed version is recorded in the raw source; deployers should block private and metadata destinations at network policy and require canonical final-address checks.
- Confidence: high for advisory existence and mechanics from NVD/CVE plus VulnCheck; medium for remediation state until a fixed release is confirmed.
- Residual risk: string-only SSRF filters are brittle when the HTTP stack normalizes a destination differently than the preflight validator.

## Authoritative Sources

- [August 26 topic news collector source](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json)
- [NVD CVE-2026-80347](https://nvd.nist.gov/vuln/detail/CVE-2026-80347)
- [CVE-2026-80347 record](https://www.cve.org/CVERecord?id=CVE-2026-80347)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/mcp-fetch-through-1.6.3-server-side-request-forgery-via-unstripped-ipv6-literal-brackets)
- [mcp-fetch issue 16](https://github.com/kazuph/mcp-fetch/issues/16)

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
- [CKAN MCP Server SSRF filter bypass](ckan-mcp-server-ssrf-filter-bypass.md)

## Open Questions

- Which `@kazuph/mcp-fetch` release first fixes CVE-2026-80347, and does it validate resolved final destinations rather than only normalized URL strings?

## Maintenance Notes

- Created on 2026-08-27 from the [August 26 topic collector](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json) as a focused MCP retrieval SSRF leaf.
