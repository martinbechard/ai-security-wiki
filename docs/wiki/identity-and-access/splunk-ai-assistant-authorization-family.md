---
type: "Topic"
title: "Splunk AI Assistant authorization family"
description: "Security analysis for the linked consent, retrieval, tenant-context, and feature-setting authorization flaws below Splunk AI Assistant 2.0.0."
tags: ["identity-and-access", "data-and-privacy"]
---

# Splunk AI Assistant authorization family

## Current Understanding

The [November 20 collector source](../../../raw/processed/2026-11-20/ai-security-wiki-topic-news-collector-2026-11-20T003127Z.json) groups four related flaws in Splunk AI Assistant versions below 2.0.0 under [one vendor advisory](https://advisory.splunk.com/advisories/SVD-2026-1111). Broad Splunk product context belongs upstream; this leaf owns the assistant authorization family and retains each control boundary separately.

- [CVE-2026-131302](https://nvd.nist.gov/vuln/detail/CVE-2026-131302): unauthorized training-data-consent changes.
- [CVE-2026-131303](https://nvd.nist.gov/vuln/detail/CVE-2026-131303): limited index or data-source information exposure outside scope.
- [CVE-2026-131304](https://nvd.nist.gov/vuln/detail/CVE-2026-131304): client-controlled tenant context enabling cross-tenant data access and misattribution.
- [CVE-2026-131305](https://nvd.nist.gov/vuln/detail/CVE-2026-131305): client-controlled feature settings.

## Security Impact

- Threat: client-controlled or insufficiently authorized assistant controls undermine consent, retrieval scope, tenant isolation, attribution, and server-owned configuration.
- Affected boundary: Splunk AI Assistant below 2.0.0 and its assistant REST or configuration controls.
- Exploit or incident status: public NVD and Splunk advisory records; no confirmed exploitation or local incident is recorded.
- Mitigation state: upgrade to 2.0.0 or later; test every listed boundary with low-privilege, cross-tenant accounts.
- Confidence: high for the shared version boundary and four named effects from the vendor advisory.
- Residual risk: a version upgrade does not establish that tenant binding or consent audit trails are correctly configured.

## Authoritative Sources

- [November 20 collector source](../../../raw/processed/2026-11-20/ai-security-wiki-topic-news-collector-2026-11-20T003127Z.json)
- [Splunk advisory SVD-2026-1111](https://advisory.splunk.com/advisories/SVD-2026-1111)
- [CVE-2026-131302](https://nvd.nist.gov/vuln/detail/CVE-2026-131302)
- [CVE-2026-131303](https://nvd.nist.gov/vuln/detail/CVE-2026-131303)
- [CVE-2026-131304](https://nvd.nist.gov/vuln/detail/CVE-2026-131304)
- [CVE-2026-131305](https://nvd.nist.gov/vuln/detail/CVE-2026-131305)

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

- Should future vendor evidence split a distinct fixed-version or control path from this closely coupled advisory family?

## Maintenance Notes

- Created on 2026-11-20 from a common vendor advisory and shared product-version boundary; retain the individual CVE effects within the family.
