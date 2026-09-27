---
type: "Topic"
title: "ServiceNow AI Platform Unauthenticated Data Access"
description: "Security analysis for CVE-2026-86859, where unauthenticated users could access unauthorized ServiceNow AI Platform data."
tags: ["identity-and-access", "data-and-privacy"]
---

# ServiceNow AI Platform Unauthenticated Data Access

## Current Understanding

The [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) records [CVE-2026-86859](https://cveawg.mitre.org/api/cve/CVE-2026-86859) as an unauthenticated authorization bypass in the ServiceNow AI Platform. Broad ServiceNow platform context belongs upstream; this page owns the local unauthenticated data-read authorization boundary.

ServiceNow records that an unauthenticated user could access AI Platform data they were not entitled to access, potentially enabling further unintended access.

The [September 26 leaf update watch source](../../../raw/processed/2026-09-26/ai-security-wiki-leaf-update-watch-20260927T000401Z.json) adds CIS advisory 2026-102 as secondary patch-threshold evidence for Yokohama before Patch 13 Hot Fix 5a, Zurich before Patch 10 Hot Fix 4a W32, and Australia before Patch 2 Hot Fix 4b W32. Treat CIS as corroborating mitigation metadata until ServiceNow's primary KB is fully accessible.

## Security Impact

- Threat: unauthenticated callers can read ServiceNow AI Platform data outside intended authorization.
- Affected boundary: ServiceNow AI Platform below the September 2026 hot-fix thresholds listed in the CVE and CIS records: Yokohama before Patch 13 Hot Fix 5a, Zurich before Patch 10 Hot Fix 4a W32, and Australia before Patch 2 Hot Fix 4b W32.
- Exploit or incident status: ServiceNow reports hosted updates and no known malicious exploitation in the checked public source.
- Mitigation state: apply ServiceNow advisory KB3159623 updates and review anonymous data-access routes.
- Confidence: high for advisory existence and unauthenticated data-access class; medium for exact object classes exposed.
- Residual risk: AI Platform read APIs need authorization checks even when they appear to support public or pre-auth workflows.

## Authoritative Sources

- [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json)
- [CVE-2026-86859 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-86859)
- [NVD CVE-2026-86859](https://nvd.nist.gov/vuln/detail/CVE-2026-86859)
- [ServiceNow support advisory KB3159623](https://support.servicenow.com/kb?id=kb_article_view&sysparm_article=KB3159623)
- [September 26 leaf update watch source](../../../raw/processed/2026-09-26/ai-security-wiki-leaf-update-watch-20260927T000401Z.json)
- [CIS advisory 2026-102](https://www.cisecurity.org/advisory/multiple-vulnerabilities-in-servicenows-ai-platform-could-allow-for-unauthorized-access_2026-102)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [data and privacy](../data-and-privacy/index.md)

## Open Questions

- Which ServiceNow AI Platform data objects could unauthenticated callers access through CVE-2026-86859?

## Maintenance Notes

- Created on 2026-09-25 from the [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) after splitting the September ServiceNow cluster by CVE.
- Updated on 2026-09-27 from the [September 26 leaf update watch source](../../../raw/processed/2026-09-26/ai-security-wiki-leaf-update-watch-20260927T000401Z.json) with CIS patch-threshold metadata.
