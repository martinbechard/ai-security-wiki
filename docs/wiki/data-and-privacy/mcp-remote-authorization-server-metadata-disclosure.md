---
type: "Topic"
title: "mcp-remote Authorization Server Metadata Disclosure"
description: "Security analysis for CVE-2026-51995, where mcp-remote authorization-server metadata handling could disclose sensitive information."
tags: ["data-and-privacy", "agent-and-tool-security"]
---

# mcp-remote Authorization Server Metadata Disclosure

## Current Understanding

The [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) records [CVE-2026-51995](https://cveawg.mitre.org/api/cve/CVE-2026-51995) for mcp-remote 0.1.32 through 0.1.38. Broad mcp-remote package cataloging belongs upstream; this page owns the local authorization-server metadata exposure boundary.

The CVE source identifies sensitive information exposure through `src/lib/authorization-server-metadata.ts` and `src/lib/utils.ts`. The collector keeps this within the same remote MCP OAuth trust path but the disclosure boundary changes independently from SSRF and code-execution issues.

## Security Impact

- Threat: authorization-server metadata handling can expose sensitive MCP OAuth information to an attacker-controlled remote server path.
- Affected boundary: mcp-remote 0.1.32 through 0.1.38; authorization-server metadata and utility handling.
- Exploit or incident status: public CVE/NVD records and public mcp-remote OAuth security write-up; no local incident evidence is recorded.
- Mitigation state: upgrade beyond the affected range and review OAuth metadata handling for least disclosure.
- Confidence: high for affected range and disclosure class; medium for exact data elements until patch detail is reviewed.
- Residual risk: delegated MCP OAuth flows can disclose authority metadata before a tool call happens.

## Authoritative Sources

- [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json)
- [CVE-2026-51995 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-51995)
- [NVD CVE-2026-51995](https://nvd.nist.gov/vuln/detail/CVE-2026-51995)
- [mcp-remote OAuth security write-up](https://github.com/playb0t/mcp-remote-oauth-security#readme)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)

## Open Questions

- Which OAuth metadata fields are exposed by CVE-2026-51995, and can they aid token interception or server impersonation?

## Maintenance Notes

- Created on 2026-09-25 from the [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) as the mcp-remote authorization-server metadata disclosure leaf.
