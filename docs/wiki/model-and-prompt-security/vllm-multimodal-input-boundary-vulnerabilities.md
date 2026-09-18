---
type: "Topic"
title: "vLLM Multimodal Input Boundary Vulnerabilities"
description: "Security analysis for vLLM 0.26.0 fixes around derender DoS and multimodal SSRF or local file read."
tags: ["model-and-prompt-security", "infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# vLLM Multimodal Input Boundary Vulnerabilities

## Current Understanding

The [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) records two vLLM issues fixed before 0.26.0. Broad vLLM runtime coverage belongs upstream; this page owns the local model-serving input-boundary risk for multimodal processors and derender endpoints.

The family is split into focused leaves because availability and media-fetch boundaries can change independently:

- [vLLM derender denial of service](vllm-derender-denial-of-service.md) owns CVE-2026-71486, authenticated denial of service through caller-supplied `GenerateResponse` objects on derender endpoints before size limits apply.
- [vLLM multimodal media SSRF file read](vllm-multimodal-media-ssrf-file-read.md) owns CVE-2026-73560, SSRF and local file read in `MiMoV2OmniMultiModalProcessor` when attacker-controlled image and audio strings bypass `MediaConnector` protections.

The [August 21 leaf update watch source](../../../raw/processed/2026-08-21/ai-security-wiki-leaf-update-watch-20260822T000454Z.json) keeps these two CVEs as one closely coupled vLLM 0.26.0 security family while preserving the child-leaf split for the independently changing denial-of-service and media fetch/file-read controls.

The [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) adds two newer vLLM media availability CVEs. The family now has two more focused leaves because audio decode limits and video decoder memory accounting can change independently:

- [vLLM audio input decompression DoS](vllm-audio-input-decompression-dos.md) owns CVE-2026-57173, where audio input handling before 0.24.0 failed to pass decode-duration limits into shared decoding.
- [vLLM video decoder VRAM exhaustion](vllm-video-decoder-vram-exhaustion.md) owns CVE-2026-69147, where request-selected PyNvVideoCodec paths before 0.28.0 could bypass GPU-memory reservations.

## Security Impact

- Threat: model-serving endpoints can treat multimodal references, generated response objects, compressed media, or request-selected decoder backends as trusted enough to bypass size, network, local-file, CPU, memory, or VRAM controls; linked leaves own issue-specific details.
- Affected boundary: vLLM prior to 0.24.0 for audio decode-duration propagation, prior to 0.26.0 for derender and media fetch/file controls, and prior to 0.28.0 for request-selected video decoder memory budgeting.
- Exploit or incident status: public NVD records; no local exploitation evidence is recorded.
- Mitigation state: update to the fixed release for each media path, verify all multimodal processors use shared media validation and decoder limits, and account GPU decoder allocations before accepting request-selected video backends.
- Confidence: medium-high from NVD and secondary CVE evidence; high for the September 17 CVE Services records.
- Residual risk: processor-specific media paths can drift from shared connector protections unless release gates include negative SSRF, local-file, decompression-bomb, and GPU-memory exhaustion tests.

## Authoritative Sources

- [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json)
- [August 21 leaf update watch source](../../../raw/processed/2026-08-21/ai-security-wiki-leaf-update-watch-20260822T000454Z.json)
- [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json)
- [NVD CVE-2026-71486](https://nvd.nist.gov/vuln/detail/CVE-2026-71486)
- [NVD CVE-2026-73560](https://nvd.nist.gov/vuln/detail/CVE-2026-73560)
- [Strix CVE-2026-73560 mirror](https://www.strix.ai/cve/CVE-2026-73560)
- [CVE-2026-57173 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-57173)
- [CVE-2026-69147 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-69147)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [agent network egress controls](../agent-and-tool-security/agent-network-egress-controls.md)
- [agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)
- [vLLM derender denial of service](vllm-derender-denial-of-service.md)
- [vLLM multimodal media SSRF file read](vllm-multimodal-media-ssrf-file-read.md)
- [vLLM audio input decompression DoS](vllm-audio-input-decompression-dos.md)
- [vLLM video decoder VRAM exhaustion](vllm-video-decoder-vram-exhaustion.md)

## Open Questions

- Which vLLM release notes or patches identify the exact fixed commits for CVE-2026-71486 and CVE-2026-73560?
- Which vLLM deployment profiles have audio-capable models, PyNvVideoCodec installed, or request-selected decoder backends enabled?

## Maintenance Notes

- Created on 2026-08-19 from the [August 18 topic collector](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) as a vLLM 0.26.0 model-serving input-boundary router.
- Split on 2026-08-19 after verifier correction into separate derender DoS and multimodal media SSRF/file-read leaves.
- Updated on 2026-08-21 from the [August 21 watcher](../../../raw/processed/2026-08-21/ai-security-wiki-leaf-update-watch-20260822T000454Z.json) with vLLM 0.26.0 family-level CVE publication evidence.
- Updated on 2026-09-18 from the [September 17 topic collector](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) with audio decompression-bomb and video decoder GPU-memory exhaustion evidence.
