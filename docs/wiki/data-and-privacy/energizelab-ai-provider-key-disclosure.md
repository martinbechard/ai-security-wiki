---
type: "Topic"
title: "EnergizeLab AI Provider Key Disclosure"
description: "Security analysis for CVE-2026-105039 low-privilege access to AI provider keys and configuration."
tags: ["data-and-privacy", "identity-and-access"]
---

# EnergizeLab AI Provider Key Disclosure

## Current Understanding

The [October 17 topic collector source](../../../raw/processed/2026-10-17/ai-security-wiki-topic-news-collector-2026-10-17T193139-0400.json) groups [CVE-2026-105039](https://nvd.nist.gov/vuln/detail/CVE-2026-105039) with related EnergizeLab AI Station disclosures. It reports low-privilege access to AI provider keys and configuration in affected Eilik/EilikO AI services, firmware, or station-middleware images 1.6.5 through 1.8.2. This page owns provider-secret confidentiality.

## Security Impact

- Affected boundary: low-privilege access to provider credentials and configuration in versions 1.6.5 through 1.8.2.
- Exploit or incident status: public CVE; no exploitation is reported by the source.
- Mitigation state: redact secrets, enforce administrator-only access, and rotate exposed keys; a fixed release is not established by the source.
- Confidence: high for the disclosure category; residual risk includes provider-account abuse and data access through leaked keys.

## Authoritative Sources

- [October 17 topic collector source](../../../raw/processed/2026-10-17/ai-security-wiki-topic-news-collector-2026-10-17T193139-0400.json)
- [CVE-2026-105039](https://nvd.nist.gov/vuln/detail/CVE-2026-105039)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)

## Open Questions

- Are provider secrets stored per device, per tenant, or in shared station configuration?

## Maintenance Notes

- Created on 2026-10-17 as a separate provider-secret boundary.
