---
type: "Topic"
title: "n8n MCP OAuth Dynamic Client Registration Redirect"
description: "Security analysis for CVE-2026-126386 accepting arbitrary redirect URIs during n8n MCP OAuth client registration."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# n8n MCP OAuth Dynamic Client Registration Redirect

## Current Understanding

The [November 15 collector source](../../../raw/processed/2026-11-15/ai-security-wiki-topic-news-collector-2026-11-15T003503Z.json) records [CVE-2026-126386](https://nvd.nist.gov/vuln/detail/CVE-2026-126386): n8n accepted arbitrary `redirect_uri` values at the unauthenticated `/mcp-oauth/register` dynamic-client-registration endpoint. Crafted authorization URLs could redirect a visitor to an attacker-controlled site before instance checks, enabling phishing in a delegated MCP consent flow. Broad [n8n MCP product context](../../../upstream-ai-wiki/mcp-servers/n8n-mcp.md) remains upstream; this page owns the OAuth redirect-origin boundary.

## Security Impact

- Threat: attacker-controlled registration data turns an authorization redirect into a phishing boundary.
- Affected boundary: n8n before 1.123.89; 2.x before 2.45.5; 2.46.x before 2.46.1; and 3.x before 3.0.1 at unauthenticated MCP OAuth dynamic client registration.
- Exploit or incident status: public advisory disclosure; no active exploitation or local incident is established.
- Mitigation state: upgrade to a listed fixed release and accept only redirect URIs that are validated against the client registration and the intended instance origin.
- Confidence: high for the affected and fixed ranges reported by the public advisory.
- Residual risk: previously registered attacker clients and user trust in pre-upgrade authorization links require review.

## Authoritative Sources

- [November 15 collector source](../../../raw/processed/2026-11-15/ai-security-wiki-topic-news-collector-2026-11-15T003503Z.json)
- [GitHub advisory GHSA-pc28-gvgp-xg9x](https://github.com/advisories/GHSA-pc28-gvgp-xg9x)
- [n8n repository advisory GHSA-rc3w-8jc8-7x3w](https://github.com/n8n-io/n8n/security/advisories/GHSA-rc3w-8jc8-7x3w)
- [NVD CVE-2026-126386](https://nvd.nist.gov/vuln/detail/CVE-2026-126386)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [n8n Workflow Tool credential exfiltration](../agent-and-tool-security/n8n-workflow-tool-credential-exfiltration.md)
- [MCP client OAuth redirect URI handling](mcp-client-oauth-redirect-uri-handling.md)

## Open Questions

- Does n8n document disabling the MCP OAuth endpoint as a supported interim control for unpatched deployments?

## Maintenance Notes

- Created on 2026-11-15 as a redirect-origin boundary distinct from n8n credential-reference and code-node issues.
