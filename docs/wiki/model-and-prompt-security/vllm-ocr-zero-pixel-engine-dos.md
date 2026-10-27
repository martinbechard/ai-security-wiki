---
type: "Topic"
title: "vLLM OCR Zero-Pixel Engine DoS"
description: "Security analysis for CVE-2026-115914 fatal vLLM OCR engine assertion from a legal zero-pixel image."
tags: ["model-and-prompt-security"]
---

# vLLM OCR Zero-Pixel Engine DoS

## Current Understanding

The October 26 collector records [CVE-2026-115914](https://www.cve.org/CVERecord?id=CVE-2026-115914) in vLLM 0.11.1 through before 0.32.0. This page owns DeepSeek-OCR, DeepSeek-OCR-2, and Unlimited-OCR image-validation behavior.

## Security Impact

- Threat: a legal image whose normalized pixels sum to zero can propagate a missing embedding into a fatal engine assertion.
- Affected boundary: DeepSeek OCR image path before 0.32.0, when the image is alone in its encoder batch.
- Exploit or incident status: public advisory; no local exploitation evidence is recorded.
- Mitigation state: upgrade to [0.32.0](https://github.com/vllm-project/vllm/releases/tag/v0.32.0) and reject invalid encoder outputs before engine-wide assertions.
- Confidence: high for the affected models and release boundary.
- Residual risk: assertions on user-reachable multimodal paths turn validation faults into tenant-wide availability failures.

## Authoritative Sources

- [October 26 collector source](../../../raw/processed/2026-10-26/ai-security-wiki-topic-news-collector-2026-10-26T233009Z.json)
- [CVE-2026-115914](https://www.cve.org/CVERecord?id=CVE-2026-115914)
- [vLLM advisory](https://github.com/vllm-project/vllm/security/advisories/GHSA-gq5q-89c7-vhvx)

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

- Are all OCR model image inputs checked for an embedding before engine dispatch?

## Maintenance Notes

- Created on 2026-10-26 as an OCR-model availability boundary.
