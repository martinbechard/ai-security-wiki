---
type: "Topic"
title: "CordysCRM sort.name Database Function Injection"
description: "Security analysis for CVE-2026-76899 arbitrary database functions through CordysCRM sort.name."
tags: ["infrastructure-and-supply-chain", "data-and-privacy"]
---

# CordysCRM sort.name Database Function Injection

## Current Understanding

The [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) records [CVE-2026-76899](https://cveawg.mitre.org/api/cve/CVE-2026-76899) for arbitrary database function selection through CordysCRM `sort.name`. This page owns the local sort-key-to-database-function execution boundary.

The direct CVE Services record confirms in-window publication. The collector groups this with same-day CordysCRM query risks and references the 1.7.4 release; exact patch mechanics need upstream reconciliation.

## Security Impact

- Threat: a sort parameter can select database functions instead of constrained column keys.
- Affected boundary: CordysCRM `sort.name` handling; affected version needs upstream patch reconciliation.
- Exploit or incident status: public CVE publication; no local exploitation incident is recorded.
- Mitigation state: upgrade to the fixed CordysCRM release, map sort names to static database columns, and reject function syntax or dynamic expressions in sort keys.
- Confidence: medium-high for CVE publication and vulnerability class; medium for route-level detail until the patch is mapped.
- Residual risk: dynamic sort helpers can quietly become database execution surfaces when they accept function-like names.

## Authoritative Sources

- [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json)
- [CVE-2026-76899 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-76899)
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

- Which CordysCRM patch maps CVE-2026-76899 to the affected sort helper and fixed version?

## Maintenance Notes

- Created on 2026-09-19 from the [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) after verifier correction split the CordysCRM injection cluster.
