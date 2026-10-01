---
type: "Topic"
title: "Dify Plaintext API Key Exposure"
description: "Security analysis for CVE-2025-67732 plaintext provider API key exposure to non-admin frontend users."
tags: ["data-and-privacy", "identity-and-access"]
---

# Dify Plaintext API Key Exposure

## Current Understanding

The [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json) records [CVE-2025-67732](https://nvd.nist.gov/vuln/detail/CVE-2025-67732) and [GHSA-phpv-94hg-fv9g](https://github.com/langgenius/dify/security/advisories/GHSA-phpv-94hg-fv9g) for Dify before 1.11.0. Broad Dify product context belongs upstream; this page owns the local provider-key exposure and delegated-cost boundary.

The advisory says API keys are exposed in plaintext to the frontend, allowing non-administrator users to view and reuse keys for unauthorized third-party service access and quota consumption. Version 1.11.0 is recorded as the fix.

## Security Impact

- Threat: low-privileged frontend users can recover provider API keys and use them outside the intended application controls.
- Affected boundary: Dify before 1.11.0, frontend API-key rendering, provider credentials, third-party service access, and quota consumption.
- Exploit or incident status: public NVD and GitHub advisory records; no local exploitation incident is recorded.
- Mitigation state: upgrade Dify to 1.11.0 or later, rotate exposed provider keys, and audit quota usage after exposure windows.
- Confidence: high for the security fact and fixed version from NVD and GitHub advisory evidence; the in-window signal is an NVD update rather than first disclosure.
- Residual risk: LLM application platforms need secret redaction and per-user credential delegation because provider keys often carry both data-access and spend authority.

## Authoritative Sources

- [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json)
- [NVD CVE-2025-67732](https://nvd.nist.gov/vuln/detail/CVE-2025-67732)
- [GitHub advisory GHSA-phpv-94hg-fv9g](https://github.com/langgenius/dify/security/advisories/GHSA-phpv-94hg-fv9g)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [identity and access](../identity-and-access/index.md)
- [AI provider override trust boundaries](ai-provider-override-trust-boundaries.md)
- Upstream AI wiki owns broad Dify product context.

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-10-01 from the [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json).
