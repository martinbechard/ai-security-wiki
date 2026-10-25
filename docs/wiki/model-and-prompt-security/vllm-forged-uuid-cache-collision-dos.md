---
type: "Topic"
title: "vLLM Forged UUID Cache Collision DoS"
description: "Security analysis for CVE-2026-114050 forged multimodal UUID cache identities."
tags: ["model-and-prompt-security"]
---

# vLLM Forged UUID Cache Collision DoS

## Current Understanding

The [October 23 collector](../../../raw/processed/2026-10-23/ai-security-wiki-topic-news-collector-2026-10-23T233200Z.json) records [CVE-2026-114050](https://cveawg.mitre.org/api/cve/CVE-2026-114050) / [GHSA-p92p-rxj5-7p2x](https://github.com/vllm-project/vllm/security/advisories/GHSA-p92p-rxj5-7p2x): client multimodal UUIDs are trusted as cache identities while frontend and engine caches can diverge, allowing an unauthenticated request to crash the engine.

## Security Impact

- Threat: forged cache identities substitute stale incompatible tensors and terminate shared inference service.
- Affected boundary: vLLM before 0.31.0, client UUID cache identities, frontend/engine cache synchronization, and multimodal availability.
- Exploit or incident status: maintainer advisory; API authentication is optional.
- Mitigation state: upgrade to 0.31.0, bind identities to content, and validate receiver-cache hits against request layout.
- Confidence: high for mechanism and fixed version.
- Residual risk: cache correctness must be tested under malicious identity reuse.

## Authoritative Sources

- [October 23 collector](../../../raw/processed/2026-10-23/ai-security-wiki-topic-news-collector-2026-10-23T233200Z.json)
- [October 24 leaf watch](../../../raw/processed/2026-10-24/ai-security-wiki-leaf-update-watch-20261025T000016Z.json)
- [GHSA-p92p-rxj5-7p2x](https://github.com/vllm-project/vllm/security/advisories/GHSA-p92p-rxj5-7p2x)
- [vLLM 0.31.0](https://github.com/vllm-project/vllm/releases/tag/v0.31.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [vLLM multimodal processor kwargs DoS](vllm-mm-processor-kwargs-dos.md)
- [vLLM multimodal cache desync DoS](vllm-multimodal-cache-desync-dos.md)

## Open Questions

- Which cache tests cover forged UUID reuse across frontend and engine boundaries?

## Maintenance Notes

- Updated on 2026-10-24 from the [October 24 leaf watch](../../../raw/processed/2026-10-24/ai-security-wiki-leaf-update-watch-20261025T000016Z.json), which corroborated the existing boundary without changing current understanding or adding a duplicate digest item.
- Created on 2026-10-23 as a cache-identity availability boundary.
