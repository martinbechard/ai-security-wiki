---
type: "Topic"
title: "sherpa-onnx Vocabulary-Metadata Buffer Overflow"
description: "Security analysis for CVE-2026-108954 malformed vocabulary metadata handling in sherpa-onnx."
tags: ["infrastructure-and-supply-chain"]
---

# sherpa-onnx Vocabulary-Metadata Buffer Overflow

## Current Understanding

[The October 14 collector](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json) records [CVE-2026-108954](https://nvd.nist.gov/vuln/detail/CVE-2026-108954) for sherpa-onnx through 1.13.8. Broad runtime context belongs upstream; this page owns malformed vocabulary metadata parsing at the model-loader boundary.

## Security Impact

- Threat: a malicious model package can trigger a vocabulary-metadata buffer overflow.
- Affected boundary: sherpa-onnx through 1.13.8 and vocabulary metadata parsing.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: a fixed version is not confirmed in the collector evidence.
- Confidence and residual risk: high for the NVD-described boundary; model packages remain native parser inputs.

## Control Implications

- Verify artifact provenance and parse untrusted models in constrained workers.
- Prioritize patch triage for model loaders exposed to remotely supplied artifacts.

## Authoritative Sources

- [October 14 topic collector source](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json)
- [NVD CVE-2026-108954](https://nvd.nist.gov/vuln/detail/CVE-2026-108954)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [GPTQModel Triton dequantization OOB read](gptqmodel-triton-dequantization-oob-read.md)

## Open Questions

- Which sherpa-onnx release remediates the vocabulary parser?

## Maintenance Notes

- Created on 2026-10-14 from the October 14 collector.
