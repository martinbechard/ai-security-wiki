---
type: "Topic"
title: "LaraDashboard AI Provider Key Settings API Exposure"
description: "Security analysis for CVE-2026-105129 settings API authorization that exposed AI provider API keys and other stored secrets."
tags: ["data-and-privacy", "identity-and-access"]
---

# LaraDashboard AI Provider Key Settings API Exposure

## Current Understanding

The [October 4 topic collector source](../../../raw/processed/2026-10-04/ai-security-wiki-topic-news-collector-2026-10-04T233152Z.json) records [CVE-2026-105129](https://cveawg.mitre.org/api/cve/CVE-2026-105129) for LaraDashboard before 1.4.8. Broad LaraDashboard product context belongs upstream only if reusable entity coverage is needed; this page owns the local settings authorization, AI-provider key exposure, and least-privilege boundary.

The CVE record says authenticated users with only `settings.view` permission could read plaintext stored secrets through `GET /api/settings` or `GET /api/settings/{option_name}`. The exposed data class includes AI provider API keys, mail credentials, passwords, and tokens. The CVE references a GitHub advisory, patch PR, commit, VulnCheck advisory, and the 1.4.8 release.

## Security Impact

- Threat: a read-only settings role can disclose model-provider credentials and other stored secrets.
- Affected boundary: LaraDashboard before 1.4.8; settings API; `settings.view` permission; AI provider API keys; mail credentials; passwords; tokens.
- Exploit or incident status: public CVE, vendor advisory, NVD, VulnCheck, patch, and release evidence; no confirmed exploitation incident is recorded locally.
- Mitigation state: upgrade to LaraDashboard 1.4.8 or later, rotate exposed AI provider keys and other stored secrets, and separate settings metadata visibility from secret-value access.
- Confidence: high because the CVE points to vendor advisory, patch, commit, release, and NVD evidence.
- Residual risk: dashboards that store AI provider credentials need redaction and secret-specific authorization even for users allowed to view ordinary configuration metadata.

## Authoritative Sources

- [October 4 topic collector source](../../../raw/processed/2026-10-04/ai-security-wiki-topic-news-collector-2026-10-04T233152Z.json)
- [CVE-2026-105129 record](https://cveawg.mitre.org/api/cve/CVE-2026-105129)
- [NVD CVE-2026-105129](https://nvd.nist.gov/vuln/detail/CVE-2026-105129)
- [GitHub advisory GHSA-xgmw-7ppx-v7hq](https://github.com/laradashboard/laradashboard/security/advisories/GHSA-xgmw-7ppx-v7hq)
- [LaraDashboard v1.4.8 release](https://github.com/laradashboard/laradashboard/releases/tag/v1.4.8)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/laradashboard-before-1.4.8-incorrect-authorization-exposes-secrets-via-settings-api)

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
- [development agent credential isolation](../identity-and-access/development-agent-credential-isolation.md)

## Open Questions

- Does LaraDashboard 1.4.8 redact all secret values from settings reads or only change route authorization?
- Which AI provider keys, if any, require provider-side revocation after exposure?

## Maintenance Notes

- Created on 2026-10-05 from the [October 4 topic collector source](../../../raw/processed/2026-10-04/ai-security-wiki-topic-news-collector-2026-10-04T233152Z.json) as an AI-provider credential exposure and settings-authorization leaf.
