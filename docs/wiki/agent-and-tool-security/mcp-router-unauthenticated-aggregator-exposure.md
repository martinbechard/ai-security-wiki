---
type: "Topic"
title: "mcp-router unauthenticated aggregator exposure"
description: "Security analysis for CVE-2026-81094 mcp-router all-interface unauthenticated aggregator exposure."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# mcp-router unauthenticated aggregator exposure

## Current Understanding

The [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) records [CVE-2026-81094](https://nvd.nist.gov/vuln/detail/CVE-2026-81094) for `mcp-router` before 0.6.3. Broad [MCP router catalog](../../../upstream-ai-wiki/mcp-servers/index.md) context belongs upstream; this page owns the MCP aggregator binding and authentication default boundary.

## Security Impact

- Threat: an all-interface MCP aggregator without mandatory token enforcement can expose multiple downstream tools to any reachable network client
- Affected boundary: mcp-router before 0.6.3; fixed in 0.6.3
- Exploit or incident status: public advisory evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: Upgrade to 0.6.3 or later; bind aggregators to loopback by default, require authentication, and refuse unsafe unauthenticated exposure.
- Confidence: high for advisory existence and affected boundary; medium for remediation details when the primary advisory does not name a fixed release.
- Residual risk: model- or browser-reachable helper surfaces can convert ordinary tool arguments into internal data access, credential use, or host execution when final authorization is missing.

## Authoritative Sources

- [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json)
- [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-81094)
- [CVE record](https://www.cve.org/CVERecord?id=CVE-2026-81094)
- [GitHub security advisory](https://github.com/mcp-router/mcp-router/security/advisories/GHSA-rx55-5c7h-r56r)
- [GitHub commit](https://github.com/mcp-router/mcp-router/commit/4c4642cfd274097ec8b33ecd3047390829c79d35)

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

- Created on 2026-08-28 from the [August 27 topic collector](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) as a focused MCP aggregator authentication leaf after routing broad mcp-router context upstream; next check default bind/auth behavior in versions after 0.6.3.
