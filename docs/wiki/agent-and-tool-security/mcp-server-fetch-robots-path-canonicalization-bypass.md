---
type: "Topic"
title: "MCP Fetch Server Robots Path Canonicalization Bypass"
description: "Security analysis for GHSA-f9hh-cmx9-2f23, a robots policy bypass through path canonicalization."
tags: ["agent-and-tool-security", "governance-and-compliance"]
---

# MCP Fetch Server Robots Path Canonicalization Bypass

## Current Understanding

[GHSA-f9hh-cmx9-2f23](https://github.com/modelcontextprotocol/servers/security/advisories/GHSA-f9hh-cmx9-2f23), captured in the [November 11 collector source](../../../raw/processed/2026-11-11/ai-security-wiki-topic-news-collector-2026-11-11T193154-0500.json), reports divergent path handling between `mcp-server-fetch` and `robots.txt` restrictions, such as `//private` versus `/private`. Broad [MCP reference-server coverage](../../../upstream-ai-wiki/mcp-servers/modelcontextprotocol-reference-servers.md) belongs upstream; this page owns the content-access policy interpretation boundary.

The advisory claims a 2026.11.11 patch. No matching maintainer release artifact was available during ingestion, so the release claim is retained as an Open Question.

## Security Impact

- Threat: model-selected fetch paths bypass a site’s configured `robots.txt` disallow rule.
- Affected boundary: `mcp-server-fetch` >= 0.6.1 and < 2026.11.11, robots path comparison.
- Exploit or incident status: public advisory; no active exploitation incident is recorded.
- Mitigation state: canonicalize the request path and policy path identically before comparison; verify a published fixed release before relying on the claimed patch.
- Confidence: high for the disclosed policy mismatch; medium for patch availability.
- Residual risk: content-policy controls fail when tool and policy engines normalize the same path differently.

## Authoritative Sources

- [November 11 collector source](../../../raw/processed/2026-11-11/ai-security-wiki-topic-news-collector-2026-11-11T193154-0500.json)
- [GHSA-f9hh-cmx9-2f23](https://github.com/modelcontextprotocol/servers/security/advisories/GHSA-f9hh-cmx9-2f23)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP Fetch Server IPv6 Site-Local SSRF](mcp-server-fetch-ipv6-site-local-ssrf.md)

## Open Questions

- Which maintainer release and tests confirm the claimed 2026.11.11 policy-path fix?

## Maintenance Notes

- Created on 2026-11-11 from the November 11 collector source.
