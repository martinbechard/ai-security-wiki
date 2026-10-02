---
type: "Topic"
title: "MCP Python SDK OAuth Metadata Trust Flaw"
description: "Security analysis for GHSA-qx49-fqc8-xw99 OAuth metadata trust and token-exchange redirection in the MCP Python SDK."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# MCP Python SDK OAuth Metadata Trust Flaw

## Current Understanding

The [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json) records public reports on [GHSA-qx49-fqc8-xw99](https://github.com/advisories/GHSA-qx49-fqc8-xw99) for the official MCP Python SDK. Broad MCP protocol and SDK context belongs upstream; this page owns the local OAuth metadata, client-secret, authorization-code, and PKCE trust boundary.

The captured CSA and secondary reporting say malicious MCP servers could redirect OAuth token exchange and receive client secrets, authorization codes, and PKCE proof keys. CSA reports affected ranges 1.9.1 through 1.29.1 and 2.0.0 through 2.1.1, fixed in 1.30.0 and 2.2.0. The collector notes that the primary GitHub advisory did not render cleanly through the available fetch path, so affected ranges should remain attributed until primary package advisory text is reconciled.

## Security Impact

- Threat: server-supplied OAuth metadata can redirect delegated agent credentials to attacker-controlled token endpoints.
- Affected boundary: MCP Python SDK HTTP OAuth client flows; reported affected ranges 1.9.1-1.29.1 and 2.0.0-2.1.1; reported fixed versions 1.30.0 and 2.2.0.
- Exploit or incident status: public GitHub advisory identifier and public CSA reporting; no confirmed local exploitation incident is recorded.
- Mitigation state: update to the fixed SDK line, pin trusted issuer and token endpoints, and reject server-provided OAuth metadata that changes the authority boundary.
- Confidence: medium-high because multiple public reports align; medium for exact ranges until the primary GitHub advisory is fully captured.
- Residual risk: MCP OAuth clients should treat server discovery as untrusted until issuer, token endpoint, redirect URI, and PKCE handling are bound to the intended authorization server.

## Authoritative Sources

- [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json)
- [GitHub advisory GHSA-qx49-fqc8-xw99](https://github.com/advisories/GHSA-qx49-fqc8-xw99)
- [CSA research note](https://labs.cloudsecurityalliance.org/research/csa-research-note-mcp-python-sdk-oauth-flaw-20260930-csa-sty/)
- [The Hacker News report](https://thehackernews.com/2026/09/official-mcp-python-sdk-flaw-can-let.html)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MCP SDK OAuth issuer binding](mcp-sdk-oauth-issuer-binding.md)
- [MCP client OAuth redirect URI handling](mcp-client-oauth-redirect-uri-handling.md)
- [mcp-remote OAuth metadata SSRF](../agent-and-tool-security/mcp-remote-oauth-metadata-ssrf.md)

## Open Questions

- What exact affected and patched ranges does the primary GitHub Security Advisory state when it is available through a reliable fetch path?

## Maintenance Notes

- Created on 2026-10-02 from the [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json).
