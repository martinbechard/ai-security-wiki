---
type: "Topic"
title: "Azure AI Foundry Missing Authentication"
description: "Security analysis for CVE-2026-85889 missing authentication in Azure AI Foundry."
tags: ["identity-and-access"]
---

# Azure AI Foundry Missing Authentication

## Current Understanding

The [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) records [CVE-2026-85889](https://cveawg.mitre.org/api/cve/CVE-2026-85889) for Azure AI Foundry. Broad Microsoft and Azure AI Foundry product coverage belongs upstream; this page owns the local hosted-AI platform authentication and privilege-escalation boundary.

The CVE Services record and [MSRC advisory](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-85889) describe missing authentication for a critical function that lets an unauthenticated network attacker elevate privileges. The CVE record marks the issue as an exclusively hosted service vulnerability, so tenant-visible remediation evidence depends on Microsoft advisory status rather than a customer-managed package version.

## Security Impact

- Threat: an unauthenticated network path can reach a critical hosted AI platform function and elevate privileges.
- Affected boundary: Azure AI Foundry hosted-service control plane, missing authentication for critical function, and tenant workload management authority.
- Exploit or incident status: public Microsoft CNA CVE and MSRC advisory; no local exploitation incident is recorded.
- Mitigation state: track MSRC remediation, review tenant access and activity logs, and require compensating least-privilege controls around Foundry projects and agents.
- Confidence: high for CVE publication, hosted-service scope, and CVSS 10.0 severity; medium for tenant-action detail until MSRC publishes more operational specifics.
- Residual risk: hosted-service fixes may not expose versioned customer evidence, so assurance depends on advisory status, tenant audit trails, and control-plane monitoring.

## Authoritative Sources

- [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json)
- [CVE-2026-85889 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-85889)
- [MSRC CVE-2026-85889 advisory](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2026-85889)
- [NVD CVE-2026-85889](https://nvd.nist.gov/vuln/detail/CVE-2026-85889)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [Azure AI Language missing authentication](azure-ai-language-missing-authentication.md)
- [production agent identity and access controls](production-agent-identity-and-access-controls.md)

## Open Questions

- What MSRC tenant-action or remediation evidence identifies the affected Foundry function and the customer-visible closure state?

## Maintenance Notes

- Created on 2026-09-19 from the [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json).
