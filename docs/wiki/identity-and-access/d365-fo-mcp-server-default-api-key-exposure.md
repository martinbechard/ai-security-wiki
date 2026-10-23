---
type: "Topic"
title: "D365 F&O MCP Server Default API-Key Exposure"
description: "Security analysis for CVE-2026-114123 anonymous MCP access from a default empty API key."
tags: ["identity-and-access", "data-and-privacy"]
---

# D365 F&O MCP Server Default API-Key Exposure

## Current Understanding

The [October 21 topic collector source](../../../raw/processed/2026-10-21/ai-security-wiki-topic-news-collector-2026-10-21T193103-0400.json) records [CVE-2026-114123](https://nvd.nist.gov/vuln/detail/CVE-2026-114123) / [GHSA-8764-fh3m-wf7g](https://github.com/dynamics365ninja/d365fo-mcp-server/security/advisories/GHSA-8764-fh3m-wf7g). Broad Dynamics 365, Azure, and MCP-server catalog coverage belongs upstream; this leaf owns the default-deployment authentication and proprietary-data boundary.

## Security Impact

- Threat: an Azure deployment retaining an empty `API_KEY` can expose read and search tools to anonymous callers and reveal indexed proprietary source snippets or security metadata.
- Affected boundary: D365 F&O MCP Server before 1.11.0 when the HTTP listener binds to `0.0.0.0` without effective upstream authentication or network restriction.
- Exploit or incident status: public GitHub advisory and NVD record; no local exploitation incident is recorded.
- Mitigation state: upgrade to 1.11.0, configure a non-empty API key, and enforce upstream authentication and network restrictions.
- Confidence: high because the primary references identify preconditions, impact, and fixed version.
- Residual risk: a read-only data tool can disclose privilege structure and business information when its default deployment accepts anonymous traffic.

## Authoritative Sources

- [October 21 topic collector source](../../../raw/processed/2026-10-21/ai-security-wiki-topic-news-collector-2026-10-21T193103-0400.json)
- [October 23 leaf update watch source](../../../raw/processed/2026-10-23/ai-security-wiki-leaf-update-watch-20261023T000535Z.json)
- [GitHub advisory GHSA-8764-fh3m-wf7g](https://github.com/dynamics365ninja/d365fo-mcp-server/security/advisories/GHSA-8764-fh3m-wf7g)
- [NVD CVE-2026-114123](https://nvd.nist.gov/vuln/detail/CVE-2026-114123)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [Argocd MCP unauthenticated HTTP tool control](../agent-and-tool-security/argocd-mcp-unauthenticated-http-tool-control.md)

## Open Questions

- Which deployment templates or network controls can guarantee that blank API-key configurations fail closed?

## Maintenance Notes

- Updated on 2026-10-23 with watcher provenance; no distinct security delta was reported.
- Created on 2026-10-21 from the October 21 topic collector as a default-authentication and data-exposure leaf.
