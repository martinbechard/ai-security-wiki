---
type: "Topic"
title: "ONNX Untrusted-Model Shape-Inference DoS"
description: "Security analysis for CVE-2026-115919 through CVE-2026-115921 shape-inference failures on hostile ONNX models."
tags: ["infrastructure-and-supply-chain", "model-and-prompt-security"]
---

# ONNX Untrusted-Model Shape-Inference DoS

## Current Understanding

The October 26 collector records a closely coupled [ONNX](../../../upstream-ai-wiki/techniques/onnx.md) 1.22.0 advisory family: [CVE-2026-115919](https://www.cve.org/CVERecord?id=CVE-2026-115919) RNN/LSTM/GRU rank validation, [CVE-2026-115920](https://www.cve.org/CVERecord?id=CVE-2026-115920) ConvTranspose dimensions, and [CVE-2026-115921](https://www.cve.org/CVERecord?id=CVE-2026-115921) Scan `num_scan_inputs`. Broad ONNX context is upstream-owned; this page owns the hostile-model validation and runtime-isolation boundary.

## Security Impact

- Threat: malformed models can pass `onnx.checker.check_model()` but crash or disrupt `onnx.shape_inference.infer_shapes()`.
- Affected boundary: ONNX prior to 1.22.0 shape inference; individual lower bounds differ across the three CVEs.
- Exploit or incident status: public advisories; no local exploitation evidence is recorded.
- Mitigation state: upgrade to [ONNX 1.22.0](https://github.com/onnx/onnx/releases/tag/v1.22.0), isolate shape inference for untrusted models, and impose resource and crash containment.
- Confidence: high for the common fix and untrusted-model boundary.
- Residual risk: basic format checking is not a safety guarantee for model-processing code.

## Authoritative Sources

- [October 26 collector source](../../../raw/processed/2026-10-26/ai-security-wiki-topic-news-collector-2026-10-26T233009Z.json)
- [CVE-2026-115919](https://www.cve.org/CVERecord?id=CVE-2026-115919)
- [CVE-2026-115920](https://www.cve.org/CVERecord?id=CVE-2026-115920)
- [CVE-2026-115921](https://www.cve.org/CVERecord?id=CVE-2026-115921)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [ONNX external data symlink file write](onnx-external-data-symlink-file-write.md)

## Open Questions

- Which CI, conversion, or ingestion services run shape inference directly on untrusted models?

## Maintenance Notes

- Created on 2026-10-26 as one closely coupled release and boundary family.
