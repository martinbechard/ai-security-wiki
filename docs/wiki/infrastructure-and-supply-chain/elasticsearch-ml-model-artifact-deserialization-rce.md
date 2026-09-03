---
type: "Topic"
title: "Elasticsearch ML Model Artifact Deserialization RCE"
description: "Security analysis for CVE-2026-72649 trained model artifact deserialization in Elasticsearch machine learning."
tags: ["infrastructure-and-supply-chain", "identity-and-access"]
---

# Elasticsearch ML Model Artifact Deserialization RCE

## Current Understanding

The [September 1 topic collector source](../../../raw/processed/2026-09-01/ai-security-wiki-topic-news-collector-2026-09-01T233307Z.json) records [CVE-2026-72649](https://nvd.nist.gov/vuln/detail/CVE-2026-72649) for Elasticsearch machine learning model artifact handling. Broad Elasticsearch and Elastic product context belongs upstream if needed; this page owns the local model-artifact provenance, deployment privilege, and deserialization boundary.

NVD describes deserialization of untrusted data in the Elasticsearch machine learning component. An authenticated user with privileges to create and deploy trained models can provide a crafted trained model artifact that executes attacker-controlled logic with a broader system-call surface than intended.

## Security Impact

- Threat: malicious trained model artifacts can execute code during deployment inside an operational search or analytics platform.
- Affected boundary: Elasticsearch machine learning trained model artifact deployment; exact fixed versions not captured locally.
- Exploit or incident status: public NVD vulnerability record; no local incident is recorded.
- Mitigation state: fixed-version details need Elastic advisory reconciliation; restrict trained-model creation and deployment privileges and require artifact provenance.
- Confidence: high for CVE identity and security class from NVD; medium for remediation until Elastic advisory evidence is captured.
- Residual risk: model deployment rights are code-execution-adjacent privileges and need stronger review than ordinary data upload rights.

## Control Implications

- Gate trained model deployment with least privilege, artifact provenance, and deserialization hardening.
- Separate model upload, validation, approval, and production deployment duties.
- Monitor model deployment events as high-risk infrastructure changes.

## Authoritative Sources

- [September 2 leaf update watch source](../../../raw/processed/2026-09-02/ai-security-wiki-leaf-update-watch-20260903T000347Z.json)
- [September 1 topic collector source](../../../raw/processed/2026-09-01/ai-security-wiki-topic-news-collector-2026-09-01T233307Z.json)
- [NVD CVE-2026-72649](https://nvd.nist.gov/vuln/detail/CVE-2026-72649)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [AI supply chain provenance credentialing](ai-supply-chain-provenance-credentialing.md)
- [MLflow model artifact source validation bypass](mlflow-model-artifact-source-validation-bypass.md)

## Open Questions

- Which Elastic advisory maps CVE-2026-72649 to affected and fixed Elasticsearch versions?

## Maintenance Notes

- Updated on 2026-09-02 from the [September 2 leaf update watch source](../../../raw/processed/2026-09-02/ai-security-wiki-leaf-update-watch-20260903T000347Z.json) with direct in-window provenance while preserving the existing security boundary.
- Created on 2026-09-01 from the [September 1 topic collector](../../../raw/processed/2026-09-01/ai-security-wiki-topic-news-collector-2026-09-01T233307Z.json) as an operational model-artifact deployment leaf.
