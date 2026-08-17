---
type: "Topic"
title: "GoMarble Facebook Ads MCP SSRF"
description: "Security analysis for CVE-2026-19956 SSRF in the GoMarble Facebook Ads MCP server."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# GoMarble Facebook Ads MCP SSRF

## Current Understanding

The [August 16 topic news collector source](../../../raw/processed/2026-08-16/ai-security-wiki-topic-news-collector-2026-08-16T233129Z.json) records CVE-2026-19956 / GHSA-8xwh-hx55-jjpr for GoMarble's facebook-ads-mcp-server 0.1.0. The [GitHub Advisory Database](https://github.com/advisories/GHSA-8xwh-hx55-jjpr) classifies the issue as server-side request forgery in `fetch_pagination_url`, and the public [patch pull request](https://github.com/gomarble-ai/facebook-ads-mcp-server/pull/32) constrains pagination requests to HTTPS on the exact `graph.facebook.com` host, blocks URL credentials and nonstandard ports, rejects malformed and control-character URLs, disables redirects, and adds a timeout.

Broad GoMarble, Meta Ads, and MCP server catalog context belongs upstream in the AI wiki if durable product coverage is needed. This local page owns the security boundary: an agent-visible advertising-data tool can become an SSRF bridge from a trusted MCP context into internal services, loopback listeners, or cloud metadata endpoints when follow-on pagination URLs are not destination-allowlisted.

## Security Impact

- Threat: attacker-influenced pagination URLs can steer an MCP server fetcher away from the intended Meta Graph API destination.
- Affected boundary: gomarble-ai/facebook-ads-mcp-server 0.1.0, `fetch_pagination_url`, advertising-data MCP workflows, and the host or server network reachable from the MCP process.
- Exploit or incident status: public advisory and patch record; no in-the-wild exploitation was captured by the source.
- Mitigation state: apply the patch or a fixed release when available, allowlist the final HTTPS destination host, disable redirects for pagination fetches, block URL credentials and unexpected ports, set timeouts, and apply process-level egress restrictions.
- Confidence: high for vulnerability class, affected project, and patch behavior because the advisory and patch agree; medium for exact vulnerable and patched package-version ranges because the advisory lists those fields as unknown.
- Residual risk: MCP servers that fetch provider-controlled or attacker-influenced continuation URLs can bypass tool-intent review unless final-destination validation is enforced at the fetch boundary.

## Control Implications

- Validate the final URL destination for pagination, redirects, OAuth callback follow-ons, export links, and file downloads, not only the initial tool argument.
- Keep provider-specific MCP servers on narrow egress allowlists; a Meta Ads tool should not reach loopback, cloud metadata, private address ranges, or arbitrary public hosts.
- Log requested URL, normalized host, resolved IP class, redirect decision, tool name, delegated user, package version, and response class for investigation.
- Treat "provider API pagination" as an SSRF-sensitive boundary when the continuation URL is parsed from untrusted upstream data or tool output.

## Authoritative Sources

- [August 16 topic news collector source](../../../raw/processed/2026-08-16/ai-security-wiki-topic-news-collector-2026-08-16T233129Z.json)
- GitHub Advisory Database: https://github.com/advisories/GHSA-8xwh-hx55-jjpr
- NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-19956
- Patch pull request: https://github.com/gomarble-ai/facebook-ads-mcp-server/pull/32
- Patch commit: https://github.com/gomarble-ai/facebook-ads-mcp-server/commit/4e53875aa22e8991c2fa4a7660d86e1caba66659

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
- [Kimi Code FetchURL SSRF](kimi-code-fetchurl-ssrf.md)
- Upstream AI wiki owns broad MCP server and provider product catalog coverage.

## Open Questions

- Which package release first includes the `fetch_pagination_url` SSRF patch?

## Maintenance Notes

- Created on 2026-08-16 from the [August 16 topic collector](../../../raw/processed/2026-08-16/ai-security-wiki-topic-news-collector-2026-08-16T233129Z.json) after routing broad GoMarble, Meta Ads, and MCP server catalog context upstream.
