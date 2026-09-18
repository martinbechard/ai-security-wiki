---
type: "Topic"
title: "RMCP Custom Header Redirect Leakage"
description: "Security analysis for CVE-2026-64684 cross-origin redirect leakage of RMCP custom headers."
tags: ["infrastructure-and-supply-chain", "identity-and-access", "data-and-privacy"]
---

# RMCP Custom Header Redirect Leakage

## Current Understanding

The [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) records CVE-2026-64684 for RMCP before 2.1.0. Broad RMCP and reqwest context belongs upstream; this page owns the local custom-header credential forwarding boundary.

The CVE says `StreamableHttpClientTransport` used reqwest automatic redirects and applied custom HTTP headers without marking them sensitive. A malicious or compromised MCP endpoint could return a cross-origin 307 or 308 redirect and receive custom API keys or authentication tokens.

## Security Impact

- Threat: delegated tool credentials in custom headers can be replayed to an attacker-controlled origin through automatic redirects.
- Affected boundary: RMCP before 2.1.0, `StreamableHttpClientTransport`, custom headers, reqwest redirects, 307/308 cross-origin redirects, API keys, and authentication tokens.
- Exploit or incident status: public CVE record; no local exploitation incident is recorded.
- Mitigation state: update to 2.1.0 or later, mark sensitive headers, disable or constrain cross-origin redirects, and bind credentials to expected MCP origins.
- Confidence: high for CVE publication and affected boundary.
- Residual risk: MCP clients often treat custom headers as opaque configuration, so redirect policy needs explicit credential-leakage tests.

## Authoritative Sources

- [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json)
- [CVE-2026-64684 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-64684)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [MCP SDK transport header handling](mcp-sdk-transport-header-handling.md)
- [MCP SDK OAuth issuer binding](../identity-and-access/mcp-sdk-oauth-issuer-binding.md)

## Open Questions

- Which MCP clients attach bearer tokens or provider keys through custom headers while allowing automatic cross-origin redirects?

## Maintenance Notes

- Created on 2026-09-18 from the [September 17 topic collector](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) after verifier correction split RMCP transport issues into focused leaves.
