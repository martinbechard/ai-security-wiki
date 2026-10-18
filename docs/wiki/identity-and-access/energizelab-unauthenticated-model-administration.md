---
type: "Topic"
title: "EnergizeLab Unauthenticated Model Administration"
description: "Security analysis for CVE-2026-105038 unauthenticated administration of AI model configuration."
tags: ["identity-and-access"]
---

# EnergizeLab Unauthenticated Model Administration

## Current Understanding

The [October 17 topic collector source](../../../raw/processed/2026-10-17/ai-security-wiki-topic-news-collector-2026-10-17T193139-0400.json) groups [CVE-2026-105038](https://nvd.nist.gov/vuln/detail/CVE-2026-105038) with related EnergizeLab AI Station disclosures. It reports unauthenticated model administration in affected Eilik/EilikO AI services, firmware, or station-middleware images 1.6.5 through 1.8.2. This page owns model-control authorization.

## Security Impact

- Affected boundary: model-administration API authorization in versions 1.6.5 through 1.8.2.
- Exploit or incident status: public CVE; no exploitation is reported by the source.
- Mitigation state: require authenticated, role-scoped model administration; a fixed release is not established by the source.
- Confidence: high for the disclosed control failure; residual risk includes attacker-controlled model behavior or provider configuration.

## Authoritative Sources

- [October 17 topic collector source](../../../raw/processed/2026-10-17/ai-security-wiki-topic-news-collector-2026-10-17T193139-0400.json)
- [CVE-2026-105038](https://nvd.nist.gov/vuln/detail/CVE-2026-105038)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)

## Open Questions

- Which endpoint and release establish administrator authentication?

## Maintenance Notes

- Created on 2026-10-17 as a model-control authorization advisory.
