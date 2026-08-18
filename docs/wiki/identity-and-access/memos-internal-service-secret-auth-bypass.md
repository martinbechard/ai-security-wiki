---
type: "Topic"
title: "MemOS Internal Service Secret Auth Bypass"
description: "Security analysis for CVE-2026-75110 fail-open internal service secret authentication in MemOS."
tags: ["identity-and-access", "data-and-privacy", "agent-and-tool-security"]
---

# MemOS Internal Service Secret Auth Bypass

## Current Understanding

The [August 17 topic news collector source](../../../raw/processed/2026-08-17/ai-security-wiki-topic-news-collector-2026-08-17T233246Z.json) records CVE-2026-75110 / GHSA-v9vw-ccqp-q298 for MemOS. Broad MemOS product background belongs upstream if durable ecosystem coverage exists; this local page owns the fail-open service identity, administrative API-key, and agent-memory data exposure lens.

When `AUTH_ENABLED=true` but `INTERNAL_SERVICE_SECRET` is unset, the internal-request check compares missing values and treats a request without `X-Internal-Service` as trusted internal traffic. The advisory says an unauthenticated remote attacker can mint API keys for any user, enumerate and revoke keys, generate a master key, and reach all data endpoints. The GitHub record gives CVSS 9.8 critical.

The security lesson is that internal-service secrets are deployment gates, not optional hardening. Missing internal identity material must fail closed before an AI memory service can expose user, tenant, or agent state.

## Security Impact

- Threat: a missing internal-service secret can grant unauthenticated administrative control over an AI memory API.
- Affected boundary: MemOS deployments with authentication enabled and `INTERNAL_SERVICE_SECRET` unset; user API keys, master keys, and memory data endpoints.
- Exploit or incident status: public advisory; no exploitation evidence is recorded in the collector.
- Mitigation state: require non-empty internal service secrets at startup, fail closed on missing headers, rotate potentially exposed API keys, and audit admin-key creation.
- Confidence: high for mechanism and CVSS from GitHub and NVD; lower for remediation state because the fetched advisory did not list a patched version.
- Residual risk: teams need deployment evidence that internal-service secrets are present, rotated, and not reusable across tenants or environments.

## Authoritative Sources

- [August 17 topic news collector source](../../../raw/processed/2026-08-17/ai-security-wiki-topic-news-collector-2026-08-17T233246Z.json)
- GitHub advisory GHSA-v9vw-ccqp-q298: https://github.com/advisories/GHSA-v9vw-ccqp-q298
- NVD CVE-2026-75110: https://nvd.nist.gov/vuln/detail/CVE-2026-75110
- VulnCheck advisory: https://www.vulncheck.com/advisories/memos-authentication-bypass-via-unset-internal-service-secret

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [Production agent identity and access controls](production-agent-identity-and-access-controls.md)
- [AI development context exclusion controls](../data-and-privacy/ai-development-context-exclusion-controls.md)
- Upstream AI wiki owns broad MemOS product context if a durable MemOS entity page is created there.

## Open Questions

- Which MemOS version or configuration change fixes the fail-open internal-service-secret behavior?

## Maintenance Notes

- Created on 2026-08-17 from the August 17 topic collector as an identity and agent-memory data exposure advisory leaf.
