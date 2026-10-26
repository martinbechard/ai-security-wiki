---
type: "Topic"
title: "vLLM Multimodal Metadata Engine DoS"
description: "Security analysis for CVE-2026-116178 inconsistent multimodal metadata crashing vLLM EngineCore."
tags: ["model-and-prompt-security", "agent-and-tool-security"]
---

# vLLM Multimodal Metadata Engine DoS

## Current Understanding

The [October 25 topic collector source](../../../raw/processed/2026-10-25/ai-security-wiki-topic-news-collector-2026-10-25T232906Z.json) records [CVE-2026-116178](https://nvd.nist.gov/vuln/detail/CVE-2026-116178): vLLM 0.20.0 before 0.30.0 accepts repeated or overlapping `mm_placeholders` ranges and mismatched `kwargs_data` or `mm_hashes` lists at the disaggregated `/inference/v1/generate` endpoint, yielding a negative text span and terminating EngineCore.

## Security Impact

- Threat: mutually inconsistent multimodal metadata crosses an inference protocol boundary without structural validation.
- Affected boundary: vLLM 0.20.0 before 0.30.0, disaggregated `/inference/v1/generate`, Qwen2.5-VL position construction, and EngineCore.
- Exploit or incident status: public CVE disclosure; no local incident is recorded.
- Mitigation state: upgrade to 0.30.0 or later and validate placeholder intervals and paired multimodal lists before position construction.
- Confidence: high for the documented crash path and fixed release.
- Residual risk: replayed valid-looking items can still form invalid combinations across independent request fields.

## Authoritative Sources

- [October 25 topic collector source](../../../raw/processed/2026-10-25/ai-security-wiki-topic-news-collector-2026-10-25T232906Z.json)
- [CVE-2026-116178](https://nvd.nist.gov/vuln/detail/CVE-2026-116178)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [vLLM multimodal media resource control](vllm-multimodal-media-resource-control.md)

## Open Questions

- Which disaggregated inference frontends validate placeholder intervals before forwarding to EngineCore?

## Maintenance Notes

- Created on 2026-10-25 from CVE-2026-116178 as a metadata-integrity boundary rather than a resource-exhaustion claim.
