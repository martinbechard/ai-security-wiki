---
type: "Topic"
title: "vLLM Phi-4 Multimodal Audio Attention GPU DoS"
description: "Security analysis for CVE-2026-115913 quadratic GPU-memory exhaustion in Phi-4 multimodal audio processing."
tags: ["model-and-prompt-security"]
---

# vLLM Phi-4 Multimodal Audio Attention GPU DoS

## Current Understanding

The October 26 collector records [CVE-2026-115913](https://www.cve.org/CVERecord?id=CVE-2026-115913) in vLLM before 0.32.0. This page owns the Phi-4 multimodal audio encoder's attention-memory boundary.

## Security Impact

- Threat: one legal long audio clip makes eager attention retain full attention matrices and can terminate EngineCore for all users.
- Affected boundary: Phi-4 multimodal audio encoder in vLLM before 0.32.0.
- Exploit or incident status: public advisory; no local exploitation evidence is recorded.
- Mitigation state: upgrade to [0.32.0](https://github.com/vllm-project/vllm/releases/tag/v0.32.0), cap audio lengths, and reserve GPU memory for worst-case encoder attention.
- Confidence: high for the affected model path and fixed release.
- Residual risk: model-specific multimodal encoders can bypass generic request-size limits.

## Authoritative Sources

- [October 26 collector source](../../../raw/processed/2026-10-26/ai-security-wiki-topic-news-collector-2026-10-26T233009Z.json)
- [CVE-2026-115913](https://www.cve.org/CVERecord?id=CVE-2026-115913)
- [vLLM advisory](https://github.com/vllm-project/vllm/security/advisories/GHSA-8397-8qf6-f2gm)

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

- Which deployments expose Phi-4 multimodal audio inference to untrusted remote callers?

## Maintenance Notes

- Created on 2026-10-26 as a model-specific GPU resource boundary.
