---
type: "Topic"
title: "EnergizeLab Default Root SSH Credentials"
description: "Security analysis for CVE-2026-105033 default root SSH credentials in an AI robot deployment boundary."
tags: ["identity-and-access"]
---

# EnergizeLab Default Root SSH Credentials

## Current Understanding

The [October 17 topic collector source](../../../raw/processed/2026-10-17/ai-security-wiki-topic-news-collector-2026-10-17T193139-0400.json) groups [CVE-2026-105033](https://nvd.nist.gov/vuln/detail/CVE-2026-105033) with related EnergizeLab AI Station disclosures. It reports default root SSH credentials in affected Eilik/EilikO AI services, firmware, or station-middleware images 1.6.5 through 1.8.2. This page owns device administrator identity, rather than broad product context.

## Security Impact

- Affected boundary: root SSH access across the disclosed 1.6.5 through 1.8.2 device stack.
- Exploit or incident status: public CVE; no exploitation is reported by the source.
- Mitigation state: rotate unique credentials, disable password root login, and use managed device identity; a fixed release is not established by the source.
- Confidence: high for the credential-risk category; residual risk includes deployed images retaining known credentials.

## Authoritative Sources

- [October 17 topic collector source](../../../raw/processed/2026-10-17/ai-security-wiki-topic-news-collector-2026-10-17T193139-0400.json)
- [CVE-2026-105033](https://nvd.nist.gov/vuln/detail/CVE-2026-105033)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)

## Open Questions

- Which images and deployment defaults contain the disclosed credentials?

## Maintenance Notes

- Created on 2026-10-17 as a separate device-identity advisory.
