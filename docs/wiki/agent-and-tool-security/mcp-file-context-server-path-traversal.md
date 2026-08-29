---
type: "Topic"
title: "mcp-file-context-server path traversal"
description: "Security analysis for CVE-2026-81486 mcp-file-context-server read_context path traversal."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# mcp-file-context-server path traversal

## Current Understanding

The [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) records [CVE-2026-81486](https://nvd.nist.gov/vuln/detail/CVE-2026-81486) for `bsmi021/mcp-file-context-server` 1.0.0. Broad [MCP server catalog](../../../upstream-ai-wiki/mcp-servers/index.md) context belongs upstream; this page owns the file-context path confinement boundary for agent-visible file reads.

## Security Impact

- Threat: model-influenced `read_context` path values can traverse outside intended context roots and expose files to an MCP client
- Affected boundary: bsmi021 mcp-file-context-server 1.0.0
- Exploit or incident status: public advisory evidence with public exploit or PoC availability reported by vulnerability feeds; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: No fixed version is recorded in the source; bind file tools to canonical workspace roots and reject traversal after path resolution.
- Confidence: high for advisory existence and affected boundary; medium for remediation details when the primary advisory does not name a fixed release.
- Residual risk: model- or browser-reachable helper surfaces can convert ordinary tool arguments into internal data access, credential use, or host execution when final authorization is missing.

## Authoritative Sources

- [August 29 leaf update watch source](../../../raw/processed/2026-08-29/ai-security-wiki-leaf-update-watch-20260829T000405Z.json)
- [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json)
- [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-81486)
- [CVE record](https://www.cve.org/CVERecord?id=CVE-2026-81486)
- [GitHub issue](https://github.com/bsmi021/mcp-file-context-server/issues/15)

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
- Created on 2026-08-28 from the [August 27 topic collector](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) as a focused MCP file-context path-confinement leaf after routing broad MCP server context upstream; next check fixed-version status and exploit publication for `read_context` traversal.
