---
type: "Topic"
title: "vLLM Multimodal Processor Kwargs DoS"
description: "Security analysis for CVE-2026-114055 unbounded multimodal processor arguments."
tags: ["model-and-prompt-security"]
---

# vLLM Multimodal Processor Kwargs DoS

## Current Understanding

The [October 23 collector](../../../raw/processed/2026-10-23/ai-security-wiki-topic-news-collector-2026-10-23T233200Z.json) records [CVE-2026-114055](https://cveawg.mitre.org/api/cve/CVE-2026-114055) / [GHSA-gx7p-2j49-hfq4](https://github.com/vllm-project/vllm/security/advisories/GHSA-gx7p-2j49-hfq4): client `mm_processor_kwargs` reach image or video processor constructors and can exhaust memory. Broad vLLM context belongs upstream; this page owns processor-argument admission.

## Security Impact

- Threat: a remote caller forces out-of-memory termination through resource-sensitive preprocessing arguments.
- Affected boundary: vLLM >=0.7.3 and <0.31.0, multimodal processor kwargs, and shared inference availability.
- Exploit or incident status: maintainer advisory; API authentication is optional.
- Mitigation state: upgrade to 0.31.0, reject non-empty per-request kwargs by default, and enforce request and resource limits.
- Confidence: high for mechanism and fixed version.
- Residual risk: processor-specific admission controls may drift from global request policy.

## Authoritative Sources

- [October 23 collector](../../../raw/processed/2026-10-23/ai-security-wiki-topic-news-collector-2026-10-23T233200Z.json)
- [GHSA-gx7p-2j49-hfq4](https://github.com/vllm-project/vllm/security/advisories/GHSA-gx7p-2j49-hfq4)
- [vLLM 0.31.0](https://github.com/vllm-project/vllm/releases/tag/v0.31.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [vLLM forged UUID cache collision DoS](vllm-forged-uuid-cache-collision-dos.md)

## Open Questions

- Which deployed processors accept per-request kwargs?

## Maintenance Notes

- Created on 2026-10-23 as a processor-admission availability boundary.
