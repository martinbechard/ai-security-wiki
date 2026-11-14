---
type: "Topic"
title: "MLflow FileStore Model-ID Path Traversal"
description: "Security analysis for CVE-2026-127202 FileStore log-output writes outside a run directory."
tags: ["infrastructure-and-supply-chain"]
---

# MLflow FileStore Model-ID Path Traversal

## Current Understanding

The [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json) records [CVE-2026-127202](https://nvd.nist.gov/vuln/detail/CVE-2026-127202): MLflow before 3.18.0 using FileStore accepts `../` sequences in `model_id` on the log-outputs API, enabling unauthenticated writes outside the intended run directory within the service account's permissions. Broad MLflow coverage belongs upstream; this leaf owns the tracking-service write-containment boundary.

## Security Impact

- Threat: a caller turns model tracking metadata into writes beyond a run directory.
- Affected boundary: FileStore-backed MLflow before 3.18.0; FileStore is opt-in after 3.7.0 through `MLFLOW_ALLOW_FILE_STORE`.
- Exploit or incident status: public NVD disclosure with upstream fix and release references; no local incident is identified.
- Mitigation state: upgrade to 3.18.0 or later, disable FileStore where unnecessary, restrict log-outputs exposure, and minimize the service-account write scope.
- Confidence: high because NVD, the upstream fix, and the 3.18.0 release agree.
- Residual risk: a FileStore process can still affect every path available to its service account if another containment failure occurs.

## Authoritative Sources

- [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json)
- [NVD CVE-2026-127202](https://nvd.nist.gov/vuln/detail/CVE-2026-127202)
- [upstream fix](https://github.com/mlflow/mlflow/commit/ab5fc795eedc22348253cf687818cf2a16c15282)
- [MLflow 3.18.0 release](https://github.com/mlflow/mlflow/releases/tag/v3.18.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [MLflow prompt model-version local file read](mlflow-prompt-model-version-local-file-read.md)

## Open Questions

- Does the 3.18.0 repair canonicalize all `model_id` path forms before FileStore write resolution?

## Maintenance Notes

- Created on 2026-11-13 as a distinct write-integrity boundary from MLflow's earlier read and egress findings.
