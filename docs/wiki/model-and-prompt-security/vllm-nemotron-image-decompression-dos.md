---
type: "Topic"
title: "vLLM Nemotron Image Decompression DoS"
description: "Security analysis for CVE-2026-116177 image decompression-bomb handling in vLLM Nemotron-VL processors."
tags: ["model-and-prompt-security", "infrastructure-and-supply-chain"]
---

# vLLM Nemotron Image Decompression DoS

## Current Understanding

The [October 25 topic collector source](../../../raw/processed/2026-10-25/ai-security-wiki-topic-news-collector-2026-10-25T232906Z.json) records [CVE-2026-116177](https://nvd.nist.gov/vuln/detail/CVE-2026-116177): vLLM 0.10.2 before 0.25.0 globally sets `Image.MAX_IMAGE_PIXELS` to `None` in Nemotron-VL processors, letting an unauthenticated caller submit a pathological image that exhausts worker memory.

## Security Impact

- Threat: global decoder configuration disables image decompression-bomb protection.
- Affected boundary: vLLM 0.10.2 before 0.25.0, Nemotron-VL image processors, `/v1/chat/completions`, and worker memory.
- Exploit or incident status: public CVE disclosure; no local incident is recorded.
- Mitigation state: upgrade to 0.25.0 or later and enforce per-request decoded-pixel budgets without global limiter disablement.
- Confidence: high for the affected range and worker availability impact.
- Residual risk: other processor-specific image initialization can change a process-wide decoder limit.

## Authoritative Sources

- [October 25 topic collector source](../../../raw/processed/2026-10-25/ai-security-wiki-topic-news-collector-2026-10-25T232906Z.json)
- [CVE-2026-116177](https://nvd.nist.gov/vuln/detail/CVE-2026-116177)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [vLLM multimodal media resource control](vllm-multimodal-media-resource-control.md)

## Open Questions

- Which enabled vLLM model processors can alter image decoder limits globally?

## Maintenance Notes

- Created on 2026-10-25 from CVE-2026-116177 as the Nemotron-VL-specific image control boundary.
