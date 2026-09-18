---
type: "Topic"
title: "vLLM Video Decoder VRAM Exhaustion"
description: "Security analysis for CVE-2026-69147 request-selected video decoder GPU memory exhaustion in vLLM."
tags: ["model-and-prompt-security", "infrastructure-and-supply-chain"]
---

# vLLM Video Decoder VRAM Exhaustion

## Current Understanding

The [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) records CVE-2026-69147 for vLLM before 0.28.0. Broad vLLM and GPU-serving context belongs upstream; this page owns the local request-selected video backend and VRAM-reservation boundary.

The CVE says Chat Completions and Responses request bodies could select PyNvVideoCodec even when startup selected software decoding. Request-selected CUDA decoder allocations were not budgeted out of KV-cache memory, enabling GPU memory exhaustion and worker crashes on video-capable deployments.

## Security Impact

- Threat: request-selected video decoder backends can bypass startup memory budgeting and exhaust GPU memory.
- Affected boundary: vLLM before 0.28.0, video-capable GPU deployments, PyNvVideoCodec, CUDA decoder allocations, KV-cache budgeting, Chat Completions, and Responses request bodies.
- Exploit or incident status: public CVE record; no local exploitation incident is recorded.
- Mitigation state: update to 0.28.0 or later and account decoder allocations before accepting request-selected video backends.
- Confidence: high for CVE publication and affected boundary.
- Residual risk: serving startup configuration is insufficient when request bodies can select alternate media backends.

## Authoritative Sources

- [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json)
- [CVE-2026-69147 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-69147)

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

- Which deployments have PyNvVideoCodec installed even when software decoding is configured at startup?

## Maintenance Notes

- Created on 2026-09-18 from the [September 17 topic collector](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) after verifier correction split vLLM audio and video availability issues into focused leaves.
