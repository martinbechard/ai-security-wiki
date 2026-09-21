---
type: "Topic"
title: "vLLM allowed_token_ids Logits Corruption"
description: "Security analysis for CVE-2026-93840 vLLM allowed_token_ids validation corrupting cross-request logits state."
tags: ["model-and-prompt-security", "infrastructure-and-supply-chain"]
---

# vLLM allowed_token_ids Logits Corruption

## Current Understanding

The [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json) adds disclosed vulnerability evidence dated 2026-09-18T19:06:06.001Z: CVE Services published a vLLM before 0.29.0 allowed_token_ids validation flaw that can corrupt GPU logits state across requests.

The [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) records [CVE-2026-93840](https://cveawg.mitre.org/api/cve/CVE-2026-93840) for vLLM before 0.29.0. Broad vLLM serving-engine context belongs upstream; this page owns the local output-allowlist validation and logits-state isolation boundary.

The CVE and [VulnCheck advisory](https://www.vulncheck.com/advisories/vllm-before-0.29.0-cross-request-logits-corruption-via-allowed-token-ids) say `allowed_token_ids` validates against tokenizer length rather than model output logits width. Crafted token IDs can pass validation, exceed the output vocabulary, corrupt GPU logits state, and let concurrent requests sample outside their allowlists.

## Security Impact

- Threat: one request can corrupt shared logits state and weaken another request's output allowlist.
- Affected boundary: vLLM before 0.29.0, `SamplingParams.allowed_token_ids`, model output vocabulary width, and `LogitBiasState`.
- Exploit or incident status: public CVE with upstream pull request and commit references; no local exploitation incident is recorded.
- Mitigation state: upgrade to 0.29.0 or later, validate token IDs against model output logits width, and regression-test concurrent allowlist isolation.
- Confidence: high for affected version, mechanism, and patch reference.
- Residual risk: output allowlists are security controls only if shared sampler state cannot be corrupted by another request.

## Authoritative Sources

- [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json)
- [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json)
- [CVE-2026-93840 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-93840)
- [vLLM pull request 49080](https://github.com/vllm-project/vllm/pull/49080)
- [vLLM commit 5b0e5b69](https://github.com/vllm-project/vllm/commit/5b0e5b69ac1a3884a6479c9537789c95263cc804)
- [VulnCheck vLLM allowed-token advisory](https://www.vulncheck.com/advisories/vllm-before-0.29.0-cross-request-logits-corruption-via-allowed-token-ids)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [vLLM sampler state corruption](vllm-sampler-state-corruption.md)
- [vLLM prompt-token sampler state corruption](vllm-prompt-token-sampler-state-corruption.md)

## Open Questions

- Which vLLM regression test demonstrates cross-request `allowed_token_ids` isolation after the fix?

## Maintenance Notes

- Updated on 2026-09-20 from the [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json) with in-window disclosed vulnerability evidence while preserving local security-boundary scope.
- Created on 2026-09-19 from the [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) after verifier correction split the vLLM sampler-state family.
