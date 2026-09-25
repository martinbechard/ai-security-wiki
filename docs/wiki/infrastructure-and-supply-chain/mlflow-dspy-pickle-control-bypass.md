---
type: "Topic"
title: "MLflow DSPy Pickle Control Bypass"
description: "Security analysis for CVE-2026-96775, where MLflow dspy flavor deserialization controls can be bypassed through MLmodel artifacts."
tags: ["infrastructure-and-supply-chain"]
---

# MLflow DSPy Pickle Control Bypass

## Current Understanding

The [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) records [CVE-2026-96775](https://cveawg.mitre.org/api/cve/CVE-2026-96775) for the MLflow dspy flavor. Broad MLflow and DSPy framework context belongs upstream; this page owns the local model-artifact deserialization control boundary.

The CVE record says the `MLFLOW_ALLOW_PICKLE_DESERIALIZATION=False` control is applied only when a `model_path` ends in `.pkl`. A crafted `MLmodel` artifact can route around the extension-based check, creating a remote code execution path in MLflow model loading.

## Security Impact

- Threat: a model artifact can bypass intended pickle-deserialization controls and execute attacker-controlled code during model loading.
- Affected boundary: MLflow dspy flavor versions greater than or equal to 2.0 according to the CVE record; `MLmodel` metadata and `MLFLOW_ALLOW_PICKLE_DESERIALIZATION` enforcement.
- Exploit or incident status: public CVE, NVD, and CERT VU evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: avoid loading untrusted MLflow dspy artifacts, enforce deserialization policy by artifact semantics rather than filename extension, and track fixed MLflow release guidance.
- Confidence: high for vulnerability existence and control-bypass class; medium for exact fixed version until MLflow release notes identify the patch.
- Residual risk: model artifacts are executable supply-chain inputs, so safety controls must bind to loader behavior instead of path suffixes.

## Authoritative Sources

- [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json)
- [CVE-2026-96775 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-96775)
- [NVD CVE-2026-96775](https://nvd.nist.gov/vuln/detail/CVE-2026-96775)
- [CERT VU#369093](https://kb.cert.org/vuls/id/369093)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [MLflow 3.15.0 security advisory cluster](mlflow-3150-security-advisory-cluster.md)
- [MLflow model artifact source validation bypass](mlflow-model-artifact-source-validation-bypass.md)
- [ModelScope unsafe YAML loader RCE](modelscope-unsafe-yaml-loader-rce.md)

## Open Questions

- Which MLflow release first fixes CVE-2026-96775, and do non-DSPy flavors share similar extension-based deserialization checks?

## Maintenance Notes

- Created on 2026-09-25 from the [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json); keep broad MLflow framework context upstream.
