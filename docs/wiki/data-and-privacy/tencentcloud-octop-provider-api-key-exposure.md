---
type: "Topic"
title: "TencentCloud Octop Provider API Key Exposure"
description: "Security analysis for CVE-2026-108581 low-privilege reads of stored provider API keys in TencentCloud Octop."
tags: ["data-and-privacy"]
---

# TencentCloud Octop Provider API Key Exposure

## Current Understanding

The [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) records [CVE-2026-108581](https://cveawg.mitre.org/api/cve/CVE-2026-108581) for TencentCloud Octop through 1.0.2b6. Broad TencentCloud Octop product context belongs upstream; this page owns stored provider-key authorization and credential exposure.

Authenticated low-privileged users can call `GET /api/providers` and `GET /api/voice/providers` because the endpoints validate only the JWT. The responses expose stored LLM and voice provider API keys, so the issue is both missing authorization and downstream provider credential compromise.

## Security Impact

- Threat: low-privileged users can read stored LLM and voice provider API keys.
- Affected boundary: TencentCloud Octop through 1.0.2b6, provider listing APIs, JWT-only checks, LLM provider keys, and voice provider keys.
- Exploit or incident status: public CVE Services and NVD evidence; no confirmed exploitation incident is recorded locally.
- Mitigation state: patch authorization checks, restrict provider secret reads to administrator roles, redact stored keys in API responses, and rotate exposed provider credentials.
- Confidence: high for credential exposure from NVD/CVE evidence.
- Residual risk: provider configuration APIs need response-level secret redaction even when route authentication succeeds.

## Authoritative Sources

- [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json)
- [CVE-2026-108581 record](https://cveawg.mitre.org/api/cve/CVE-2026-108581)
- [NVD CVE-2026-108581](https://nvd.nist.gov/vuln/detail/CVE-2026-108581)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [AI provider override trust boundaries](ai-provider-override-trust-boundaries.md)
- [LaraDashboard AI provider key settings API exposure](laradashboard-ai-provider-key-settings-api-exposure.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-10-11 from the [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) after upstream index routing kept broad product and framework context outside the local security wiki.
