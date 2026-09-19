---
type: "Topic"
title: "CordysCRM Record Read Authorization Bypass"
description: "Security analysis for CVE-2026-76901 unscoped CordysCRM lead and account record reads."
tags: ["identity-and-access", "data-and-privacy"]
---

# CordysCRM Record Read Authorization Bypass

## Current Understanding

The [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) records [CVE-2026-76901](https://cveawg.mitre.org/api/cve/CVE-2026-76901) as unscoped CordysCRM lead and account record reads. This page owns the CRM object-scope authorization boundary.

The collector reports that same-day NVD output described unscoped lead/account record reads across CordysCRM organizations. The direct CVE Services record confirms in-window publication; the exact controller and fixed release need patch-level reconciliation.

## Security Impact

- Threat: authenticated or reachable record-read paths can expose lead or account records outside the caller's organization or object scope.
- Affected boundary: CordysCRM record-read APIs for lead and account data; affected version needs upstream patch reconciliation.
- Exploit or incident status: public CVE publication; no local exploitation incident is recorded.
- Mitigation state: upgrade to the fixed CordysCRM release, enforce organization and object ownership checks on every record read, and audit historical access logs for cross-tenant reads.
- Confidence: medium-high for CVE publication and security class; medium for fixed-version detail until upstream patch evidence is mapped.
- Residual risk: CRM records are high-value business data, and AI-enabled workflows can amplify exposed context into downstream summaries or agent actions.

## Authoritative Sources

- [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json)
- [CVE-2026-76901 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-76901)
- [CordysCRM 1.7.4 release](https://github.com/1Panel-dev/CordysCRM/releases/tag/v1.7.4)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [CordysCRM AI CRM authorization cluster](cordyscrm-ai-crm-authorization-cluster.md)
- [data and privacy](../data-and-privacy/index.md)

## Open Questions

- Which CordysCRM patch maps CVE-2026-76901 to the affected read route and fixed release?

## Maintenance Notes

- Created on 2026-09-19 from the [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) after verifier correction split the CordysCRM authorization cluster.
