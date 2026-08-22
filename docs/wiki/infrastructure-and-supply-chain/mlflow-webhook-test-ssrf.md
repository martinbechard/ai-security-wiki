---
type: "Topic"
title: "MLflow Webhook Test SSRF"
description: "Security analysis for CVE-2026-64849 webhook test SSRF in MLflow model registry."
tags: ["infrastructure-and-supply-chain", "testing-and-assurance"]
---

# MLflow Webhook Test SSRF

## Current Understanding

The [August 17 topic news collector source](../../../raw/processed/2026-08-17/ai-security-wiki-topic-news-collector-2026-08-17T233246Z.json) and [August 19 leaf update watch source](../../../raw/processed/2026-08-18/ai-security-wiki-leaf-update-watch-20260819T000420Z.json) record CVE-2026-64849 / GHSA-7gwp-5pfp-969j for MLflow before 3.15.0. Broad MLflow platform context belongs upstream; this page owns the model-registry webhook network-reachability boundary.

The advisory family page [MLflow 3.15.0 security advisory cluster](mlflow-3150-security-advisory-cluster.md) links the related MLflow 3.15.0 issues. This leaf is narrower: unauthenticated model-registry webhook testing can become full-read SSRF when URL validation is bypassed through redirects or DNS rebinding. The watcher adds GitHub-reviewed critical severity, CVSS 9.3, and reflected internal response-body exposure through webhook test flows.

The [August 21 leaf update watch source](../../../raw/processed/2026-08-21/ai-security-wiki-leaf-update-watch-20260822T000454Z.json) preserves this as the MLflow 3.15.0 network-boundary member. It reinforces that redirect revalidation and resolved-address pinning are the practical control points for webhook-test SSRF.

## Security Impact

- Threat: attackers can use webhook testing to read internal network resources or metadata-service responses through the MLflow tracking server.
- Affected boundary: MLflow before 3.15.0; model-registry webhook test flows and internal network reachability from the tracking server.
- Exploit or incident status: public GitHub-reviewed advisory; no local incident evidence is recorded.
- Mitigation state: upgrade to MLflow 3.15.0, restrict webhook test access, revalidate redirect destinations, block internal address ranges, and review webhook test logs.
- Confidence: high for affected version, severity, response-body exposure, and fixed release from GitHub advisory and release evidence.
- Residual risk: deployments need retrospective review for internal response data returned through webhook tests before upgrade.

## Authoritative Sources

- [August 17 topic news collector source](../../../raw/processed/2026-08-17/ai-security-wiki-topic-news-collector-2026-08-17T233246Z.json)
- [August 19 leaf update watch source](../../../raw/processed/2026-08-18/ai-security-wiki-leaf-update-watch-20260819T000420Z.json)
- [August 21 leaf update watch source](../../../raw/processed/2026-08-21/ai-security-wiki-leaf-update-watch-20260822T000454Z.json)
- GitHub advisory GHSA-7gwp-5pfp-969j: https://github.com/advisories/GHSA-7gwp-5pfp-969j
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
- [agent network egress controls](../agent-and-tool-security/agent-network-egress-controls.md)
- Upstream AI wiki owns broad MLflow platform context.

## Open Questions

- Which MLflow logs prove whether webhook test SSRF returned internal response bodies before upgrade?

## Maintenance Notes

- Created on 2026-08-19 after verifier correction split the MLflow advisory family into independently maintainable leaves.
- Updated on 2026-08-21 from the [August 21 watcher](../../../raw/processed/2026-08-21/ai-security-wiki-leaf-update-watch-20260822T000454Z.json) with repeated CVE publication and redirect-bypass evidence.
