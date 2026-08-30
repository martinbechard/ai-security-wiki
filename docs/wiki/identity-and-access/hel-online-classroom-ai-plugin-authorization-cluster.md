---
type: "Topic"
title: "HEL Online Classroom AI plugin authorization cluster"
description: "Security analysis for CVE-2026-77007, CVE-2026-77008, and CVE-2026-77010 in the HEL Online Classroom AI WordPress plugin."
tags: ["identity-and-access", "data-and-privacy", "infrastructure-and-supply-chain"]
---

# HEL Online Classroom AI plugin authorization cluster

## Current Understanding

The [August 29 topic collector source](../../../raw/processed/2026-08-29/ai-security-wiki-topic-news-collector-2026-08-29T233233Z.json) records [CVE-2026-77007](https://nvd.nist.gov/vuln/detail/CVE-2026-77007), [CVE-2026-77008](https://nvd.nist.gov/vuln/detail/CVE-2026-77008), and [CVE-2026-77010](https://nvd.nist.gov/vuln/detail/CVE-2026-77010) for HEL Online Classroom: AI-powered Online Classrooms WordPress plugin through 1.0.3. Broad WordPress plugin catalog context belongs upstream only if this plugin becomes a recurring product entity; this page owns the local REST authorization, shared secret, settings integrity, and moderator role issuance boundaries.

The three CVEs are kept together because they affect one closely coupled classroom-integration authorization surface:

- CVE-2026-77007 exposes stored settings and BigBlueButton signing secrets through unauthenticated REST access.
- CVE-2026-77008 allows unauthenticated settings overwrite, including classroom endpoint or integration configuration changes.
- CVE-2026-77010 allows unauthenticated users to obtain signed classroom join links, including moderator-privilege links.

## Security Impact

- Threat: unauthenticated callers can read integration secrets, alter classroom configuration, or join AI-assisted classroom sessions with elevated privileges.
- Affected boundary: HEL Online Classroom WordPress plugin through 1.0.3, WordPress REST routes, BigBlueButton signing secrets, and moderator join-link issuance.
- Exploit or incident status: public NVD and [WPScan advisory evidence](https://wpscan.com/vulnerability/24f1da87-4217-4876-a0f3-5e125f694651/); no local in-the-wild exploitation evidence is recorded.
- Mitigation state: patched-version status is not confirmed locally; operators should disable unauthenticated routes, rotate exposed BigBlueButton secrets, audit moderator joins, and update when a vendor fix is available.
- Confidence: high for NVD advisory existence and affected route class; medium for fixed-version status.
- Residual risk: AI-labeled classroom plugins can hide ordinary CMS authorization failures that become meeting takeover or student-data exposure paths once they bridge into conferencing systems.

## Authoritative Sources

- [August 29 topic collector source](../../../raw/processed/2026-08-29/ai-security-wiki-topic-news-collector-2026-08-29T233233Z.json)
- [NVD CVE-2026-77007](https://nvd.nist.gov/vuln/detail/CVE-2026-77007)
- [NVD CVE-2026-77008](https://nvd.nist.gov/vuln/detail/CVE-2026-77008)
- [NVD CVE-2026-77010](https://nvd.nist.gov/vuln/detail/CVE-2026-77010)
- [WPScan CVE-2026-77007 advisory](https://wpscan.com/vulnerability/24f1da87-4217-4876-a0f3-5e125f694651/)
- [WPScan CVE-2026-77008 advisory](https://wpscan.com/vulnerability/529663a1-87ed-4cff-92f5-85641e9718b3/)
- [WPScan CVE-2026-77010 advisory](https://wpscan.com/vulnerability/c50e6d2c-fe67-44d4-af10-a261d0afc6d7/)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [data and privacy](../data-and-privacy/index.md)
- [WordPress AI Engine plugin file read and query execution](../infrastructure-and-supply-chain/wordpress-ai-engine-plugin-file-read-and-query-execution.md)
- [WordPress AI plugin advisory deferrals](../infrastructure-and-supply-chain/wordpress-ai-plugin-advisory-deferrals.md)

## Open Questions

- Which HEL Online Classroom release first authenticates all classroom REST routes and rotates or invalidates exposed BigBlueButton signing material?

## Maintenance Notes

- Created on 2026-08-30 from the [August 29 topic collector](../../../raw/processed/2026-08-29/ai-security-wiki-topic-news-collector-2026-08-29T233233Z.json). CVE-2026-77010 was not split into a separate leaf because the moderator join issue is part of the same route-authentication and signing cluster.
