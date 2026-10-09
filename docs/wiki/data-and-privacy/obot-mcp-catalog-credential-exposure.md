---
type: "Topic"
title: "Obot MCP Catalog Credential Exposure"
description: "Security analysis for CVE-2026-105138 plaintext static secrets exposed through Obot MCP catalog entry APIs."
tags: ["data-and-privacy", "identity-and-access", "agent-and-tool-security"]
---

# Obot MCP Catalog Credential Exposure

## Current Understanding

The [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json) records [CVE-2026-105138](https://cveawg.mitre.org/api/cve/CVE-2026-105138) for Obot MCP catalog credential exposure. Broad Obot product context belongs upstream; this page owns the local MCP catalog secret-read boundary.

The CVE title says Obot 0.12.0 before 0.26.2 exposes credentials via the MCP Catalog Entry API. The collector records that authenticated users granted access to MCP catalog entries can read plaintext static secrets from those entries, crossing from catalog visibility into backend credential disclosure.

## Security Impact

- Threat: authenticated users can recover static secrets from MCP catalog entries they can enumerate or read.
- Affected boundary: Obot 0.12.0 before 0.26.2, MCP catalog entries, static secrets, API authorization resources, and catalog-entry response shaping.
- Exploit or incident status: public CVE Services record and GitHub advisory; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to Obot 0.26.2 or later and redact or omit stored secrets from catalog-entry read APIs regardless of catalog access.
- Confidence: high for affected range and fixed version from CVE Services; medium for exact response fields until the patch is reconciled.
- Residual risk: MCP catalogs need separate permissions for discovering a connection, launching tools, and reading stored credentials.

## Authoritative Sources

- [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json)
- [CVE-2026-105138 record](https://cveawg.mitre.org/api/cve/CVE-2026-105138)
- [GHSA-q5wf-87f5-cxgq](https://github.com/obot-platform/obot/security/advisories/GHSA-q5wf-87f5-cxgq)
- [Obot 0.26.2 release](https://github.com/obot-platform/obot/releases/tag/v0.26.2)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [Obot vMCP prompt resource authorization bypass](../identity-and-access/obot-vmcp-prompt-resource-authorization-bypass.md)
- [Obot composite MCP route authorization bypass](../identity-and-access/obot-composite-mcp-route-authorization-bypass.md)
- Upstream AI wiki owns broad [Obot product coverage](../../../upstream-ai-wiki/mcp-servers/obot-mcp-enterprise-roadmap.md).

## Open Questions

- Does Obot 0.26.2 rotate or invalidate secrets that were exposed through catalog-entry reads before upgrade?

## Maintenance Notes

- Created on 2026-10-09 from the [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json) as a secret-disclosure leaf distinct from Obot route authorization issues.
