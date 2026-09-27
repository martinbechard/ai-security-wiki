---
type: "Topic"
title: "vLLM Multimodal Decoder Prompt Length DoS"
description: "Security analysis for CVE-2026-100651, where vLLM disaggregated multimodal serving skipped decoder prompt-length validation."
tags: ["model-and-prompt-security", "infrastructure-and-supply-chain"]
---

# vLLM Multimodal Decoder Prompt Length DoS

## Current Understanding

The [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) records [CVE-2026-100651](https://nvd.nist.gov/vuln/detail/CVE-2026-100651) for vLLM before 0.29.0. Broad vLLM runtime context belongs upstream; this page owns the local disaggregated-serving prompt-length validation boundary.

The `/inference/v1/generate` endpoint failed to enforce decoder prompt-length validation when multimodal features were supplied. For processors such as Nemotron Parse, Whisper, and FireRedLID that skip prompt-length checks, an overlong `token_ids` list could reach a fixed `max_model_len`-wide worker buffer and crash the worker.

## Security Impact

- Threat: malformed multimodal requests can crash inference workers and degrade model-serving availability.
- Affected boundary: vLLM before 0.29.0, disaggregated serving, `/inference/v1/generate`, multimodal processors, decoder prompt-length validation, and fixed worker buffers.
- Exploit or incident status: disclosed CVE; no confirmed exploitation is recorded in the collector.
- Mitigation state: update to vLLM 0.29.0 or later and enforce prompt-length checks consistently across text-only, multimodal, prefill, and decoder paths.
- Confidence: medium-high from NVD-backed collector evidence; primary vLLM advisory or release note should be checked for exact patch details.
- Residual risk: model-serving release gates need path coverage tests for every processor that can bypass shared request validation.

## Authoritative Sources

- [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json)
- [NVD CVE-2026-100651](https://nvd.nist.gov/vuln/detail/CVE-2026-100651)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [vLLM multimodal input boundary vulnerabilities](vllm-multimodal-input-boundary-vulnerabilities.md)
- [vLLM NIXL prefix cache worker DoS](vllm-nixl-prefix-cache-worker-dos.md)

## Open Questions

- Which vLLM patch or release note identifies the exact decoder prompt-length validation fix for CVE-2026-100651?

## Maintenance Notes

- Created on 2026-09-27 from the [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) as a distinct multimodal disaggregated-serving availability boundary.
