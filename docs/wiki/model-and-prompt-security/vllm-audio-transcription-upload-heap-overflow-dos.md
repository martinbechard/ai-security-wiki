---
type: "Topic"
title: "vLLM Audio Transcription Upload Heap Overflow DoS"
description: "Security analysis for CVE-2026-109311, where vLLM audio transcription uploads can reach an FFmpeg IAMF heap overflow."
tags: ["model-and-prompt-security"]
---

# vLLM Audio Transcription Upload Heap Overflow DoS

## Current Understanding

The [October 12 topic collector source](../../../raw/processed/2026-10-12/ai-security-wiki-topic-news-collector-2026-10-12T233447Z.json) records [CVE-2026-109311](https://nvd.nist.gov/vuln/detail/CVE-2026-109311) for vLLM before 0.29.0. Broad vLLM serving-engine context belongs upstream; this page owns the multimodal parser exposure where uploaded audio reaches PyAV and FFmpeg before the API process remains available.

The CVE evidence says authenticated remote users can repeatedly upload malformed IAMF containers to `/v1/audio/transcriptions`. vLLM passes those uploads to the PyAV/FFmpeg `av.open()` fallback with only a file-size check, so malformed audio can corrupt the heap and crash the API process.

## Security Impact

- Threat: malformed audio uploads can deny service to shared model-serving APIs.
- Affected boundary: vLLM before 0.29.0, `/v1/audio/transcriptions`, PyAV/FFmpeg fallback parsing, and IAMF container handling.
- Exploit or incident status: public CVE, GitHub advisory, and VulnCheck evidence; no exploitation incident is recorded locally.
- Mitigation state: update to 0.29.0 or later and treat every uploaded media parser as hostile input beyond size checks.
- Confidence: high for affected range and endpoint from NVD-backed source evidence.
- Residual risk: model servers with optional media backends inherit native parser risk when upload validation is limited to file size or extension.

## Control Implications

- Run audio parsing with resource limits, crash isolation, and parser-format allowlists.
- Keep multimodal upload tests separate from text-only prompt-length or cache tests.
- Monitor authenticated API paths for repeated parser crashes because authentication does not make uploaded media trusted.

## Authoritative Sources

- [October 12 topic collector source](../../../raw/processed/2026-10-12/ai-security-wiki-topic-news-collector-2026-10-12T233447Z.json)
- [NVD CVE-2026-109311](https://nvd.nist.gov/vuln/detail/CVE-2026-109311)
- [GitHub advisory GHSA-m52c-39rh-f3gp](https://github.com/vllm-project/vllm/security/advisories/GHSA-m52c-39rh-f3gp)
- [VulnCheck vLLM IAMF advisory](https://www.vulncheck.com/advisories/vllm-before-0.29.0-heap-overflow-dos-via-iamf-audio-transcription-upload)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [vLLM multimodal input boundary vulnerabilities](vllm-multimodal-input-boundary-vulnerabilities.md)
- [vLLM audio input decompression DoS](vllm-audio-input-decompression-dos.md)
- [vLLM multimodal decoder prompt length DoS](vllm-multimodal-decoder-prompt-length-dos.md)

## Open Questions

- Which vLLM patch or regression test proves IAMF containers are blocked, sandboxed, or safely rejected before PyAV/FFmpeg can crash the API process?

## Maintenance Notes

- Created on 2026-10-13 from the October 12 topic collector as a parser-boundary availability leaf distinct from existing vLLM cache and prompt-length leaves.
