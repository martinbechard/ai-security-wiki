---
type: "Topic"
title: "CordysCRM ORDER BY SQL Injection"
description: "Security analysis for CVE-2026-52745 dynamic SQL ORDER BY injection in CordysCRM account-pool pages."
tags: ["infrastructure-and-supply-chain", "data-and-privacy"]
---

# CordysCRM ORDER BY SQL Injection

## Current Understanding

The [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) records [CVE-2026-52745](https://cveawg.mitre.org/api/cve/CVE-2026-52745) for dynamic SQL `ORDER BY` injection in CordysCRM account-pool pages. This page owns the local CRM query-construction boundary.

The direct CVE Services record confirms in-window publication. The collector maps the finding to CordysCRM same-day advisory evidence and the 1.7.4 release, but exact fixed-route details need patch reconciliation.

## Security Impact

- Threat: caller-controlled sorting can alter SQL execution in account-pool pages.
- Affected boundary: CordysCRM account-pool query construction; affected version needs upstream patch reconciliation.
- Exploit or incident status: public CVE publication; no local exploitation incident is recorded.
- Mitigation state: upgrade to the fixed CordysCRM release, map sort keys to a fixed allowlist, and avoid interpolating raw sort expressions into SQL.
- Confidence: medium-high for CVE publication and vulnerability class; medium for route-level detail until the patch is mapped.
- Residual risk: reporting and account-pool tables often expose flexible sort controls that bypass ordinary parameterization if not explicitly constrained.

## Authoritative Sources

- [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json)
- [CVE-2026-52745 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-52745)
- [CordysCRM 1.7.4 release](https://github.com/1Panel-dev/CordysCRM/releases/tag/v1.7.4)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [CordysCRM AI CRM injection and SSRF](cordyscrm-ai-crm-injection-and-ssrf.md)

## Open Questions

- Which CordysCRM patch maps CVE-2026-52745 to the affected account-pool route and fixed version?

## Maintenance Notes

- Created on 2026-09-19 from the [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) after verifier correction split the CordysCRM injection cluster.
