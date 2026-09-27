---
type: "Topic"
title: "ServiceNow AI Platform Yokohama Zurich SQL Injection"
description: "Security analysis for CVE-2026-13016 ServiceNow AI Platform SQL injection across Yokohama and Zurich hot-fix levels."
tags: ["infrastructure-and-supply-chain", "data-and-privacy"]
---

# ServiceNow AI Platform Yokohama Zurich SQL Injection

## Current Understanding

The [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) records [CVE-2026-13016](https://cveawg.mitre.org/api/cve/CVE-2026-13016) as a ServiceNow AI Platform SQL injection. Broad ServiceNow platform context belongs upstream; this page owns the local database execution boundary for the September Yokohama/Zurich advisory family.

ServiceNow records that an unauthenticated user, in certain circumstances, could execute arbitrary SQL statements against the instance database and access or modify unintended instance data. This issue is distinct from the older [ServiceNow AI platform SQL injection](servicenow-ai-platform-sql-injection.md) leaf because it has a different CVE and fixed hot-fix family.

The [September 26 leaf update watch source](../../../raw/processed/2026-09-26/ai-security-wiki-leaf-update-watch-20260927T000401Z.json) adds CIS advisory 2026-102 as secondary patch-threshold evidence for Yokohama before Patch 13 Hot Fix 5a, Zurich before Patch 10 Hot Fix 4a W32, and Australia before Patch 2 Hot Fix 4b W32. Treat CIS as corroborating mitigation metadata until ServiceNow's primary KB is fully accessible.

## Security Impact

- Threat: unauthenticated SQL execution can expose or modify ServiceNow AI Platform instance data.
- Affected boundary: ServiceNow AI Platform below the September 2026 hot-fix thresholds listed in the CVE and CIS records: Yokohama before Patch 13 Hot Fix 5a, Zurich before Patch 10 Hot Fix 4a W32, and Australia before Patch 2 Hot Fix 4b W32.
- Exploit or incident status: ServiceNow reports hosted updates and no known malicious exploitation in the checked public source.
- Mitigation state: apply ServiceNow advisory KB3159623 hosted, partner, or self-hosted updates.
- Confidence: high for advisory existence and SQL-injection impact; medium for exact fixed-level matrix because support-site details may require authenticated access.
- Residual risk: enterprise AI control planes need database-query release gates independent of user-interface authorization.

## Authoritative Sources

- [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json)
- [CVE-2026-13016 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-13016)
- [NVD CVE-2026-13016](https://nvd.nist.gov/vuln/detail/CVE-2026-13016)
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

- [infrastructure and supply chain](index.md)
- [ServiceNow AI platform SQL injection](servicenow-ai-platform-sql-injection.md)

## Open Questions

- Which exact hosted, partner, and self-hosted builds remediate CVE-2026-13016 beyond the CIS-listed Yokohama, Zurich, and Australia hot-fix thresholds?

## Maintenance Notes

- Created on 2026-09-25 from the [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) after splitting the September ServiceNow cluster by CVE.
- Updated on 2026-09-27 from the [September 26 leaf update watch source](../../../raw/processed/2026-09-26/ai-security-wiki-leaf-update-watch-20260927T000401Z.json) with CIS patch-threshold metadata.
