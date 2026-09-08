---
type: "Topic"
title: "OpenShift AI NIM Secret Authorization Bypass"
description: "Security analysis for CVE-2026-86332 missing authorization on OpenShift AI NIM credential reads."
tags: ["identity-and-access", "data-and-privacy"]
---

# OpenShift AI NIM Secret Authorization Bypass

## Current Understanding

The [September 7 topic collector source](../../../raw/processed/2026-09-07/ai-security-wiki-topic-news-collector-2026-09-07T233220Z.json) records [CVE-2026-86332](https://cveawg.mitre.org/api/cve/CVE-2026-86332) for Red Hat OpenShift AI `odh-dashboard`. The CVE says the backend-for-frontend route `GET /api/nim-serving/:nimResource` reads Kubernetes Secrets using the dashboard service account and returns full Secret objects, including `.data`, without an authorization check.

Any authenticated dashboard user can retrieve the NVIDIA NGC API key Secret and NIM image pull secret according to the CVE description. This page owns the AI platform identity and credential-exposure boundary; broad Red Hat OpenShift AI, NVIDIA NGC, and NIM product context belongs upstream in ai-wiki.

## Security Impact

- Threat: an authenticated low-privilege dashboard user can read model-serving pull credentials through a route that lacks the authorization gate used by adjacent create and delete paths.
- Affected boundary: Red Hat OpenShift AI dashboard and related RHOAI packages named in the CVE record, including `rhoai/odh-dashboard-*` and `rhoai/odh-core-bff-rhel9`.
- Exploit or incident status: public [Red Hat CNA CVE](https://cveawg.mitre.org/api/cve/CVE-2026-86332), [Red Hat CVE page](https://access.redhat.com/security/cve/CVE-2026-86332), and [NVD entry](https://nvd.nist.gov/vuln/detail/CVE-2026-86332); no exploitation evidence is recorded by the source.
- Mitigation state: restrict NIM credential read authority to administrators or scoped owners, patch affected RHOAI packages when Red Hat ships fixes, and audit dashboard routes that proxy Kubernetes Secrets through service-account authority.
- Confidence: high for the route, credential names, missing authorization class, and affected product family because the direct CVE record carries those details.
- Residual risk: other dashboard endpoints may use service-account reads that unintentionally flatten user authorization into shared AI platform credentials.

## Authoritative Sources

- [September 7 topic collector source](../../../raw/processed/2026-09-07/ai-security-wiki-topic-news-collector-2026-09-07T233220Z.json)
- [CVE-2026-86332 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-86332)
- [Red Hat CVE-2026-86332 page](https://access.redhat.com/security/cve/CVE-2026-86332)
- [Red Hat Bugzilla 2529287](https://bugzilla.redhat.com/show_bug.cgi?id=2529287)
- [NVD CVE-2026-86332](https://nvd.nist.gov/vuln/detail/CVE-2026-86332)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [data and privacy](../data-and-privacy/index.md)
- [OpenShift AI service account excessive permissions](openshift-ai-service-account-excessive-permissions.md)
- [OpenShift AI guardrails-detectors ReDoS](../infrastructure-and-supply-chain/openshift-ai-guardrails-detectors-redos.md)

## Open Questions

- Which Red Hat errata or fixed RHOAI package versions close CVE-2026-86332?

## Maintenance Notes

- Created on 2026-09-07 from the September 7 topic collector as an AI platform NIM credential authorization leaf.
