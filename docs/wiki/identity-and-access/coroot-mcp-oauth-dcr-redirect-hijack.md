---
type: "Topic"
title: "Coroot MCP OAuth DCR Redirect Hijack"
description: "Security analysis for CVE-2026-79786 arbitrary redirect URIs in Coroot MCP OAuth dynamic client registration."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# Coroot MCP OAuth DCR Redirect Hijack

## Current Understanding

The [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) records [CVE-2026-79786](https://nvd.nist.gov/vuln/detail/CVE-2026-79786) for Coroot 1.20.2 through 1.24.5 MCP OAuth dynamic client registration. Broad Coroot product coverage belongs upstream; this page owns the local delegated-agent OAuth redirect and consent boundary.

The [VulnCheck advisory](https://www.vulncheck.com/advisories/coroot-1.20.2-through-1.24.5-unvalidated-redirect-uri-in-mcp-oauth-client-registration) evidence says an unauthenticated dynamic client registration endpoint accepted arbitrary redirect URIs. Attackers could register hostile clients, phish signed-in users for consent, capture authorization codes, and exchange them for MCP access tokens.

## Security Impact

- Threat: delegated MCP sessions can be hijacked through hostile OAuth redirect URIs.
- Affected boundary: Coroot 1.20.2 through 1.24.5 MCP OAuth dynamic client registration; NVD records CVSS HIGH and CWE-601.
- Exploit or incident status: public vulnerability advisory; no local exploitation incident is recorded.
- Mitigation state: validate redirect URIs, restrict DCR, require clear consent, and bind authorization codes to registered client metadata; exact fixed version after 1.24.5 is not yet captured in local evidence.
- Confidence: high for advisory identity and vulnerability class from NVD evidence.
- Residual risk: MCP OAuth implementations inherit OAuth client-registration attack paths when agent/tool clients are allowed to self-register.

## Control Implications

- Treat MCP OAuth DCR as an administrative capability unless redirect URI and client identity policy are strict.
- Require exact redirect allowlists, PKCE, client attestation where available, and consent screens that distinguish trusted local tools from attacker-registered clients.
- Log DCR events, redirect URIs, consent grants, authorization-code redemption, and MCP token scope.

## Authoritative Sources

- [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json)
- [NVD CVE-2026-79786](https://nvd.nist.gov/vuln/detail/CVE-2026-79786)
- [VulnCheck Coroot DCR redirect advisory](https://www.vulncheck.com/advisories/coroot-1.20.2-through-1.24.5-unvalidated-redirect-uri-in-mcp-oauth-client-registration)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MCP client OAuth redirect URI handling](mcp-client-oauth-redirect-uri-handling.md)
- [MCP SDK OAuth issuer binding](mcp-sdk-oauth-issuer-binding.md)

## Open Questions

- Which Coroot release after 1.24.5 first restricts OAuth dynamic client registration redirect URIs?

## Maintenance Notes

- Created on 2026-08-26 from the [August 25 late topic collector](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) as an MCP OAuth DCR redirect-hijack leaf.
