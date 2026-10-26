---
type: "Topic"
title: "vLLM Video Frame-Limit DoS"
description: "Security analysis for CVE-2026-116179 request-controlled video frame decoding in vLLM."
tags: ["model-and-prompt-security", "infrastructure-and-supply-chain"]
---

# vLLM Video Frame-Limit DoS

## Current Understanding

The [October 25 topic collector source](../../../raw/processed/2026-10-25/ai-security-wiki-topic-news-collector-2026-10-25T232906Z.json) records [CVE-2026-116179](https://nvd.nist.gov/vuln/detail/CVE-2026-116179): vLLM 0.18.0 before 0.31.0 lets API clients set `num_frames=-1` through `media_io_kwargs`, bypassing the video or JPEG frame-count cap and exhausting memory in `VideoMediaIO.load_base64`.

## Security Impact

- Threat: a request-level media option disables a server-side frame budget.
- Affected boundary: vLLM 0.18.0 before 0.31.0, `media_io_kwargs`, `num_frames`, inline video, `VideoMediaIO.load_base64`, and API frontend memory.
- Exploit or incident status: public CVE disclosure; no local incident is recorded.
- Mitigation state: upgrade to 0.31.0 or later and prevent callers from overriding trusted frame caps.
- Confidence: high for the affected range and memory-exhaustion outcome.
- Residual risk: new media options can create equivalent limiter bypasses unless server policy owns their maximum values.

## Authoritative Sources

- [October 25 topic collector source](../../../raw/processed/2026-10-25/ai-security-wiki-topic-news-collector-2026-10-25T232906Z.json)
- [CVE-2026-116179](https://nvd.nist.gov/vuln/detail/CVE-2026-116179)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [vLLM multimodal media resource control](vllm-multimodal-media-resource-control.md)

## Open Questions

- Which public video and JPEG serving paths still permit request-controlled frame-count overrides?

## Maintenance Notes

- Created on 2026-10-25 from CVE-2026-116179 as a video option-authority boundary.
