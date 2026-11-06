---
type: "Topic"
title: "Azure AI Language Missing Authentication"
description: "Security analysis for CVE-2026-70352 missing authentication in Azure AI Language."
tags: ["identity-and-access"]
---

# Azure AI Language Missing Authentication

## Current Understanding

The [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json) and the [November 5 leaf update watch](../../../raw/processed/2026-11-05/ai-security-wiki-leaf-update-watch-20261106T010235Z.json) record CVE-2026-70352 for Azure AI Language Authoring. Broad Microsoft Azure AI product context belongs upstream; this page owns the missing-authentication boundary for that cloud-AI authoring service.

[CVE-2026-70352](https://cveawg.mitre.org/api/cve/CVE-2026-70352) and [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-70352) describe a missing-authentication-for-critical-function vulnerability that lets an unauthorized network attacker elevate privileges. The November watch records an October 31 CVE revision with a CVSS 10.0 vector, the [MSRC advisory](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-70352) and patch reference, and CISA ADP SSVC metadata stating no known exploitation; the remediation scope and tenant-visible actions still need reconciliation.

## Security Impact

- Threat: a cloud AI service critical function can be reached without the expected authentication.
- Affected boundary: Azure AI Language Authoring critical-function authentication and privilege boundary; remediation scope and tenant-visible actions need reconciliation with the [MSRC advisory](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-70352).
- Exploit or incident status: public CVE; the November watch records CISA ADP SSVC metadata of no known exploitation, and no local incident evidence is recorded.
- Mitigation state: a vendor advisory and patch reference are recorded; confirm the MSRC remediation scope, review service access controls, and monitor for privilege-elevation indicators.
- Confidence: high for the disclosed vulnerability and no-known-exploitation metadata; lower for tenant-visible operational details until MSRC evidence is captured.
- Residual risk: service-side fixes may not expose tenant-visible version boundaries, so control evidence needs advisory and configuration confirmation.

## Authoritative Sources

- [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json)
- [November 5 leaf update watch](../../../raw/processed/2026-11-05/ai-security-wiki-leaf-update-watch-20261106T010235Z.json)
- [CVE-2026-70352](https://cveawg.mitre.org/api/cve/CVE-2026-70352)
- [NVD CVE-2026-70352](https://nvd.nist.gov/vuln/detail/CVE-2026-70352)
- [MSRC CVE-2026-70352 advisory](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-70352)

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

- Which remediation scope and tenant-visible customer action does the MSRC advisory establish for Azure AI Language Authoring?

## Maintenance Notes

- Created on 2026-09-04 from the [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json).
- Updated on 2026-11-05 from the [November 5 leaf update watch](../../../raw/processed/2026-11-05/ai-security-wiki-leaf-update-watch-20261106T010235Z.json) with the October 31 CVE revision; next reconcile MSRC service-remediation details.
