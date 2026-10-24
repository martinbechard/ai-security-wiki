---
type: "Topic"
title: "MLflow GenAI Scorer SSRF"
description: "Security analysis for GHSA-2wqp-q3c6-ccj5 unauthenticated GenAI scorer SSRF."
tags: ["agent-and-tool-security", "testing-and-assurance"]
---

# MLflow GenAI Scorer SSRF

## Current Understanding

The [October 23 collector](../../../raw/processed/2026-10-23/ai-security-wiki-topic-news-collector-2026-10-23T233200Z.json) records [GHSA-2wqp-q3c6-ccj5](https://github.com/mlflow/mlflow/security/advisories/GHSA-2wqp-q3c6-ccj5): unauthenticated MLflow servers with optional `trulens` and `trulens-providers-litellm` can instantiate permitted scorer classes from attacker JSON and make outbound HTTP requests. Broad MLflow context belongs upstream; this page owns evaluator egress.

## Security Impact

- Threat: scorer registration or evaluation produces privileged outbound requests.
- Affected boundary: MLflow >=3.12.0rc0 and <3.17.0 with optional GenAI evaluation dependencies and unauthenticated scorer endpoints.
- Exploit or incident status: maintainer advisory; no local incident is recorded.
- Mitigation state: upgrade to 3.17.0, require tracking-server authentication, and restrict egress.
- Confidence: high for conditions, mechanism, and fixed version.
- Residual risk: allowed-module constructors remain high-trust configuration surfaces.

## Authoritative Sources

- [October 23 collector](../../../raw/processed/2026-10-23/ai-security-wiki-topic-news-collector-2026-10-23T233200Z.json)
- [GHSA-2wqp-q3c6-ccj5](https://github.com/mlflow/mlflow/security/advisories/GHSA-2wqp-q3c6-ccj5)
- [MLflow 3.17.0](https://github.com/mlflow/mlflow/releases/tag/v3.17.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MLflow webhook test SSRF](../infrastructure-and-supply-chain/mlflow-webhook-test-ssrf.md)

## Open Questions

- Which MLflow deployments expose scorer endpoints without authentication?

## Maintenance Notes

- Created on 2026-10-23 as an independently changing evaluation-endpoint SSRF boundary.
