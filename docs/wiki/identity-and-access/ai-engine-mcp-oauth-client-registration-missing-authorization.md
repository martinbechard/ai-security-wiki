---
type: "Topic"
title: "AI Engine MCP OAuth Client Registration Missing Authorization"
description: "Security analysis for CVE-2026-110732 delegated administrator-token issuance."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# AI Engine MCP OAuth Client Registration Missing Authorization

## Current Understanding

The [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json) and [October 31 collector](../../../raw/processed/2026-10-31/ai-security-wiki-topic-news-collector-2026-10-31T232757Z.json) record [CVE-2026-110732](https://nvd.nist.gov/vuln/detail/CVE-2026-110732): AI Engine for WordPress through 3.8.6 exposes an unauthorized MCP OAuth dynamic-client-registration endpoint. An attacker can supply a redirect URI that receives an administrator-approved token; the consent page is also frameable.

## Security Impact

- Threat: attacker-controlled clients can obtain delegated administrative MCP authority.
- Affected boundary: AI Engine through 3.8.6, OAuth 2.1 dynamic registration, redirect URI validation, and administrator consent.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: the October 31 source links the 3.8.6-to-3.8.7 plugin change, but does not establish that 3.8.7 remediates every registration and framing boundary; disable or restrict dynamic registration, enforce redirect allowlists, and rotate exposed tokens until that release scope is confirmed.
- Confidence and residual risk: high for the disclosed boundary; clickjacking can turn administrator consent into credential issuance.

## Authoritative Sources

- [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json)
- [October 31 collector](../../../raw/processed/2026-10-31/ai-security-wiki-topic-news-collector-2026-10-31T232757Z.json)
- [NVD CVE-2026-110732](https://nvd.nist.gov/vuln/detail/CVE-2026-110732)
- [GitHub advisory GHSA-22w7-p44p-2gq7](https://github.com/advisories/GHSA-22w7-p44p-2gq7)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)

## Open Questions

- Does AI Engine 3.8.7 fix both dynamic registration and consent-page framing, or only a subset of the reported boundary?

## Maintenance Notes

- Created on 2026-10-30 as a delegated-administration boundary distinct from object authorization issues.
- Updated on 2026-10-31 with linked GitHub advisory and plugin-change provenance; fixed-version coverage remains an open question.
