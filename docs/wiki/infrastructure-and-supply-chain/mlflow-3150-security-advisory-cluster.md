---
type: "Topic"
title: "MLflow 3.15.0 Security Advisory Cluster"
description: "Security analysis for the MLflow 3.15.0 SSRF, dataset-lineage, and model-artifact authorization advisory family."
tags: ["infrastructure-and-supply-chain", "identity-and-access", "testing-and-assurance"]
---

# MLflow 3.15.0 Security Advisory Cluster

## Current Understanding

The [August 17 topic news collector source](../../../raw/processed/2026-08-17/ai-security-wiki-topic-news-collector-2026-08-17T233246Z.json) records three GitHub-reviewed MLflow advisories fixed in 3.15.0. Broad MLflow platform background belongs in the upstream AI wiki; this local page is the advisory-family router for the three MLflow 3.15.0 security leaves.

The closely coupled advisory family is:

- [MLflow webhook test SSRF](mlflow-webhook-test-ssrf.md) owns CVE-2026-64849 / GHSA-7gwp-5pfp-969j: unauthenticated model-registry webhook testing can become full-read SSRF when URL validation is bypassed through redirects or DNS rebinding.
- [MLflow dataset lineage authorization bypass](mlflow-dataset-lineage-authorization-bypass.md) owns CVE-2026-69146 / GHSA-3p64-6gvh-82v5: any authenticated basic-auth user can write dataset lineage records to another user's run through an unguarded LogInputs path.
- [MLflow model artifact source validation bypass](mlflow-model-artifact-source-validation-bypass.md) owns CVE-2026-69148 / GHSA-gqch-g4w5-7qcw: an authenticated user can create model versions that reference another user's run or artifacts and then read files without the expected READ permission.

MLflow stores registry metadata, model artifacts, dataset lineage, and evaluation evidence. The family therefore crosses three independently important AI platform boundaries: internal-service reachability through webhooks, provenance or audit-evidence integrity through lineage writes, and artifact confidentiality through model-version source validation.

The [August 19 leaf update watch source](../../../raw/processed/2026-08-18/ai-security-wiki-leaf-update-watch-20260819T000420Z.json) adds GitHub review metadata for all three advisories. [GHSA-7gwp-5pfp-969j](https://github.com/advisories/GHSA-7gwp-5pfp-969j) is recorded as critical 9.3 with reflected internal response-body exposure through webhook test flows. [GHSA-3p64-6gvh-82v5](https://github.com/advisories/GHSA-3p64-6gvh-82v5) is lineage or evidence-integrity impact, not model-artifact confidentiality. [GHSA-gqch-g4w5-7qcw](https://github.com/advisories/GHSA-gqch-g4w5-7qcw) is high severity and confirms cross-run artifact read impact for model weights, training samples, and evaluation reports.

The [August 21 leaf update watch source](../../../raw/processed/2026-08-21/ai-security-wiki-leaf-update-watch-20260822T000454Z.json) repeats the in-window MLflow 3.15.0 advisory family as separate updates but does not require new leaves. This router keeps the three-item family grouped for digest and navigation while the child leaves own independently changing SSRF, lineage-integrity, and model-artifact confidentiality details.

## Security Impact

- Threat: attackers can use MLflow control-plane features to read internal network resources, poison lineage evidence, or disclose model artifacts; the linked leaves own the issue-specific analysis.
- Affected boundary: MLflow before 3.15.0; default tracking-server model-registry webhooks, basic-auth run lineage writes, and registered-model artifact access.
- Exploit or incident status: public GitHub-reviewed advisories; no local incident evidence is recorded.
- Mitigation state: upgrade to MLflow 3.15.0, restrict unauthenticated webhook testing, revalidate redirect destinations, enforce run ownership on lineage writes, and validate model-version artifact source permissions.
- Confidence: high for affected version and advisory mechanics because GitHub advisory, patch, and release references agree; the collector notes package-ecosystem metadata drift in one advisory.
- Residual risk: deployments need retrospective review for webhook SSRF logs, lineage records created by unexpected users, and model versions whose source references cross ownership boundaries.

## Authoritative Sources

- [August 17 topic news collector source](../../../raw/processed/2026-08-17/ai-security-wiki-topic-news-collector-2026-08-17T233246Z.json)
- [August 19 leaf update watch source](../../../raw/processed/2026-08-18/ai-security-wiki-leaf-update-watch-20260819T000420Z.json)
- [August 21 leaf update watch source](../../../raw/processed/2026-08-21/ai-security-wiki-leaf-update-watch-20260822T000454Z.json)
- GitHub advisory GHSA-7gwp-5pfp-969j: https://github.com/advisories/GHSA-7gwp-5pfp-969j
- GitHub advisory GHSA-3p64-6gvh-82v5: https://github.com/advisories/GHSA-3p64-6gvh-82v5
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
- [MLflow webhook test SSRF](mlflow-webhook-test-ssrf.md)
- [MLflow dataset lineage authorization bypass](mlflow-dataset-lineage-authorization-bypass.md)
- [MLflow model artifact source validation bypass](mlflow-model-artifact-source-validation-bypass.md)
- [production agent identity and access controls](../identity-and-access/production-agent-identity-and-access-controls.md)
- [AI supply chain provenance credentialing](ai-supply-chain-provenance-credentialing.md)
- Upstream AI wiki owns broad MLflow platform context.

## Open Questions

- Which MLflow deployment logs or audit records best prove that webhook SSRF and cross-user artifact reads did not occur before upgrade?

## Maintenance Notes

- Created on 2026-08-17 from the August 17 topic collector as one closely coupled MLflow 3.15.0 advisory-family leaf.
- Updated on 2026-08-19 from the August 19 leaf watcher with GitHub-reviewed severity, response-body, lineage-integrity, and artifact-read impact detail.
- Split on 2026-08-19 after verifier correction so each CVE has its own durable leaf and this page remains the family router.
- Updated on 2026-08-21 from the [August 21 watcher](../../../raw/processed/2026-08-21/ai-security-wiki-leaf-update-watch-20260822T000454Z.json) with repeated in-window CVE publication evidence without creating duplicate digest items.
