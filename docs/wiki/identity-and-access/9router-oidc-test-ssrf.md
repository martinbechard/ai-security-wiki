---
type: "Topic"
title: "9Router OIDC Test SSRF"
description: "Security analysis for CVE-2026-56677 SSRF in 9Router OIDC provider testing."
tags: ["identity-and-access", "agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# 9Router OIDC Test SSRF

## Current Understanding

The [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) records CVE-2026-56677 / GHSA-8g4w-4ffg-8vgx for 9Router 0.5.4 and earlier. Broad AI-router product coverage belongs upstream if needed; this page owns the local identity-provider test endpoint SSRF boundary.

The advisory says the dashboard `/api/auth/oidc/test` endpoint accepts `issuerUrl` and performs outbound OIDC discovery without restricting internal network destinations. The collector records that the endpoint can be reached without active session authentication where the dashboard API is visible.

The [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json) adds [CVE Program](https://www.cve.org/CVERecord?id=CVE-2026-56677), [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-56677), [GitHub Advisory Database](https://github.com/advisories/GHSA-8g4w-4ffg-8vgx), and [GitLab advisory](https://advisories.gitlab.com/npm/9router/CVE-2026-56677/) evidence; it preserves the source conflict where some records describe the endpoint as authenticated while the local leaf still tracks dashboard exposure questions.

## Security Impact

- Threat: identity-provider test utilities can become SSRF paths to internal services before authentication is fully established.
- Affected boundary: 9Router 0.5.4 and earlier; OIDC provider test endpoint and dashboard API exposure.
- Exploit or incident status: public GitHub advisory and NVD record.
- Mitigation state: fixed-version detail still needs direct confirmation; restrict endpoint access and deny internal/link-local discovery URLs.
- Confidence: high for vulnerability mechanics from GHSA/NVD evidence; medium for fixed-version detail.
- Residual risk: auth-configuration test endpoints need the same egress policy and authentication as production connector calls.

## Authoritative Sources

- [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json)
- [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json)
- [GitHub advisory GHSA-8g4w-4ffg-8vgx](https://github.com/advisories/GHSA-8g4w-4ffg-8vgx)
- [NVD CVE-2026-56677](https://nvd.nist.gov/vuln/detail/CVE-2026-56677)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MCP client OAuth redirect URI handling](mcp-client-oauth-redirect-uri-handling.md)
- [agent network egress controls](../agent-and-tool-security/agent-network-egress-controls.md)

## Open Questions

- Which 9Router release fixes CVE-2026-56677 and requires authentication before OIDC test discovery?
- Which 9Router source should resolve the conflict between authenticated endpoint wording and dashboard exposure assumptions?

## Maintenance Notes

- Created on 2026-08-19 from the [August 18 topic collector](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) as an identity-configuration SSRF leaf.
- Updated on 2026-08-20 from the [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json) with additional advisory evidence and preserved authentication-scope conflict.
