---
type: "Topic"
title: "9Router Public LLM API Auth Bypass"
description: "Security analysis for CVE-2026-56681 spoofed local-client header trust in 9Router public LLM API routes."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# 9Router Public LLM API Auth Bypass

## Current Understanding

The [September 22 topic collector source](../../../raw/processed/2026-09-22/ai-security-wiki-topic-news-collector-2026-09-22T233219Z.json) records [CVE-2026-56681](https://cveawg.mitre.org/api/cve/CVE-2026-56681) / [GHSA-5mj8-gf6m-fhw8](https://github.com/decolua/9router/security/advisories/GHSA-5mj8-gf6m-fhw8) for 9Router before 0.5.6. Broad AI-router product coverage belongs upstream; this page owns the local model API authorization boundary.

The issue is a deployment-sensitive header trust failure: when traffic reaches Next.js without the sanitizing `custom-server.js` wrapper, the dashboard guard can trust a caller-supplied `X-9r-Real-Ip` value and treat a remote request as local. A caller that sets `127.0.0.1` can bypass API-key validation for public LLM API routes such as `GET /api/v1/models`.

## Security Impact

- Threat: remote callers can spoof local-client identity and cross a public model API authorization boundary without an API key.
- Affected boundary: decolua/9router before 0.5.6, public LLM API routes, `src/dashboardGuard.js`, and deployments where Next.js is reachable without the sanitizing wrapper.
- Exploit or incident status: public CVE, NVD, GitHub advisory, patch commit, and release evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: upgrade to 0.5.6 or later, keep the sanitizing server wrapper in front of exposed routes, and reject client-supplied locality headers at deployment edges.
- Confidence: high for advisory existence, affected version, and spoofed-header mechanism; medium for deployment prevalence.
- Residual risk: AI router deployments need explicit edge controls for local-only assumptions because model API access and billing controls can otherwise depend on mutable request headers.

## Authoritative Sources

- [September 22 topic collector source](../../../raw/processed/2026-09-22/ai-security-wiki-topic-news-collector-2026-09-22T233219Z.json)
- [CVE-2026-56681 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-56681)
- [NVD CVE-2026-56681](https://nvd.nist.gov/vuln/detail/CVE-2026-56681)
- [GitHub Security Advisory GHSA-5mj8-gf6m-fhw8](https://github.com/decolua/9router/security/advisories/GHSA-5mj8-gf6m-fhw8)
- [9Router v0.5.6 release](https://github.com/decolua/9router/releases/tag/v0.5.6)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [9Router OIDC test SSRF](9router-oidc-test-ssrf.md)
- [agent and tool security](../agent-and-tool-security/index.md)

## Open Questions

- Which 9Router deployment modes expose Next.js directly enough for the spoofed local-client header to matter?

## Maintenance Notes

- Created on 2026-09-23 from the [September 22 topic collector source](../../../raw/processed/2026-09-22/ai-security-wiki-topic-news-collector-2026-09-22T233219Z.json) as a distinct public LLM API authorization leaf from the older OIDC SSRF issue.
