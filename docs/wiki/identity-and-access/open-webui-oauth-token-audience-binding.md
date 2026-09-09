---
type: "Topic"
title: "Open WebUI OAuth token audience binding"
description: "Security analysis for Open WebUI 0.11.0 OAuth token-exchange audience binding failure."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# Open WebUI OAuth token audience binding

## Current Understanding

The [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json) records an in-window NVD update for an Open WebUI OAuth token-exchange audience binding issue fixed in 0.11.0. Broad Open WebUI context belongs upstream; this page owns the identity boundary where assistant platform OAuth exchanges must bind tokens to the intended audience and relying party.

## Security Impact

- Threat: weak token-exchange audience checks can let an OAuth token minted for one context be accepted across an unintended assistant or service boundary.
- Affected boundary: Open WebUI versions before 0.11.0; OAuth token exchange.
- Exploit or incident status: public NVD/CVE/GitHub advisory evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade to Open WebUI 0.11.0 or later and verify issuer, audience, client, redirect, and exchange context together.
- Confidence: high for the NVD update and fixed-version signal; medium for exploit status.
- Residual risk: assistant integrations that mix user identity, connector access, and retrieval tokens need strict audience binding at every exchange hop.

## Authoritative Sources

- [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json)
- [Open WebUI v0.11.0 release](https://github.com/open-webui/open-webui/releases/tag/v0.11.0)
- [CVE-2026-70480 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-70480)

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

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-08 from the September 8 topic collector after verifier correction split the Open WebUI release wave into focused security-boundary leaves.
