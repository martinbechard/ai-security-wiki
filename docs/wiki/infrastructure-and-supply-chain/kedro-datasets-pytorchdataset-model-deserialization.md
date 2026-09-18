---
type: "Topic"
title: "Kedro-Datasets PyTorchDataset Model Deserialization"
description: "Security analysis for CVE-2026-62997 unsafe torch.load behavior in kedro-datasets PyTorchDataset."
tags: ["infrastructure-and-supply-chain"]
---

# Kedro-Datasets PyTorchDataset Model Deserialization

## Current Understanding

The [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) records CVE-2026-62997 for `kedro-datasets` 5.0.0 through before 9.5.0. Broad Kedro and PyTorch context belongs upstream; this page owns the local model-deserialization supply-chain boundary.

The CVE says the experimental `PyTorchDataset` loaded `.pt` model files with `torch.load` without enforcing `weights_only=True` and silently dropped user-supplied `load_args`. On PyTorch versions before 2.6, malicious pickle-backed models from shared registries or external sources could execute code.

## Security Impact

- Threat: model files can execute arbitrary pickle payloads during pipeline dataset loading.
- Affected boundary: `kedro-datasets` experimental `PyTorchDataset` from 5.0.0 until 9.5.0, PyTorch before 2.6, shared model registries, and external `.pt` files.
- Exploit or incident status: public CVE record; no local exploitation incident is recorded.
- Mitigation state: upgrade to 9.5.0 or later, enforce `weights_only=True`, prefer non-pickle model formats when possible, and treat registry-sourced model files as executable artifacts.
- Confidence: high for CVE publication, version range, and unsafe deserialization behavior.
- Residual risk: pipeline frameworks can hide unsafe loader defaults behind declarative dataset configuration, so model-loading tests need to cover loader arguments and PyTorch version behavior.

## Authoritative Sources

- [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json)
- [CVE-2026-62997 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-62997)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [Elasticsearch ML model artifact deserialization RCE](elasticsearch-ml-model-artifact-deserialization-rce.md)
- [NLTK transition parser model pickle RCE](nltk-transition-parser-model-pickle-rce.md)
- [AI supply chain provenance credentialing](ai-supply-chain-provenance-credentialing.md)

## Open Questions

- Which local Kedro or PyTorch dataset pipelines load externally sourced `.pt` files under PyTorch versions before 2.6?

## Maintenance Notes

- Created on 2026-09-18 from the [September 17 topic collector](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) as a model-deserialization supply-chain leaf.
