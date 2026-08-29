---
type: "Topic"
title: "mcp-go DNS rebinding host validation"
description: "Security analysis for CVE-2026-81092 mcp-go missing Host validation DNS rebinding."
tags: ["agent-and-tool-security"]
---

# mcp-go DNS rebinding host validation

## Current Understanding

The [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) records [CVE-2026-81092](https://nvd.nist.gov/vuln/detail/CVE-2026-81092) for `mark3labs/mcp-go` HTTP transports. Broad [MCP framework coverage](../../../upstream-ai-wiki/techniques/mcp-transports.md) belongs upstream; this page owns local MCP transport Host, Origin, loopback, and browser-reachability controls.

## Security Impact

- Threat: a malicious browser page can use DNS rebinding against loopback MCP HTTP or SSE transports that do not validate Host and Origin before invoking tools or reading resources
- Affected boundary: mark3labs/mcp-go before v0.56.0; fixed in v0.56.0
- Exploit or incident status: public advisory evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: Upgrade to v0.56.0 or later and treat local MCP transports as network services requiring Host and Origin validation.
- Confidence: high for advisory existence and affected boundary; medium for remediation details when the primary advisory does not name a fixed release.
- Residual risk: model- or browser-reachable helper surfaces can convert ordinary tool arguments into internal data access, credential use, or host execution when final authorization is missing.

## Authoritative Sources

- [August 29 leaf update watch source](../../../raw/processed/2026-08-29/ai-security-wiki-leaf-update-watch-20260829T000405Z.json)
- [August 28 topic collector source](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json)
- [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json)
- [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-81092)
- [CVE record](https://www.cve.org/CVERecord?id=CVE-2026-81092)
- [https://github.com/mark3labs/mcp-go/releases/tag/v0.56.0](https://github.com/mark3labs/mcp-go/releases/tag/v0.56.0)
- [GitHub pull request](https://github.com/mark3labs/mcp-go/pull/921)

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
- Created on 2026-08-28 from the [August 27 topic collector](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) as a focused MCP transport Host/Origin validation leaf after routing broad mcp-go context upstream; next check whether v0.56.0 coverage also constrains browser-reachable loopback transports.
