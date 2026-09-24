---
type: "Topic"
title: "9Router Login Lockout Bypass"
description: "Security analysis for CVE-2026-56682, where spoofable client IP headers bypass 9Router login throttling."
tags: ["identity-and-access"]
---

# 9Router Login Lockout Bypass

## Current Understanding

The [September 23 topic collector source](../../../raw/processed/2026-09-23/ai-security-wiki-topic-news-collector-2026-09-23T233151Z.json) records [CVE-2026-56682](https://cveawg.mitre.org/api/cve/CVE-2026-56682) / [GHSA-32gc-64m7-hj7v](https://github.com/decolua/9router/security/advisories/GHSA-32gc-64m7-hj7v) for 9Router before 0.5.6. Broad 9Router product context belongs upstream; this page owns the local administrative login throttling boundary.

The issue is separate from the older [9Router public LLM API auth bypass](9router-public-llm-api-auth-bypass.md). When requests reach Next.js without the sanitizing custom server wrapper, the login limiter uses the caller-controlled `X-9r-Real-Ip` header as the bucket key. An unauthenticated remote caller can rotate that header on `POST /api/auth/login` to avoid the five-attempt progressive lockout and continue dashboard password guessing.

## Security Impact

- Threat: remote unauthenticated dashboard password guessing despite the intended progressive lockout.
- Affected boundary: decolua/9router before 0.5.6, dashboard login limiter, `POST /api/auth/login`, and deployments that trust unsanitized `X-9r-Real-Ip`.
- Exploit or incident status: public CVE, NVD, GitHub advisory, and fixed release evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: upgrade to 0.5.6 or later, keep the sanitizing custom server wrapper in front of exposed routes, and strip or overwrite caller-supplied client-IP headers at the edge.
- Confidence: high for advisory existence, affected version range, and spoofed-header mechanism; medium for deployment prevalence.
- Residual risk: AI router dashboards protect provider credentials and routing policy, so login throttling must not depend on mutable request headers.

## Authoritative Sources

- [September 23 topic collector source](../../../raw/processed/2026-09-23/ai-security-wiki-topic-news-collector-2026-09-23T233151Z.json)
- [CVE-2026-56682 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-56682)
- [NVD CVE-2026-56682](https://nvd.nist.gov/vuln/detail/CVE-2026-56682)
- [GitHub Security Advisory GHSA-32gc-64m7-hj7v](https://github.com/decolua/9router/security/advisories/GHSA-32gc-64m7-hj7v)
- [9Router v0.5.6 release](https://github.com/decolua/9router/releases/tag/v0.5.6)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [9Router public LLM API auth bypass](9router-public-llm-api-auth-bypass.md)
- [9Router OIDC test SSRF](9router-oidc-test-ssrf.md)

## Open Questions

- Which 9Router deployment modes expose Next.js directly enough for caller-supplied client-IP headers to control login limiter buckets?

## Maintenance Notes

- Created on 2026-09-24 from the [September 23 topic collector source](../../../raw/processed/2026-09-23/ai-security-wiki-topic-news-collector-2026-09-23T233151Z.json) as a distinct login-throttling leaf from public model API authorization and OIDC SSRF issues.
