---
type: "Topic"
title: "vLLM Multimodal Cache Desync DoS"
description: "Security analysis for CVE-2026-105753 mirrored multimodal cache desynchronization in vLLM."
tags: ["model-and-prompt-security", "infrastructure-and-supply-chain"]
---

# vLLM Multimodal Cache Desync DoS

## Current Understanding

The [October 7 topic collector source](../../../raw/processed/2026-10-07/ai-security-wiki-topic-news-collector-2026-10-07T233304Z.json) records [CVE-2026-105753](https://cveawg.mitre.org/api/cve/CVE-2026-105753) for vLLM before 0.28.0. Broad vLLM runtime context belongs upstream; this page owns the local multimodal cache consistency and shared-service availability boundary.

The CVE evidence says a multimodal request can commit a media hash into the frontend sender cache during rendering before engine admission. If the request is rejected, the receiver cache does not receive the payload. A later request reusing the same media hash can then hit the sender cache, miss the receiver payload, trigger a receiver-cache assertion, and degrade shared inference-service availability.

## Security Impact

- Threat: malformed or rejected multimodal requests can poison mirrored cache state and crash later requests from unrelated users or tenants.
- Affected boundary: vLLM before 0.28.0, `MultiModalProcessorSenderCache`, `MultiModalReceiverCache`, frontend-to-engine admission, multimodal LRU cache consistency, and shared model-serving availability.
- Exploit or incident status: public CVE Services and GitHub advisory references; no local exploitation incident is recorded.
- Mitigation state: update to vLLM 0.28.0 or later and ensure sender-cache commits and receiver-cache payload availability stay atomic across rejected multimodal requests.
- Confidence: high for the affected component and fixed-version evidence from the collector; medium for exact assertion path until the linked patch is reconciled.
- Residual risk: multimodal-serving availability tests need rejected-request and cache-reuse cases, not only successful media ingestion.

## Authoritative Sources

- [October 7 topic collector source](../../../raw/processed/2026-10-07/ai-security-wiki-topic-news-collector-2026-10-07T233304Z.json)
- [CVE-2026-105753 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-105753)
- [GitHub advisory GHSA-ph3r-5jfg-f84f](https://github.com/advisories/GHSA-ph3r-5jfg-f84f)
- [vLLM pull request 46747](https://github.com/vllm-project/vllm/pull/46747)
- [vLLM pull request 51897](https://github.com/vllm-project/vllm/pull/51897)
- [vLLM 0.28.0 release](https://github.com/vllm-project/vllm/releases/tag/v0.28.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [vLLM multimodal input boundary vulnerabilities](vllm-multimodal-input-boundary-vulnerabilities.md)
- [vLLM multimodal decoder prompt length DoS](vllm-multimodal-decoder-prompt-length-dos.md)
- [vLLM multimodal media SSRF file read](vllm-multimodal-media-ssrf-file-read.md)

## Open Questions

- Which vLLM patch or regression test proves sender and receiver multimodal caches cannot desynchronize after rejected requests?

## Maintenance Notes

- Created on 2026-10-08 from the [October 7 topic collector source](../../../raw/processed/2026-10-07/ai-security-wiki-topic-news-collector-2026-10-07T233304Z.json) as a distinct multimodal cache-availability boundary.
