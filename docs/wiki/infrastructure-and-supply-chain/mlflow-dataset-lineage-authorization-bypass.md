---
type: "Topic"
title: "MLflow Dataset Lineage Authorization Bypass"
description: "Security analysis for CVE-2026-69146 cross-run dataset lineage writes in MLflow."
tags: ["infrastructure-and-supply-chain", "identity-and-access", "testing-and-assurance"]
---

# MLflow Dataset Lineage Authorization Bypass

## Current Understanding

The [August 17 topic news collector source](../../../raw/processed/2026-08-17/ai-security-wiki-topic-news-collector-2026-08-17T233246Z.json) and [August 19 leaf update watch source](../../../raw/processed/2026-08-18/ai-security-wiki-leaf-update-watch-20260819T000420Z.json) record CVE-2026-69146 / GHSA-3p64-6gvh-82v5 for MLflow before 3.15.0. Broad MLflow platform context belongs upstream; this page owns the dataset-lineage integrity boundary.

The advisory family page [MLflow 3.15.0 security advisory cluster](mlflow-3150-security-advisory-cluster.md) links the related MLflow 3.15.0 issues. This leaf is narrower: any authenticated basic-auth user can write dataset lineage records to another user's run through an unguarded LogInputs path. The watcher explicitly classifies this as lineage and evidence-integrity impact, not model-artifact confidentiality.

The [August 21 leaf update watch source](../../../raw/processed/2026-08-21/ai-security-wiki-leaf-update-watch-20260822T000454Z.json) preserves the same CVE-2026-69146 boundary and fixed version, and it keeps this issue grouped with the MLflow 3.15.0 family only for digest purposes. The durable leaf remains lineage integrity because the attacker writes misleading audit and provenance records rather than reading model artifacts.

## Security Impact

- Threat: a low-privilege authenticated user can poison dataset lineage evidence for another user's run.
- Affected boundary: MLflow before 3.15.0; run authorization, dataset lineage, reproducibility records, and audit evidence.
- Exploit or incident status: public GitHub-reviewed advisory; no local incident evidence is recorded.
- Mitigation state: upgrade to MLflow 3.15.0, enforce run ownership on lineage writes, and audit lineage records written by unexpected users.
- Confidence: high for affected version, root boundary, and fixed release from GitHub advisory and release evidence.
- Residual risk: poisoned lineage can outlive patching if historical audit records are trusted without writer validation.

## Authoritative Sources

- [August 17 topic news collector source](../../../raw/processed/2026-08-17/ai-security-wiki-topic-news-collector-2026-08-17T233246Z.json)
- [August 19 leaf update watch source](../../../raw/processed/2026-08-18/ai-security-wiki-leaf-update-watch-20260819T000420Z.json)
- [August 21 leaf update watch source](../../../raw/processed/2026-08-21/ai-security-wiki-leaf-update-watch-20260822T000454Z.json)
- GitHub advisory GHSA-3p64-6gvh-82v5: https://github.com/advisories/GHSA-3p64-6gvh-82v5
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
- [AI supply chain provenance credentialing](ai-supply-chain-provenance-credentialing.md)
- [production agent identity and access controls](../identity-and-access/production-agent-identity-and-access-controls.md)
- Upstream AI wiki owns broad MLflow platform context.

## Open Questions

- Which MLflow lineage records should be revalidated after upgrading from a vulnerable version?

## Maintenance Notes

- Created on 2026-08-19 after verifier correction split the MLflow advisory family into independently maintainable leaves.
- Updated on 2026-08-21 from the [August 21 watcher](../../../raw/processed/2026-08-21/ai-security-wiki-leaf-update-watch-20260822T000454Z.json) with repeated fixed-version and lineage-integrity evidence.
