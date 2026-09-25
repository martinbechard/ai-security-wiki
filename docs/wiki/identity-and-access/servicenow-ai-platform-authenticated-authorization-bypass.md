---
type: "Topic"
title: "ServiceNow AI Platform Authenticated Authorization Bypass"
description: "Security analysis for CVE-2026-86857, where an authenticated user could access unauthorized ServiceNow AI Platform data."
tags: ["identity-and-access", "data-and-privacy"]
---

# ServiceNow AI Platform Authenticated Authorization Bypass

## Current Understanding

The [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) records [CVE-2026-86857](https://cveawg.mitre.org/api/cve/CVE-2026-86857) as an authenticated authorization bypass in the ServiceNow AI Platform. Broad ServiceNow platform context belongs upstream; this page owns the local authenticated data-access boundary.

ServiceNow records that an authenticated user could access AI Platform data they were not entitled to access, potentially enabling further unintended access.

## Security Impact

- Threat: authenticated users can cross intended ServiceNow AI Platform data-authorization boundaries.
- Affected boundary: ServiceNow AI Platform below the September 2026 Yokohama and Zurich hot-fix thresholds listed in the CVE records.
- Exploit or incident status: ServiceNow reports hosted updates and no known malicious exploitation in the checked public source.
- Mitigation state: apply ServiceNow advisory KB3159623 updates and review access logs for unexpected authenticated data access.
- Confidence: high for advisory existence and authenticated authorization class; medium for exact object classes exposed.
- Residual risk: authenticated AI platform users still need final authorization on every data read.

## Authoritative Sources

- [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json)
- [CVE-2026-86857 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-86857)
- [NVD CVE-2026-86857](https://nvd.nist.gov/vuln/detail/CVE-2026-86857)
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

- Which ServiceNow AI Platform data objects were reachable through CVE-2026-86857?

## Maintenance Notes

- Created on 2026-09-25 from the [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) after splitting the September ServiceNow cluster by CVE.
