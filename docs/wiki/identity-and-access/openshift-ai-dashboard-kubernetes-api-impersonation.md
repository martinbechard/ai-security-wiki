---
type: "Topic"
title: "OpenShift AI Dashboard Kubernetes API Impersonation"
description: "Security analysis for CVE-2026-16745 odh-dashboard authentication bypass against the Kubernetes API."
tags: ["identity-and-access", "infrastructure-and-supply-chain"]
---

# OpenShift AI Dashboard Kubernetes API Impersonation

## Current Understanding

The [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json) records [CVE-2026-16745](https://nvd.nist.gov/vuln/detail/CVE-2026-16745) for Red Hat OpenShift AI `odh-dashboard`. Broad Red Hat OpenShift AI product context belongs upstream; this page owns the local AI platform dashboard identity and Kubernetes API impersonation boundary.

The source says dashboard binding behavior lets an in-cluster actor bypass authentication and impersonate users against the Kubernetes API. The collector pairs this with updated guardrails-detectors evidence, but that ReDoS issue is already owned by [OpenShift AI guardrails-detectors ReDoS](../infrastructure-and-supply-chain/openshift-ai-guardrails-detectors-redos.md); this leaf keeps the identity-specific dashboard issue separate.

## Security Impact

- Threat: in-cluster access can cross into unauthenticated or impersonated Kubernetes API actions through dashboard binding behavior.
- Affected boundary: Red Hat OpenShift AI `odh-dashboard`, dashboard binding behavior, in-cluster actor reachability, user impersonation, and Kubernetes API calls.
- Exploit or incident status: public NVD record; no local exploitation incident is recorded.
- Mitigation state: exact fixed builds require Red Hat advisory or errata reconciliation before making deployment guidance stronger.
- Confidence: medium-high for the vulnerability description from NVD; medium for fixed-version detail until primary Red Hat remediation evidence is identified.
- Residual risk: AI platform dashboards often mediate cluster-scoped actions, so dashboard service bindings need identity-bound authorization checks even for in-cluster callers.

## Authoritative Sources

- [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json)
- [NVD CVE-2026-16745](https://nvd.nist.gov/vuln/detail/CVE-2026-16745)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [OpenShift AI guardrails-detectors ReDoS](../infrastructure-and-supply-chain/openshift-ai-guardrails-detectors-redos.md)
- [OpenShift AI service account excessive permissions](openshift-ai-service-account-excessive-permissions.md)
- Upstream AI wiki owns broad Red Hat OpenShift AI product context.

## Open Questions

- Which Red Hat advisory or erratum identifies the fixed OpenShift AI builds for CVE-2026-16745?

## Maintenance Notes

- Created on 2026-10-01 from the [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json) after separating the identity issue from existing guardrails-detectors ReDoS coverage.
