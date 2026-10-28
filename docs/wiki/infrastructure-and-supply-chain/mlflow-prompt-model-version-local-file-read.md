---
type: "Topic"
title: "MLflow Prompt Model-Version Local File Read"
description: "Security analysis for CVE-2026-116690 schemeless prompt sources reading server-local artifacts."
tags: ["infrastructure-and-supply-chain", "model-and-prompt-security"]
---

# MLflow Prompt Model-Version Local File Read

## Current Understanding

The [October 27 collector source](../../../raw/processed/2026-10-27/ai-security-wiki-topic-news-collector-2026-10-27T232925Z.json) records [CVE-2026-116690](https://cveawg.mitre.org/api/cve/CVE-2026-116690) / [GHSA-m65p-9j7q-6w33](https://github.com/mlflow/mlflow/security/advisories/GHSA-m65p-9j7q-6w33). MLflow versions 3.10.0 through 3.16.1 allow a schemeless relative prompt source during model-version creation, letting a remote caller select a server-local artifact path and read it through the model-version artifact API. Broad MLflow context belongs upstream; this page owns prompt model-version source validation as a host-file confidentiality boundary.

## Security Impact

- Threat: a remote caller turns model metadata into a server-local file read through the artifact API.
- Affected boundary: MLflow prompt model-version creation and artifact retrieval in versions 3.10.0 through 3.16.1.
- Exploit or incident status: public maintainer advisory and CVE; no active exploitation or local incident is identified.
- Mitigation state: upgrade to 3.17.0, validate prompt source schemes and containment, audit model versions for local or relative sources, and restrict access to exposed MLflow servers.
- Confidence: high because the maintainer advisory, fix, and release are linked by the collected evidence.
- Residual risk: artifact authorization cannot compensate for accepting caller-selected host-local paths.

## Authoritative Sources

- [October 27 collector source](../../../raw/processed/2026-10-27/ai-security-wiki-topic-news-collector-2026-10-27T232925Z.json)
- [CVE-2026-116690](https://cveawg.mitre.org/api/cve/CVE-2026-116690)
- [GHSA-m65p-9j7q-6w33](https://github.com/mlflow/mlflow/security/advisories/GHSA-m65p-9j7q-6w33)
- [MLflow 3.17.0 release](https://github.com/mlflow/mlflow/releases/tag/v3.17.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [MLflow model artifact source validation bypass](mlflow-model-artifact-source-validation-bypass.md)

## Open Questions

- Does the 3.17.0 repair reject every schemeless and relative source form, including encoded or platform-specific paths?

## Maintenance Notes

- Created on 2026-10-27 from the collector; this is separate from earlier cross-run artifact authorization because it reaches server-local paths.
