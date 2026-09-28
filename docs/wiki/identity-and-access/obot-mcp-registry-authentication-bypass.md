---
type: "Topic"
title: "Obot MCP Registry Authentication Bypass"
description: "Security analysis for CVE-2026-101063 unauthenticated Obot MCP Registry metadata access."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# Obot MCP Registry Authentication Bypass

## Current Understanding

The [September 27 topic collector source](../../../raw/processed/2026-09-27/ai-security-wiki-topic-news-collector-2026-09-27T233044Z.json) records [CVE-2026-101063](https://nvd.nist.gov/vuln/detail/CVE-2026-101063) for Obot before v0.23.0. Broad Obot and MCP Registry product coverage belongs upstream; this page owns the local unauthenticated registry metadata boundary.

NVD, the [GitHub advisory](https://github.com/obot-platform/obot/security/advisories/GHSA-pr6h-vr44-xq8j), and [VulnCheck](https://www.vulncheck.com/advisories/obot-before-0.23.0-authentication-bypass-via-registry-api) describe missing authentication enforcement on MCP Registry endpoints under `/v0.1/*` when registry authentication is enabled. An unauthenticated caller can request `/v0.1/servers` and read server names, descriptions, repository URLs, and connect URLs.

Affected boundary: Obot before v0.23.0.

Exploit or incident status: public advisory disclosure; local sources do not record confirmed active exploitation.

Mitigation state: upgrade to v0.23.0 or later and review exposed registry metadata if the registry was reachable.

Confidence: high for affected boundary and remediation from NVD plus linked advisory evidence.

Residual risk: exposed connect URLs and server metadata can aid later MCP-targeted phishing, authorization bypass attempts, or inventory reconnaissance even after the authentication gap is patched.

## Authoritative Sources

- [September 27 topic collector source](../../../raw/processed/2026-09-27/ai-security-wiki-topic-news-collector-2026-09-27T233044Z.json)
- [NVD CVE-2026-101063](https://nvd.nist.gov/vuln/detail/CVE-2026-101063)
- [GitHub advisory GHSA-pr6h-vr44-xq8j](https://github.com/obot-platform/obot/security/advisories/GHSA-pr6h-vr44-xq8j)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/obot-before-0.23.0-authentication-bypass-via-registry-api)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [Obot MCP enterprise roadmap](../../../upstream-ai-wiki/mcp-servers/obot-mcp-enterprise-roadmap.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [Obot MCP OAuth dynamic client registration](obot-mcp-oauth-dynamic-client-registration.md)
- [Obot MCP connect access control bypass](obot-mcp-connect-access-control-bypass.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-27 from the September 27 collector and NVD enrichment as a focused registry-authentication leaf.
