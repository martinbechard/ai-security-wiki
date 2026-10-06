---
type: "Topic"
title: "Dify MCP Server Status Tenant Ownership"
description: "Security analysis for CVE-2026-105761 cross-application MCP server status and parameter updates in Dify."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# Dify MCP Server Status Tenant Ownership

## Current Understanding

The [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) records [CVE-2026-105761](https://nvd.nist.gov/vuln/detail/CVE-2026-105761) for Dify before 1.16.0. Broad Dify product context belongs upstream; this page owns MCP server ownership, tenant isolation, and parameter-integrity controls.

The NVD record says `PUT /console/api/apps/<app_id>/server` in the MCP server controller retrieved an `AppMCPServer` by a client-supplied server ID without verifying that the server belonged to the requested application and tenant. An authenticated workspace member could change another application's MCP server status and parameters.

## Security Impact

- Threat: workspace users can modify MCP server state or parameters for applications outside their intended tenant or app boundary.
- Affected boundary: Dify before 1.16.0; MCP server controller; app ID, tenant, and server ID ownership checks.
- Exploit or incident status: public NVD record; no local exploitation incident is recorded.
- Mitigation state: update to Dify 1.16.0 or later, re-check server ownership on every status and parameter update, and audit MCP server configuration changes made before the fix.
- Confidence: high for NVD timestamp and fixed version; medium on vendor remediation detail until a direct Dify advisory is captured.
- Residual risk: MCP server settings control which tools and data paths an LLM application can reach, so status or parameter drift can redirect or disable tool authority.

## Authoritative Sources

- [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json)
- [NVD CVE-2026-105761](https://nvd.nist.gov/vuln/detail/CVE-2026-105761)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [Dify plaintext API key exposure](../data-and-privacy/dify-plaintext-api-key-exposure.md)
- Upstream AI wiki owns broad Dify product context.

## Open Questions

- Which Dify advisory, pull request, or release note confirms the exact ownership check added in 1.16.0?

## Maintenance Notes

- Created on 2026-10-06 from the [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) as a separate tenant-ownership boundary from the earlier plaintext provider-key exposure leaf.
