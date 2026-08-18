---
type: "Topic"
title: "OpenShift AI Service Account Excessive Permissions"
description: "Security analysis for CVE-2026-15218 overprivileged OpenShift AI service accounts."
tags: ["identity-and-access", "infrastructure-and-supply-chain"]
---

# OpenShift AI Service Account Excessive Permissions

## Current Understanding

The [August 17 topic news collector source](../../../raw/processed/2026-08-17/ai-security-wiki-topic-news-collector-2026-08-17T233246Z.json) records NVD publication of CVE-2026-15218 for Red Hat OpenShift AI. Broad Red Hat OpenShift AI product background belongs upstream; this page owns the local AI platform service-account least-privilege and cluster-scope blast-radius lens.

[NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-15218) says `maas-api` and `maas-controller` ServiceAccounts have cluster-wide permissions beyond operational requirements. If an attacker compromises those identities through remote code execution or a malicious pod in the same namespace, the excess permissions can lead to full cluster administrator privileges through new ClusterRoleBindings or disclosure of all cluster secrets. Red Hat's CVSS v3.1 score is 7.9 high.

This is an AI platform identity issue rather than a generic Kubernetes note because model-serving, feature-store, notebook, and controller identities often sit near model artifacts, datasets, tokens, and tenant workloads. Cluster-wide privilege on an AI control-plane identity turns a local workload compromise into platform-wide compromise.

## Security Impact

- Threat: compromise of an AI platform service account can escalate to cluster-admin authority or broad secret disclosure.
- Affected boundary: Red Hat OpenShift AI `maas-api` and `maas-controller` ServiceAccounts; exact affected versions remain to be confirmed from Red Hat advisories.
- Exploit or incident status: public NVD advisory; no exploitation evidence is recorded by the source.
- Mitigation state: remove excess ClusterRoleBinding authority, scope service accounts to operational needs, patch when Red Hat errata is available, and audit service-account token use.
- Confidence: high for NVD publication and vulnerability description; lower for affected-version and errata details until Red Hat primary advisory content is captured.
- Residual risk: shared namespaces, long-lived service-account tokens, and controller identities can preserve cluster-wide blast radius after application-layer fixes.

## Authoritative Sources

- [August 17 topic news collector source](../../../raw/processed/2026-08-17/ai-security-wiki-topic-news-collector-2026-08-17T233246Z.json)
- NVD CVE-2026-15218: https://nvd.nist.gov/vuln/detail/CVE-2026-15218
- Red Hat CVE page: https://access.redhat.com/security/cve/CVE-2026-15218
- Red Hat Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=2498426

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [Production agent identity and access controls](production-agent-identity-and-access-controls.md)
- [AI supply chain provenance credentialing](../infrastructure-and-supply-chain/ai-supply-chain-provenance-credentialing.md)
- Upstream AI wiki owns broad Red Hat OpenShift AI product context.

## Open Questions

- Which Red Hat errata, affected versions, and exact role reductions close CVE-2026-15218?

## Maintenance Notes

- Created on 2026-08-17 from the August 17 topic collector as an AI platform workload-identity advisory leaf.
