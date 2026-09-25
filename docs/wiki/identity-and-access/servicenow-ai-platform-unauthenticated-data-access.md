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

## Security Impact

- Threat: unauthenticated callers can read ServiceNow AI Platform data outside intended authorization.
- Affected boundary: ServiceNow AI Platform below the September 2026 Yokohama and Zurich hot-fix thresholds listed in the CVE records.
- Exploit or incident status: ServiceNow reports hosted updates and no known malicious exploitation in the checked public source.
- Mitigation state: apply ServiceNow advisory KB3159623 updates and review anonymous data-access routes.
- Confidence: high for advisory existence and unauthenticated data-access class; medium for exact object classes exposed.
- Residual risk: AI Platform read APIs need authorization checks even when they appear to support public or pre-auth workflows.

## Authoritative Sources

- [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json)
- [CVE-2026-86859 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-86859)
- [NVD CVE-2026-86859](https://nvd.nist.gov/vuln/detail/CVE-2026-86859)
- [ServiceNow support advisory KB3159623](https://support.servicenow.com/kb?id=kb_article_view&sysparm_article=KB3159623)

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
