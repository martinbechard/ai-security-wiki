---
type: "Topic"
title: "Obot MCP OAuth Dynamic Client Registration"
description: "Security analysis for CVE-2026-101062 OAuth client registration and token audience bypass in Obot MCP flows."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# Obot MCP OAuth Dynamic Client Registration

## Current Understanding

The [September 27 topic collector source](../../../raw/processed/2026-09-27/ai-security-wiki-topic-news-collector-2026-09-27T233044Z.json) records [CVE-2026-101062](https://nvd.nist.gov/vuln/detail/CVE-2026-101062) for Obot before v0.23.0. Broad Obot platform context belongs upstream; this page owns the local MCP OAuth registration, consent, token audience, and delegated API-authority boundary.

NVD, the [GitHub advisory](https://github.com/obot-platform/obot/security/advisories/GHSA-xwmw-prc4-v3cr), and [VulnCheck](https://www.vulncheck.com/advisories/obot-before-0.23.0-authentication-bypass-via-oauth-dynamic-client-registration) describe unauthenticated dynamic client registration when `OBOT_SERVER_ENABLE_AUTHENTICATION=true`, unrestricted redirect URIs, an auto-completing authorization flow for an already logged-in user, and bearer tokens accepted beyond the requested MCP server because Obot validated issuer but not audience. Version v0.23.0 adds a consent screen, scopes MCP OAuth tokens to the MCP involved in the request, and enforces audience validation.

Affected boundary: Obot before v0.23.0, with affected versions reported as through v0.22.1 in NVD.

Exploit or incident status: public advisory disclosure; local sources do not record confirmed active exploitation.

Mitigation state: upgrade to v0.23.0 or later and revoke suspect tokens after exposure.

Confidence: high for affected boundary and remediation from NVD plus linked advisory evidence.

Residual risk: deployments that exposed MCP OAuth before v0.23.0 should treat attacker-registered clients and issued refresh tokens as durable credentials until revoked.

## Authoritative Sources

- [September 27 topic collector source](../../../raw/processed/2026-09-27/ai-security-wiki-topic-news-collector-2026-09-27T233044Z.json)
- [NVD CVE-2026-101062](https://nvd.nist.gov/vuln/detail/CVE-2026-101062)
- [GitHub advisory GHSA-xwmw-prc4-v3cr](https://github.com/obot-platform/obot/security/advisories/GHSA-xwmw-prc4-v3cr)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/obot-before-0.23.0-authentication-bypass-via-oauth-dynamic-client-registration)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [Obot MCP enterprise roadmap](../../../upstream-ai-wiki/mcp-servers/obot-mcp-enterprise-roadmap.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [Obot MCP registry authentication bypass](obot-mcp-registry-authentication-bypass.md)
- [Obot MCP connect access control bypass](obot-mcp-connect-access-control-bypass.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-27 from the September 27 collector and NVD enrichment as a focused OAuth/client-registration leaf.
