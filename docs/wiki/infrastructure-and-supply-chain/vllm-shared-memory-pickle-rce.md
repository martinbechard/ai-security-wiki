---
type: "Topic"
title: "vLLM Shared-Memory Pickle RCE"
description: "Security analysis for CVE-2026-115912 forged shared-memory metadata reaching pickle deserialization in vLLM."
tags: ["infrastructure-and-supply-chain"]
---

# vLLM Shared-Memory Pickle RCE

## Current Understanding

The October 26 collector records [CVE-2026-115912](https://www.cve.org/CVERecord?id=CVE-2026-115912) in vLLM before 0.32.0. This page owns the scale-out shared-memory multimodal cache serialization boundary, separate from ordinary multimodal availability controls.

## Security Impact

- Threat: an authenticated caller can forge public multimodal `kwargs_data` shared-memory address and `monotonic_id` metadata so workers pass attacker-selected bytes to `pickle.loads()`.
- Affected boundary: vLLM scale-out deployments with shared-memory multimodal caching enabled before 0.32.0.
- Exploit or incident status: public advisory; no local exploitation evidence is recorded.
- Mitigation state: upgrade to [0.32.0](https://github.com/vllm-project/vllm/releases/tag/v0.32.0), disable or isolate the affected cache until upgraded, and never deserialize client-controlled cache metadata.
- Confidence: high for the deployment condition and remediation release.
- Residual risk: internal shared-memory channels are attacker-controlled when public request fields can name or address their contents.

## Authoritative Sources

- [October 26 collector source](../../../raw/processed/2026-10-26/ai-security-wiki-topic-news-collector-2026-10-26T233009Z.json)
- [CVE-2026-115912](https://www.cve.org/CVERecord?id=CVE-2026-115912)
- [vLLM advisory](https://github.com/vllm-project/vllm/security/advisories/GHSA-6757-hggm-hp2w)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [vLLM worker egress and KV-cache exposure](../agent-and-tool-security/vllm-worker-egress-kv-cache-exposure.md)

## Open Questions

- Which vLLM scale-out deployments enable shared-memory multimodal caching?

## Maintenance Notes

- Created on 2026-10-26 as a serialization and RCE boundary.
