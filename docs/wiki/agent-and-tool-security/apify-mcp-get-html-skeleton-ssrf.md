---
type: "Topic"
title: "Apify MCP get-html-skeleton SSRF"
description: "Security analysis for CVE-2026-81093 Apify MCP get-html-skeleton SSRF."
tags: ["agent-and-tool-security"]
---

# Apify MCP get-html-skeleton SSRF

## Current Understanding

The [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) records [CVE-2026-81093](https://nvd.nist.gov/vuln/detail/CVE-2026-81093) for Apify MCP server `get-html-skeleton`. Broad Apify product and [MCP server catalog](../../../upstream-ai-wiki/mcp-servers/index.md) coverage belongs upstream; this page owns the agent web-fetch SSRF and model-context data exposure boundary.

## Security Impact

- Threat: model-supplied URLs that receive only syntax validation can fetch loopback, link-local, private-range, or metadata endpoints into model context
- Affected boundary: apify/apify-mcp-server before 0.9.12
- Exploit or incident status: public advisory evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: Upgrade to 0.9.12 or later and enforce IP-range and redirect controls on web-fetch helper tools.
- Confidence: high for advisory existence and affected boundary; medium for remediation details when the primary advisory does not name a fixed release.
- Residual risk: model- or browser-reachable helper surfaces can convert ordinary tool arguments into internal data access, credential use, or host execution when final authorization is missing.

## Authoritative Sources

- [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json)
- [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-81093)
- [CVE record](https://www.cve.org/CVERecord?id=CVE-2026-81093)
- [GitHub security advisory](https://github.com/apify/apify-mcp-server/security/advisories/GHSA-m28f-9v8h-gg2f)
- [GitHub pull request](https://github.com/apify/apify-mcp-server/pull/572)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](../agent-and-tool-security/index.md)
- [infrastructure and supply chain](../infrastructure-and-supply-chain/index.md)
- [identity and access](../identity-and-access/index.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-08-28 from the [August 27 topic collector](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) as a focused MCP web-fetch SSRF leaf after routing broad Apify context upstream; next check the first fixed Apify MCP version and whether redirects or metadata endpoints remain covered by tests.
