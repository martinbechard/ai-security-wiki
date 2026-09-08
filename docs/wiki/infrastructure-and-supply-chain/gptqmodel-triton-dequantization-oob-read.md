---
type: "Topic"
title: "GPTQModel Triton Dequantization OOB Read"
description: "Security analysis for CVE-2026-86288 out-of-bounds read in GPTQModel's Triton dequantization kernel."
tags: ["infrastructure-and-supply-chain"]
---

# GPTQModel Triton Dequantization OOB Read

## Current Understanding

The [September 7 topic collector source](../../../raw/processed/2026-09-07/ai-security-wiki-topic-news-collector-2026-09-07T233220Z.json) records [CVE-2026-86288](https://cveawg.mitre.org/api/cve/CVE-2026-86288) for ModelCloud GPTQModel through 7.2.0. The CVE places the flaw in `gptqmodel/nn_modules/qlinear/tritonv2.py` in the Triton dequantization kernel, where manipulation of `g_idx` can cause an out-of-bounds read.

This is an AI deployment supply-chain issue because quantized-model runtime code is often loaded into serving or evaluation environments with model artifacts. Broad GPTQModel or model-compression ecosystem context belongs upstream in ai-wiki; this page owns the model-runtime memory-safety boundary.

## Security Impact

- Threat: untrusted or remotely influenced inputs to quantized model execution may exercise an out-of-bounds read in the Triton kernel path.
- Affected boundary: GPTQModel 7.0, 7.1, and 7.2.0 according to the [CVE affected list](https://cveawg.mitre.org/api/cve/CVE-2026-86288); 7.3.0 is marked unaffected.
- Exploit or incident status: the [CVE](https://cveawg.mitre.org/api/cve/CVE-2026-86288) says public exploit disclosure exists and points to [issue 2949](https://github.com/ModelCloud/GPTQModel/issues/2949); the source did not confirm active exploitation.
- Mitigation state: upgrade to [GPTQModel 7.3.0](https://github.com/ModelCloud/GPTQModel/releases/tag/v7.3.0) or later and treat model-runtime kernel updates as security patches, not only performance fixes.
- Confidence: medium-high because the CVE, [NVD entry](https://nvd.nist.gov/vuln/detail/CVE-2026-86288) captured by the collector, [issue](https://github.com/ModelCloud/GPTQModel/issues/2949), [pull request](https://github.com/ModelCloud/GPTQModel/pull/2950), [patch commit](https://github.com/ModelCloud/GPTQModel/commit/877c732f7d7dccd56a729844c6a5bd20f3aa8bb1), and release reference align; reachability depends on how deployments expose model-loading or inference inputs.
- Residual risk: model-serving stacks need provenance, version pinning, and runtime isolation for optimized kernels that process untrusted or externally supplied model artifacts.

## Authoritative Sources

- [September 7 topic collector source](../../../raw/processed/2026-09-07/ai-security-wiki-topic-news-collector-2026-09-07T233220Z.json)
- [CVE-2026-86288 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-86288)
- [GPTQModel issue 2949](https://github.com/ModelCloud/GPTQModel/issues/2949)
- [GPTQModel pull request 2950](https://github.com/ModelCloud/GPTQModel/pull/2950)
- [GPTQModel fix commit 877c732f7d7dccd56a729844c6a5bd20f3aa8bb1](https://github.com/ModelCloud/GPTQModel/commit/877c732f7d7dccd56a729844c6a5bd20f3aa8bb1)
- [GPTQModel v7.3.0 release](https://github.com/ModelCloud/GPTQModel/releases/tag/v7.3.0)
- [NVD CVE-2026-86288](https://nvd.nist.gov/vuln/detail/CVE-2026-86288)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [Hugging Face Transformers checkpoint shard file read](huggingface-transformers-checkpoint-shard-file-read.md)
- [ONNX external data symlink file write](onnx-external-data-symlink-file-write.md)

## Open Questions

- Which deployment paths expose GPTQModel's affected Triton kernel to untrusted model artifacts, tenant inputs, or remote inference requests?

## Maintenance Notes

- Created on 2026-09-07 from the September 7 topic collector as a model-runtime memory-safety advisory leaf.
