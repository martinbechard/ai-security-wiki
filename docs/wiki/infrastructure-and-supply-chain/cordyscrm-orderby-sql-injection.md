---
type: "Topic"
title: "CordysCRM ORDER BY SQL Injection"
description: "Security analysis for CVE-2026-52745 dynamic SQL ORDER BY injection in CordysCRM account-pool pages."
tags: ["infrastructure-and-supply-chain", "data-and-privacy"]
---

# CordysCRM ORDER BY SQL Injection

## Current Understanding

The [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) records [CVE-2026-52745](https://cveawg.mitre.org/api/cve/CVE-2026-52745) for dynamic SQL `ORDER BY` injection in CordysCRM account-pool pages. This page owns the local CRM query-construction boundary.

The direct CVE Services record confirms in-window publication. The [September 19 leaf update watch source](../../../raw/processed/2026-09-19/ai-security-wiki-leaf-update-watch-20260920T000251Z.json) adds patch-level references for CVE-2026-52745: the [CordysCRM GHSA](https://github.com/1Panel-dev/CordysCRM/security/advisories/GHSA-xrcr-hj37-q83j), [pull request 2418](https://github.com/1Panel-dev/CordysCRM/pull/2418), [commit `b5b9272c016550d80a789fd8ffbf3d5a4c4bab52`](https://github.com/1Panel-dev/CordysCRM/commit/b5b9272c016550d80a789fd8ffbf3d5a4c4bab52), and [release v1.7.0](https://github.com/1Panel-dev/CordysCRM/releases/tag/v1.7.0). Treat v1.7.0 as the concrete ORDER BY SQL-injection remediation boundary unless later CordysCRM evidence splits the account-pool fix further.

## Security Impact

- Threat: caller-controlled sorting can alter SQL execution in account-pool pages.
- Affected boundary: CordysCRM account-pool query construction before the v1.7.0 patch evidence.
- Exploit or incident status: public CVE publication; no local exploitation incident is recorded.
- Mitigation state: upgrade to CordysCRM v1.7.0 or later, map sort keys to a fixed allowlist, and avoid interpolating raw sort expressions into SQL.
- Confidence: high for CVE publication, vulnerability class, and patch provenance; medium for exact route-level detail until the code path is mapped locally.
- Residual risk: reporting and account-pool tables often expose flexible sort controls that bypass ordinary parameterization if not explicitly constrained.

## Authoritative Sources

- [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json)
- [September 19 leaf update watch source](../../../raw/processed/2026-09-19/ai-security-wiki-leaf-update-watch-20260920T000251Z.json)
- [CVE-2026-52745 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-52745)
- [CordysCRM 1.7.4 release](https://github.com/1Panel-dev/CordysCRM/releases/tag/v1.7.4)
- [CordysCRM advisory GHSA-xrcr-hj37-q83j](https://github.com/1Panel-dev/CordysCRM/security/advisories/GHSA-xrcr-hj37-q83j)
- [CordysCRM pull request 2418](https://github.com/1Panel-dev/CordysCRM/pull/2418)
- [CordysCRM patch commit b5b9272c016550d80a789fd8ffbf3d5a4c4bab52](https://github.com/1Panel-dev/CordysCRM/commit/b5b9272c016550d80a789fd8ffbf3d5a4c4bab52)
- [CordysCRM 1.7.0 release](https://github.com/1Panel-dev/CordysCRM/releases/tag/v1.7.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [CordysCRM AI CRM injection and SSRF](cordyscrm-ai-crm-injection-and-ssrf.md)

## Open Questions

- Does the v1.7.0 patch completely cover every account-pool sorting route reachable from CVE-2026-52745?

## Maintenance Notes

- Created on 2026-09-19 from the [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) after verifier correction split the CordysCRM injection cluster.
- Updated on 2026-09-20 from the [September 19 leaf update watch source](../../../raw/processed/2026-09-19/ai-security-wiki-leaf-update-watch-20260920T000251Z.json) with GHSA, PR, commit, and v1.7.0 patch provenance.
