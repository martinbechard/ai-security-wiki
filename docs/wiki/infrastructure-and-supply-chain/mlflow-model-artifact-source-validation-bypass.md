---
type: "Topic"
title: "MLflow Model Artifact Source Validation Bypass"
description: "Security analysis for CVE-2026-69148 cross-run artifact reads through MLflow model-version source validation."
tags: ["infrastructure-and-supply-chain", "identity-and-access", "data-and-privacy"]
---

# MLflow Model Artifact Source Validation Bypass

## Current Understanding

The [August 17 topic news collector source](../../../raw/processed/2026-08-17/ai-security-wiki-topic-news-collector-2026-08-17T233246Z.json) and [August 19 leaf update watch source](../../../raw/processed/2026-08-18/ai-security-wiki-leaf-update-watch-20260819T000420Z.json) record CVE-2026-69148 / GHSA-gqch-g4w5-7qcw for MLflow before 3.15.0. Broad MLflow platform context belongs upstream; this page owns the model-artifact confidentiality and source-validation boundary.

The advisory family page [MLflow 3.15.0 security advisory cluster](mlflow-3150-security-advisory-cluster.md) links the related MLflow 3.15.0 issues. This leaf is narrower: an authenticated user can create model versions that reference another user's run or artifacts and then read files without the expected READ permission. The watcher adds GitHub-reviewed high severity and confirms cross-run artifact read impact for model weights, training samples, and evaluation reports. The permission nuance is that default permissions and model-version creation do not substitute for validating the caller's READ access to the referenced run artifact source; retrospective review should look for model versions whose source references cross ownership boundaries.

## Security Impact

- Threat: an authenticated user can turn model-version creation into unauthorized model-artifact reads.
- Affected boundary: MLflow before 3.15.0; registered models, run artifact authorization, model weights, training samples, and evaluation reports.
- Exploit or incident status: public GitHub-reviewed advisory; no local incident evidence is recorded.
- Mitigation state: upgrade to MLflow 3.15.0, validate model-version source permissions, and audit model versions whose source references cross ownership boundaries.
- Confidence: high for affected version, artifact-read impact, and fixed release from GitHub advisory and release evidence.
- Residual risk: historical model versions may continue to expose artifacts if source references were created before authorization fixes.

## Authoritative Sources

- [August 17 topic news collector source](../../../raw/processed/2026-08-17/ai-security-wiki-topic-news-collector-2026-08-17T233246Z.json)
- [August 19 leaf update watch source](../../../raw/processed/2026-08-18/ai-security-wiki-leaf-update-watch-20260819T000420Z.json)
- GitHub advisory GHSA-gqch-g4w5-7qcw: https://github.com/advisories/GHSA-gqch-g4w5-7qcw
- MLflow 3.15.0 release: https://github.com/mlflow/mlflow/releases/tag/v3.15.0

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [MLflow 3.15.0 security advisory cluster](mlflow-3150-security-advisory-cluster.md)
- [production agent identity and access controls](../identity-and-access/production-agent-identity-and-access-controls.md)
- [model processing data residency controls](../data-and-privacy/model-processing-data-residency-controls.md)
- Upstream AI wiki owns broad MLflow platform context.

## Open Questions

- Which model versions should be reviewed for source references to runs or artifacts owned by other users?

## Maintenance Notes

- Created on 2026-08-19 after verifier correction split the MLflow advisory family into independently maintainable leaves.
