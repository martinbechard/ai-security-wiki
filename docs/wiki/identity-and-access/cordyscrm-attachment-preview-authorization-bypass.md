---
type: "Topic"
title: "CordysCRM Attachment Preview Authorization Bypass"
description: "Security analysis for CVE-2026-76902 anonymous CordysCRM attachment preview downloads across organizations."
tags: ["identity-and-access", "data-and-privacy"]
---

# CordysCRM Attachment Preview Authorization Bypass

## Current Understanding

The [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) records [CVE-2026-76902](https://cveawg.mitre.org/api/cve/CVE-2026-76902) as anonymous CordysCRM attachment preview downloads across organizations. This page owns the CRM attachment-preview authorization and data-exposure boundary.

The collector reports that same-day NVD output described anonymous attachment preview downloads across organizations. The direct CVE Services record confirms in-window publication; exact route and patch details need upstream reconciliation.

## Security Impact

- Threat: anonymous preview access can expose CRM attachments outside the caller's organization or authorization scope.
- Affected boundary: CordysCRM attachment preview/download route; affected version needs upstream patch reconciliation.
- Exploit or incident status: public CVE publication; no local exploitation incident is recorded.
- Mitigation state: upgrade to the fixed CordysCRM release, require authentication and object-scope checks before attachment preview generation, and audit accessed attachment identifiers.
- Confidence: medium-high for CVE publication and security class; medium for fixed-version detail until upstream patch evidence is mapped.
- Residual risk: attachment previews often bypass normal file-download paths, so they need explicit object-scope and tenant checks.

## Authoritative Sources

- [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json)
- [CVE-2026-76902 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-76902)
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

- Which CordysCRM patch maps CVE-2026-76902 to the affected preview route and fixed release?

## Maintenance Notes

- Created on 2026-09-19 from the [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) after verifier correction split the CordysCRM authorization cluster.
