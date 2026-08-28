---
type: "Topic"
title: "WordPress AI Engine Plugin File Read And Query Execution"
description: "Security analysis for CVE-2026-75797 and CVE-2026-75798 in the AI Engine WordPress plugin."
tags: ["infrastructure-and-supply-chain", "data-and-privacy", "identity-and-access"]
---

# WordPress AI Engine Plugin File Read And Query Execution

## Current Understanding

CVE-2026-75797 and CVE-2026-75798 affect the AI Engine WordPress plugin before 3.7.2. Broad WordPress plugin catalog context belongs upstream; this page owns the local plugin boundary where website roles, filesystem reads, external AI-provider forwarding, and provider-query authorization meet. The [August 26 topic news collector source](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json) and [August 27 leaf update watch source](../../../raw/processed/2026-08-27/ai-security-wiki-leaf-update-watch-20260828T000238Z.json) provide the current evidence.

The advisory family has two closely coupled failures:

- CVE-2026-75797: subscriber-level callers can map supplied URLs to local filesystem paths, read arbitrary server files, and forward contents to an external AI service when the non-default public API feature is enabled; otherwise, administrator reachability remains relevant on multisite because non-super subsite administrators may read network-shared configuration and secrets.
- CVE-2026-75798: unauthenticated callers can run AI queries against the site owner's configured provider account by relying on a token handed to anonymous visitors.

This is more AI-specific than the weaker WordPress AI plugin deferrals because it crosses local file access and provider account use.

## Security Impact

- Threat: low-privilege or unauthenticated web users can expose local files to an external AI service or spend/use the site owner's AI provider account.
- Affected boundary: AI Engine WordPress plugin before 3.7.2; subscriber file-read path; anonymous AI query authorization; external provider forwarding.
- Exploit or incident status: public NVD and WPScan evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade AI Engine to 3.7.2 or later and require server-side authorization for both local file access and provider-backed AI queries.
- Confidence: medium-high because NVD and WPScan provide concrete facts, while the collector notes some vendor fields may be incomplete.
- Residual risk: AI plugins can combine ordinary CMS authorization gaps with sensitive provider accounts and external data disclosure.

## Authoritative Sources

- [August 27 leaf update watch source](../../../raw/processed/2026-08-27/ai-security-wiki-leaf-update-watch-20260828T000238Z.json)
- [CVE-2026-75797 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-75797)
- [CVE-2026-75798 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-75798)
- [August 26 topic news collector source](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json)
- [NVD CVE-2026-75797](https://nvd.nist.gov/vuln/detail/CVE-2026-75797)
- [NVD CVE-2026-75798](https://nvd.nist.gov/vuln/detail/CVE-2026-75798)
- [WPScan CVE-2026-75797 reference](https://wpscan.com/vulnerability/1048b130-9263-4780-b886-656a891de85a/)
- [WPScan CVE-2026-75798 reference](https://wpscan.com/vulnerability/a77168df-61b8-40df-95f5-e19cf6540ce5/)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [WordPress AI plugin advisory deferrals](wordpress-ai-plugin-advisory-deferrals.md)
- [AI provider override trust boundaries](../data-and-privacy/ai-provider-override-trust-boundaries.md)

## Open Questions

- Does AI Engine 3.7.2 fully remediate both local file forwarding and unauthenticated AI query execution, and are provider tokens still exposed to anonymous visitors?

## Maintenance Notes

- Updated on 2026-08-28 with August 27 leaf-update evidence for CVE-2026-75797, CVE-2026-75798.
- Created on 2026-08-27 from the [August 26 topic collector](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json) as a closely coupled WordPress AI plugin advisory-family leaf.
