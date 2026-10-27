---
type: "Topic"
title: "vLLM Pretokenized Prompt-ID Engine DoS"
description: "Security analysis for CVE-2026-115916 off-by-one prompt token validation causing a CUDA engine assertion."
tags: ["model-and-prompt-security"]
---

# vLLM Pretokenized Prompt-ID Engine DoS

## Current Understanding

The October 26 collector records [CVE-2026-115916](https://www.cve.org/CVERecord?id=CVE-2026-115916) in vLLM before 0.32.0. This page owns the pretokenized prompt-ID validation boundary.

## Security Impact

- Threat: a prompt ID equal to vocabulary size can pass validation and trigger a CUDA assertion that terminates the engine.
- Affected boundary: vLLM before 0.32.0 with tensor-parallel size one and a vocabulary size divisible by 64.
- Exploit or incident status: public advisory; no local exploitation evidence is recorded.
- Mitigation state: upgrade to [0.32.0](https://github.com/vllm-project/vllm/releases/tag/v0.32.0) and validate token IDs against an exclusive vocabulary upper bound before GPU dispatch.
- Confidence: high for the stated deployment condition and fix.
- Residual risk: model-facing numeric identifiers need server-side range validation even if they were produced by a tokenizer.

## Authoritative Sources

- [October 26 collector source](../../../raw/processed/2026-10-26/ai-security-wiki-topic-news-collector-2026-10-26T233009Z.json)
- [CVE-2026-115916](https://www.cve.org/CVERecord?id=CVE-2026-115916)
- [vLLM advisory](https://github.com/vllm-project/vllm/security/advisories/GHSA-q97c-p368-75c4)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [vLLM gRPC input validation DoS](vllm-grpc-input-validation-dos.md)

## Open Questions

- Which exposed APIs accept pretokenized prompt IDs in the affected deployment configuration?

## Maintenance Notes

- Created on 2026-10-26 as a distinct GPU input-validation boundary.
