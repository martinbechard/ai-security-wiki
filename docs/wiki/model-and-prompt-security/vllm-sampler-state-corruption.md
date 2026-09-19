---
type: "Topic"
title: "vLLM Sampler State Corruption"
description: "Security analysis for vLLM cross-request logits and prompt-token sampler-state corruption CVEs."
tags: ["model-and-prompt-security", "infrastructure-and-supply-chain"]
---

# vLLM Sampler State Corruption

## Current Understanding

The [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) records [CVE-2026-93840](https://cveawg.mitre.org/api/cve/CVE-2026-93840) and [CVE-2026-93841](https://cveawg.mitre.org/api/cve/CVE-2026-93841) for vLLM sampler-state corruption. Broad vLLM serving-engine context belongs upstream; this page owns the local cross-request model-serving isolation and output-constraint integrity boundary.

The family is split into focused leaves because the corruption mechanisms and remediation evidence can change independently:

- [vLLM allowed_token_ids logits corruption](vllm-allowed-token-ids-logits-corruption.md) owns CVE-2026-93840, where `allowed_token_ids` validation checks tokenizer length instead of model output logits width.
- [vLLM prompt-token sampler state corruption](vllm-prompt-token-sampler-state-corruption.md) owns CVE-2026-93841, where prompt token IDs index the Triton `_bincount_kernel` prompt-presence bitset without vocabulary-size bounds checking.

## Security Impact

- Threat: one request can corrupt shared sampler state and weaken another request's output constraints or repetition-penalty behavior; linked leaves own issue-specific detail.
- Affected boundary: vLLM before or through 0.29.0 depending on CVE; linked leaves own `allowed_token_ids`, `LogitBiasState`, Triton `_bincount_kernel`, and prompt-token bounds details.
- Exploit or incident status: public CVE records and upstream patch references; no local exploitation incident is recorded.
- Mitigation state: upgrade beyond the affected vLLM release boundary, validate token IDs against model output vocabulary width, bounds-check prompt-token kernel inputs, and regression-test concurrent request isolation.
- Confidence: high for CVE publication and affected components after direct CVE Services re-fetch; medium for exact exploit preconditions until upstream release notes and patch tests are reconciled.
- Residual risk: shared GPU sampler state is a tenant-isolation boundary, so output allowlists and penalties need adversarial tests under concurrency, not only single-request validation.

## Authoritative Sources

- [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json)
- [CVE-2026-93840 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-93840)
- [vLLM pull request 49080](https://github.com/vllm-project/vllm/pull/49080)
- [vLLM commit 5b0e5b69](https://github.com/vllm-project/vllm/commit/5b0e5b69ac1a3884a6479c9537789c95263cc804)
- [VulnCheck vLLM allowed-token advisory](https://www.vulncheck.com/advisories/vllm-before-0.29.0-cross-request-logits-corruption-via-allowed-token-ids)
- [CVE-2026-93841 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-93841)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [vLLM multimodal input boundary vulnerabilities](vllm-multimodal-input-boundary-vulnerabilities.md)
- [vLLM audio input decompression DoS](vllm-audio-input-decompression-dos.md)
- [vLLM video decoder VRAM exhaustion](vllm-video-decoder-vram-exhaustion.md)
- [vLLM allowed_token_ids logits corruption](vllm-allowed-token-ids-logits-corruption.md)
- [vLLM prompt-token sampler state corruption](vllm-prompt-token-sampler-state-corruption.md)

## Open Questions

- Which vLLM fixed release or release note names the complete remediation boundary for CVE-2026-93841?

## Maintenance Notes

- Created on 2026-09-19 from the [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json).
- Converted to a router on 2026-09-19 after verifier correction split the bundled sampler-state issues into focused leaves.
