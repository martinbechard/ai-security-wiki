---
type: "Topic"
title: "ServiceNow AI Platform Unauthenticated Data Modification"
description: "Security analysis for CVE-2026-86858, where unauthenticated users could create, modify, or delete ServiceNow AI Platform instance data."
tags: ["identity-and-access", "data-and-privacy"]
---

# ServiceNow AI Platform Unauthenticated Data Modification

## Current Understanding

The [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) records [CVE-2026-86858](https://cveawg.mitre.org/api/cve/CVE-2026-86858) as an improper access-control issue in the ServiceNow AI Platform. Broad ServiceNow platform context belongs upstream; this page owns the local unauthenticated data-changing authorization boundary.

ServiceNow records that an unauthenticated user, in certain circumstances, could create, modify, or delete instance data beyond what was intended.

The [September 26 leaf update watch source](../../../raw/processed/2026-09-26/ai-security-wiki-leaf-update-watch-20260927T000401Z.json) adds CIS advisory 2026-102 as secondary patch-threshold evidence for Yokohama before Patch 13 Hot Fix 5a, Zurich before Patch 10 Hot Fix 4a W32, and Australia before Patch 2 Hot Fix 4b W32. Treat CIS as corroborating mitigation metadata until ServiceNow's primary KB is fully accessible.

## Security Impact

- Threat: unauthenticated callers can change ServiceNow AI Platform instance data.
- Affected boundary: ServiceNow AI Platform below the September 2026 hot-fix thresholds listed in the CVE and CIS records: Yokohama before Patch 13 Hot Fix 5a, Zurich before Patch 10 Hot Fix 4a W32, and Australia before Patch 2 Hot Fix 4b W32.
- Exploit or incident status: ServiceNow reports hosted updates and no known malicious exploitation in the checked public source.
- Mitigation state: apply ServiceNow advisory KB3159623 updates and review unauthenticated AI Platform data-changing endpoints.
- Confidence: high for advisory existence and data-modification class; medium for exact endpoint and object inventory.
- Residual risk: AI workflow platforms need final authorization on every create, update, and delete route reachable before login.

## Authoritative Sources

- [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json)
- [CVE-2026-86858 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-86858)
- [NVD CVE-2026-86858](https://nvd.nist.gov/vuln/detail/CVE-2026-86858)
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
- [ServiceNow AI platform access-control escalation](../infrastructure-and-supply-chain/servicenow-ai-platform-access-control-escalation.md)

## Open Questions

- Which ServiceNow AI Platform routes allowed unauthenticated create, modify, or delete operations for CVE-2026-86858?

## Maintenance Notes

- Created on 2026-09-25 from the [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) after splitting the September ServiceNow cluster by CVE.
- Updated on 2026-09-27 from the [September 26 leaf update watch source](../../../raw/processed/2026-09-26/ai-security-wiki-leaf-update-watch-20260927T000401Z.json) with CIS patch-threshold metadata.
