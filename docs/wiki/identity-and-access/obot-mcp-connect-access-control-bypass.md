---
type: "Topic"
title: "Obot MCP Connect Access Control Bypass"
description: "Security analysis for CVE-2026-101084 Obot /mcp-connect Access Control Rule bypass."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# Obot MCP Connect Access Control Bypass

## Current Understanding

The [September 27 topic collector source](../../../raw/processed/2026-09-27/ai-security-wiki-topic-news-collector-2026-09-27T233044Z.json) records [CVE-2026-101084](https://nvd.nist.gov/vuln/detail/CVE-2026-101084) for Obot before v0.21.1. Broad Obot platform context belongs upstream; this page owns the local `/mcp-connect` access-control and stored OAuth credential boundary.

NVD, the [GitHub advisory](https://github.com/obot-platform/obot/security/advisories/GHSA-vw82-7fv8-r6gp), and [VulnCheck](https://www.vulncheck.com/advisories/obot-before-0.21.1-authorization-bypass-via-mcp-connect) describe `/mcp-connect` failing to enforce Access Control Rules. Any authenticated user with a restricted MCP server ID can connect to that server, bypass authorization checks, and access or manipulate backend systems through MCP tool calls using stored OAuth credentials.

Affected boundary: Obot before v0.21.1.

Exploit or incident status: public advisory disclosure; local sources do not record confirmed active exploitation.

Mitigation state: upgrade to v0.21.1 or later and review restricted MCP server IDs and stored OAuth credential use in exposed environments.

Confidence: high for affected boundary and remediation from NVD plus linked advisory evidence.

Residual risk: server IDs function as capability selectors when access control is missing; leaked IDs or logs can become useful authorization-bypass material.

## Authoritative Sources

- [September 27 topic collector source](../../../raw/processed/2026-09-27/ai-security-wiki-topic-news-collector-2026-09-27T233044Z.json)
- [NVD CVE-2026-101084](https://nvd.nist.gov/vuln/detail/CVE-2026-101084)
- [GitHub advisory GHSA-vw82-7fv8-r6gp](https://github.com/obot-platform/obot/security/advisories/GHSA-vw82-7fv8-r6gp)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/obot-before-0.21.1-authorization-bypass-via-mcp-connect)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [Obot MCP enterprise roadmap](../../../upstream-ai-wiki/mcp-servers/obot-mcp-enterprise-roadmap.md)
- [Obot MCP OAuth dynamic client registration](obot-mcp-oauth-dynamic-client-registration.md)
- [MCP tool-level IAM authorization](mcp-tool-level-iam-authorization.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-27 from the September 27 collector and NVD enrichment as a focused MCP access-control leaf.
