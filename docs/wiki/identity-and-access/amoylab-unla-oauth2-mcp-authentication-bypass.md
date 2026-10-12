---
type: "Topic"
title: "AmoyLab Unla OAuth2 MCP Authentication Bypass"
description: "Security analysis for CVE-2026-108865 AmoyLab Unla issuing MCP OAuth2 access without resource-owner authentication."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# AmoyLab Unla OAuth2 MCP Authentication Bypass

## Current Understanding

The [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json) records [CVE-2026-108865](https://nvd.nist.gov/vuln/detail/CVE-2026-108865) for AmoyLab Unla through 0.10.0. Broad AmoyLab Unla and MCP gateway context belongs upstream if needed; this page owns resource-owner authentication for OAuth2-protected MCP prefixes.

The CVE evidence says Unla never authenticates a resource owner in its OAuth2 server. Unauthenticated attackers can register a client, request an authorization code from `/authorize`, exchange it at `/token`, and access OAuth2-protected MCP prefixes, proxied upstream APIs, and injected credentials.

## Security Impact

- Threat: unauthenticated callers can self-issue OAuth2 access to protected MCP gateway routes and upstream credentials.
- Affected boundary: AmoyLab Unla through 0.10.0, OAuth2 `/authorize`, `/token`, client registration, MCP prefix proxying, proxied upstream APIs, and injected credentials.
- Exploit or incident status: public NVD and CVE Services records; no confirmed exploitation incident is recorded locally.
- Mitigation state: authenticate resource owners before code issuance, bind clients to approved scopes and redirect origins, and rotate credentials exposed through affected MCP prefixes.
- Confidence: high for affected range and missing resource-owner authentication from CVE evidence.
- Residual risk: MCP gateway OAuth flows need user authentication and scope binding before they expose upstream APIs.

## Authoritative Sources

- [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json)
- [NVD CVE-2026-108865](https://nvd.nist.gov/vuln/detail/CVE-2026-108865)
- [CVE-2026-108865 record](https://cveawg.mitre.org/api/cve/CVE-2026-108865)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MCP TypeScript SDK OAuth credential confusion](mcp-typescript-sdk-oauth-credential-confusion.md)
- [MCP Python SDK OAuth metadata trust flaw](mcp-python-sdk-oauth-metadata-trust-flaw.md)
- [1MCP Agent OAuth Tag Scope Bypass](1mcp-agent-oauth-tag-scope-bypass.md)

## Open Questions

- Which Unla release first enforces resource-owner authentication for MCP OAuth2 access?

## Maintenance Notes

- Created on 2026-10-12 from the [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json).
