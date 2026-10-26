---
type: "Topic"
title: "vLLM Multimodal Media Resource Control"
description: "Navigation for focused vLLM media decoding, metadata, and frame-limit security leaves."
tags: ["model-and-prompt-security", "infrastructure-and-supply-chain"]
---

# vLLM Multimodal Media Resource Control

## Current Understanding

The [October 25 topic collector source](../../../raw/processed/2026-10-25/ai-security-wiki-topic-news-collector-2026-10-25T232906Z.json) records four independently changing vLLM media boundaries. This page is a router; it does not merge their affected ranges or remediation.

- [vLLM audio input decompression DoS](vllm-audio-input-decompression-dos.md) owns CVE-2026-116175, the 0.19.0-before-0.24.0 `AudioMediaIO` duration-limit bypass.
- [vLLM Nemotron image decompression DoS](vllm-nemotron-image-decompression-dos.md) owns CVE-2026-116177, the 0.10.2-before-0.25.0 global pixel-limit disablement.
- [vLLM multimodal metadata engine DoS](vllm-multimodal-metadata-engine-dos.md) owns CVE-2026-116178, the 0.20.0-before-0.30.0 placeholder and metadata consistency failure.
- [vLLM video frame-limit DoS](vllm-video-frame-limit-dos.md) owns CVE-2026-116179, the 0.18.0-before-0.31.0 `num_frames` cap bypass.

## Security Impact

- Threat: media-specific controls can be mistaken for one shared limit even though each processor accepts distinct hostile fields.
- Affected boundary: linked leaves own their individual processor, input, version, and fixed-release ranges.
- Exploit or incident status: public CVE disclosures; no local exploitation incident is recorded.
- Mitigation state: deploy the linked issue-specific fix and retain the focused regression tests.
- Confidence: high for the disclosed families; each leaf owns its precise evidence.
- Residual risk: new processors can bypass shared media controls unless they inherit and test the relevant limiter.

## Authoritative Sources

- [October 25 topic collector source](../../../raw/processed/2026-10-25/ai-security-wiki-topic-news-collector-2026-10-25T232906Z.json)
- [CVE-2026-116175](https://nvd.nist.gov/vuln/detail/CVE-2026-116175)
- [CVE-2026-116177](https://nvd.nist.gov/vuln/detail/CVE-2026-116177)
- [CVE-2026-116178](https://nvd.nist.gov/vuln/detail/CVE-2026-116178)
- [CVE-2026-116179](https://nvd.nist.gov/vuln/detail/CVE-2026-116179)

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
- [vLLM Nemotron image decompression DoS](vllm-nemotron-image-decompression-dos.md)
- [vLLM multimodal metadata engine DoS](vllm-multimodal-metadata-engine-dos.md)
- [vLLM video frame-limit DoS](vllm-video-frame-limit-dos.md)

## Open Questions

- Which enabled processors and media paths have issue-specific adversarial regression coverage?

## Maintenance Notes

- Created on 2026-10-25 and converted to a router after verification required independently maintained input and remediation leaves.
