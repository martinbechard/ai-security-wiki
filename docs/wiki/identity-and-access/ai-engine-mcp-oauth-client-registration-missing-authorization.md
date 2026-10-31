---
type: "Topic"
title: "AI Engine MCP OAuth Client Registration Missing Authorization"
description: "Security analysis for CVE-2026-110732 delegated administrator-token issuance."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# AI Engine MCP OAuth Client Registration Missing Authorization

## Current Understanding

The [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json) records [CVE-2026-110732](https://nvd.nist.gov/vuln/detail/CVE-2026-110732): AI Engine for WordPress through 3.8.6 exposes an unauthorized MCP OAuth dynamic-client-registration endpoint. An attacker can supply a redirect URI that receives an administrator-approved token; the consent page is also frameable.

## Security Impact

- Threat: attacker-controlled clients can obtain delegated administrative MCP authority.
- Affected boundary: AI Engine through 3.8.6, OAuth 2.1 dynamic registration, redirect URI validation, and administrator consent.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: vendor patch status is not established by this collector; disable or restrict dynamic registration, enforce redirect allowlists, and rotate exposed tokens.
- Confidence and residual risk: high for the disclosed boundary; clickjacking can turn administrator consent into credential issuance.

## Authoritative Sources

- [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json)
- [NVD CVE-2026-110732](https://nvd.nist.gov/vuln/detail/CVE-2026-110732)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)

## Open Questions

- Which vendor release fixes dynamic registration and consent-page framing together?

## Maintenance Notes

- Created on 2026-10-30 as a delegated-administration boundary distinct from object authorization issues.
