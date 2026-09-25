---
type: "Topic"
title: "ServiceNow AI Platform Missing Authorization Data Extraction"
description: "Security analysis for CVE-2026-86860, where missing authorization could allow unauthenticated ServiceNow AI Platform data extraction and privilege escalation."
tags: ["identity-and-access", "data-and-privacy"]
---

# ServiceNow AI Platform Missing Authorization Data Extraction

## Current Understanding

The [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) records [CVE-2026-86860](https://cveawg.mitre.org/api/cve/CVE-2026-86860) as a missing-authorization vulnerability in the ServiceNow AI Platform. Broad ServiceNow platform context belongs upstream; this page owns the local data-extraction and privilege-escalation authorization boundary.

ServiceNow records that an unauthenticated user, in certain circumstances, could extract instance data beyond what was intended, resulting in privilege escalation.

## Security Impact

- Threat: unauthenticated callers can extract ServiceNow AI Platform instance data and use it for privilege escalation.
- Affected boundary: ServiceNow AI Platform below the September 2026 Yokohama and Zurich hot-fix thresholds listed in the CVE records.
- Exploit or incident status: ServiceNow reports hosted updates and no known malicious exploitation in the checked public source.
- Mitigation state: apply ServiceNow advisory KB3159623 updates and review data-extraction paths for explicit authorization checks.
- Confidence: high for advisory existence and missing-authorization class; medium for exact extracted data and escalation path.
- Residual risk: AI control-plane data extraction can become privilege escalation when sensitive workflow or configuration records are exposed.

## Authoritative Sources

- [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json)
- [CVE-2026-86860 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-86860)
- [NVD CVE-2026-86860](https://nvd.nist.gov/vuln/detail/CVE-2026-86860)
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

- What privilege escalation path is enabled by data extracted through CVE-2026-86860?

## Maintenance Notes

- Created on 2026-09-25 from the [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) after splitting the September ServiceNow cluster by CVE.
