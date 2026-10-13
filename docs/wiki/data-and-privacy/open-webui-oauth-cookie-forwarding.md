---
type: "Topic"
title: "Open WebUI OAuth Cookie Forwarding"
description: "Security analysis for CVE-2026-109292, where OAuth-mode Open WebUI connections can forward browser cookies to destination servers."
tags: ["data-and-privacy", "identity-and-access"]
---

# Open WebUI OAuth Cookie Forwarding

## Current Understanding

The [October 12 topic collector source](../../../raw/processed/2026-10-12/ai-security-wiki-topic-news-collector-2026-10-12T233447Z.json) records [CVE-2026-109292](https://nvd.nist.gov/vuln/detail/CVE-2026-109292) for Open WebUI 0.6.27 before 0.11.4. Broad Open WebUI product context belongs upstream; this page owns the local session-data boundary for OAuth-mode model, OpenAPI tool, and terminal connections.

The CVE evidence says OAuth-mode OpenAI-compatible, OpenAPI tool, or terminal connections can forward the full browser cookie jar to destination servers. A destination that captures those cookies can turn assistant connectivity into session hijack risk.

## Security Impact

- Threat: session cookies can be disclosed to model, tool, or terminal destination servers.
- Affected boundary: Open WebUI 0.6.27 before 0.11.4, OAuth-mode OpenAI-compatible connections, OpenAPI tool servers, terminal connections, and browser cookie forwarding.
- Exploit or incident status: public CVE, GitHub advisory, and AI Sec Watch evidence; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to 0.11.4 or later and prevent user-session cookies from crossing provider or tool-origin boundaries.
- Confidence: high for affected range and cookie-forwarding behavior from NVD-backed source evidence.
- Residual risk: AI web UIs that bridge browser sessions into arbitrary tool or provider endpoints need explicit header and cookie allowlists.

## Control Implications

- Strip browser cookies from outbound provider and tool requests unless a destination-specific credential flow explicitly requires them.
- Separate user-session credentials from model-provider, tool-server, and terminal transport credentials.
- Audit OAuth-mode connectors for header copying, redirect behavior, and destination-controlled logging.

## Authoritative Sources

- [October 12 topic collector source](../../../raw/processed/2026-10-12/ai-security-wiki-topic-news-collector-2026-10-12T233447Z.json)
- [NVD CVE-2026-109292](https://nvd.nist.gov/vuln/detail/CVE-2026-109292)
- [GitHub advisory GHSA-gqfh-jxvw-74rp](https://github.com/open-webui/open-webui/security/advisories/GHSA-gqfh-jxvw-74rp)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [Open WebUI OAuth token audience binding](../identity-and-access/open-webui-oauth-token-audience-binding.md)
- [Open WebUI fetch and RAG SSRF](../agent-and-tool-security/open-webui-fetch-and-rag-ssrf.md)

## Open Questions

- Which Open WebUI 0.11.4 patch test proves OAuth-mode outbound requests cannot carry browser session cookies to arbitrary destination servers?

## Maintenance Notes

- Created on 2026-10-13 from the October 12 topic collector as a session-cookie disclosure leaf distinct from earlier Open WebUI OAuth token-audience coverage.
