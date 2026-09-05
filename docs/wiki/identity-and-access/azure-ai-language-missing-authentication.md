---
type: "Topic"
title: "Azure AI Language Missing Authentication"
description: "Security analysis for CVE-2026-70352 missing authentication in Azure AI Language."
tags: ["identity-and-access"]
---

# Azure AI Language Missing Authentication

## Current Understanding

The [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json) records CVE-2026-70352 for Azure AI Language. Broad Microsoft Azure AI product context belongs upstream; this page owns missing-authentication and cloud-AI service privilege boundaries.

[CVE-2026-70352](https://cveawg.mitre.org/api/cve/CVE-2026-70352) and [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-70352) describe a missing-authentication-for-critical-function vulnerability that lets an unauthorized network attacker elevate privileges. The collector marks confidence as medium-high because the MSRC page may require JavaScript and should be rechecked for service remediation detail.

## Security Impact

- Threat: a cloud AI service critical function can be reached without the expected authentication.
- Affected boundary: Azure AI Language service privilege boundary; exact component and remediation state need MSRC reconciliation.
- Exploit or incident status: public CVE; no local exploitation evidence is recorded.
- Mitigation state: confirm MSRC remediation, review service access controls, and monitor for privilege-elevation indicators.
- Confidence: medium-high from CVE and NVD timing; lower for operational details until MSRC evidence is captured.
- Residual risk: service-side fixes may not expose tenant-visible version boundaries, so control evidence needs advisory and configuration confirmation.

## Authoritative Sources

- [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json)
- [CVE-2026-70352](https://cveawg.mitre.org/api/cve/CVE-2026-70352)
- [NVD CVE-2026-70352](https://nvd.nist.gov/vuln/detail/CVE-2026-70352)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [production agent identity and access controls](production-agent-identity-and-access-controls.md)

## Open Questions

- What MSRC remediation details identify the affected Azure AI Language function, tenant exposure, and required customer action?

## Maintenance Notes

- Created on 2026-09-04 from the [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json).
