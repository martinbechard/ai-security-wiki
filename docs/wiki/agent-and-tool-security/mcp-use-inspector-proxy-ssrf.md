---
type: "Topic"
title: "mcp-use inspector proxy SSRF"
description: "Security analysis for CVE-2026-81091 mcp-use inspector proxy caller-supplied target SSRF."
tags: ["agent-and-tool-security"]
---

# mcp-use inspector proxy SSRF

## Current Understanding

The [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) and [August 28 topic collector source](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json) record [CVE-2026-81091](https://nvd.nist.gov/vuln/detail/CVE-2026-81091) for the `mcp-use` TypeScript inspector proxy. Broad [`mcp-use` framework coverage](../../../upstream-ai-wiki/topic-index.md) belongs upstream; this page owns the debugging-proxy destination authorization boundary.

## Security Impact

- Threat: browser- or agent-reachable inputs can set `X-Target-URL` or `__mcp_target` and proxy loopback, link-local, private, or redirect destinations
- Affected boundary: mcp-use TypeScript inspector proxy versions <= 2.3.2, including `X-Target-URL` and `__mcp_target` destination selection
- Exploit or incident status: public advisory evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: Apply the [GitHub advisory fix](https://github.com/mcp-use/mcp-use/security/advisories/GHSA-f2jg-rm2x-hc5p) when available; current code is recorded as adding `isSafeProxyTarget` checks plus redirect bounds, and deployments should enforce host, private-range, and final-destination validation before and after redirects.
- Confidence: high for advisory existence and affected boundary; medium-high for remediation mechanics while fixed release labeling remains less explicit than the code behavior.
- Residual risk: model- or browser-reachable helper surfaces can convert ordinary tool arguments into internal data access, credential use, or host execution when final authorization is missing.

## Authoritative Sources

- [August 29 leaf update watch source](../../../raw/processed/2026-08-29/ai-security-wiki-leaf-update-watch-20260829T000405Z.json)
- [August 28 topic collector source](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json)
- [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json)
- [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-81091)
- [CVE record](https://www.cve.org/CVERecord?id=CVE-2026-81091)
- [GitHub security advisory](https://github.com/mcp-use/mcp-use/security/advisories/GHSA-f2jg-rm2x-hc5p)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/mcp-use-inspector-proxy-server-side-request-forgery-via-caller-supplied-target-url)

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

- Updated on 2026-08-29 with [August 29 watcher](../../../raw/processed/2026-08-29/ai-security-wiki-leaf-update-watch-20260829T000405Z.json) provenance for the same durable advisory boundary.
- Updated on 2026-08-29 with [August 28 topic collector](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json) provenance while preserving the existing leaf boundary and avoiding duplicate digest grouping.
- Created on 2026-08-28 from the [August 27 topic collector](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) as a focused inspector-proxy SSRF leaf after routing broad mcp-use context upstream; next check patched destination validation and redirect handling.
