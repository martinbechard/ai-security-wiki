---
type: "Topic"
title: "vLLM Prompt-Token Sampler State Corruption"
description: "Security analysis for CVE-2026-93841 vLLM prompt-token bounds failure corrupting sampler state."
tags: ["model-and-prompt-security", "infrastructure-and-supply-chain"]
---

# vLLM Prompt-Token Sampler State Corruption

## Current Understanding

The [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) records [CVE-2026-93841](https://cveawg.mitre.org/api/cve/CVE-2026-93841) for vLLM through 0.29.0. Broad vLLM serving-engine context belongs upstream; this page owns the local prompt-token bounds and repetition-penalty sampler-state boundary.

The CVE says prompt token IDs index the Triton `_bincount_kernel` prompt-presence bitset without checking against vocabulary size. Crafted multimodal audio requests can corrupt concurrent requests' sampler state and alter repetition-penalty behavior.

## Security Impact

- Threat: crafted prompt token IDs can corrupt shared sampler state and affect unrelated concurrent requests.
- Affected boundary: vLLM through 0.29.0, Triton `_bincount_kernel`, prompt-presence bitset, and repetition-penalty state.
- Exploit or incident status: public CVE; no local exploitation incident is recorded.
- Mitigation state: upgrade beyond the affected release boundary once confirmed, bounds-check prompt-token kernel inputs, and test sampler isolation under concurrent multimodal requests.
- Confidence: high for CVE publication after direct CVE Services re-fetch; medium for complete remediation boundary until upstream patch or release evidence is mapped.
- Residual risk: prompt parsing and GPU kernels become tenant-isolation boundaries when serving deployments multiplex requests.

## Authoritative Sources

- [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json)
- [CVE-2026-93841 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-93841)
- [vLLM repository](https://github.com/vllm-project/vllm)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [vLLM sampler state corruption](vllm-sampler-state-corruption.md)
- [vLLM allowed_token_ids logits corruption](vllm-allowed-token-ids-logits-corruption.md)

## Open Questions

- Which vLLM patch or release note confirms the fixed boundary for CVE-2026-93841?

## Maintenance Notes

- Created on 2026-09-19 from the [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) after verifier correction split the vLLM sampler-state family.
