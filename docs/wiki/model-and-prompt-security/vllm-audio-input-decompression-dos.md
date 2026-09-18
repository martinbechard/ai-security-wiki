---
type: "Topic"
title: "vLLM Audio Input Decompression DoS"
description: "Security analysis for CVE-2026-57173 audio decompression-bomb denial of service in vLLM."
tags: ["model-and-prompt-security", "infrastructure-and-supply-chain"]
---

# vLLM Audio Input Decompression DoS

## Current Understanding

The [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) records CVE-2026-57173 for vLLM before 0.24.0. Broad vLLM runtime coverage belongs upstream; this page owns the local audio decode-duration and memory-allocation boundary.

The CVE says vLLM did not pass `VLLM_MAX_AUDIO_DECODE_DURATION_S` to the shared audio decoder for `/v1/chat/completions` `input_audio` handling. An unauthenticated client could submit small compressed audio that expands into a large float32 PCM allocation and crashes the worker.

## Security Impact

- Threat: compressed audio can bypass intended decode-duration limits and trigger worker memory exhaustion.
- Affected boundary: vLLM before 0.24.0, audio-capable model deployments, `/v1/chat/completions` `input_audio`, shared audio decoder, and worker memory allocation.
- Exploit or incident status: public CVE record; no local exploitation incident is recorded.
- Mitigation state: update to 0.24.0 or later and verify decode-duration limits reach every audio decoding path before allocation.
- Confidence: high for CVE publication and affected boundary.
- Residual risk: multimodal serving stacks need decompression-bomb tests even when API authentication limits reachability.

## Authoritative Sources

- [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json)
- [CVE-2026-57173 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-57173)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [vLLM multimodal input boundary vulnerabilities](vllm-multimodal-input-boundary-vulnerabilities.md)

## Open Questions

- Which vLLM audio-capable deployments enforce decode-duration limits before allocating decoded PCM buffers?

## Maintenance Notes

- Created on 2026-09-18 from the [September 17 topic collector](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) after verifier correction split vLLM audio and video availability issues into focused leaves.
