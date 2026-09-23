---
type: "Topic"
title: "vLLM Mooncake KV Cache Exhaustion"
description: "Security analysis for CVE-2026-94627 vLLM Mooncake transfer ID collision and GPU KV cache exhaustion."
tags: ["model-and-prompt-security", "infrastructure-and-supply-chain"]
---

# vLLM Mooncake KV Cache Exhaustion

## Current Understanding

The [September 22 topic collector source](../../../raw/processed/2026-09-22/ai-security-wiki-topic-news-collector-2026-09-22T233219Z.json) records [CVE-2026-94627](https://cveawg.mitre.org/api/cve/CVE-2026-94627) for vLLM through 0.29.0. Broad vLLM serving-engine context belongs upstream; this page owns the local Mooncake KV-transfer GPU memory isolation boundary.

In prefill/decode disaggregated deployments, the Mooncake connector does not properly manage GPU KV cache block ownership when concurrent child requests share a transfer ID. Multi-prompt completion requests can leave orphaned KV cache blocks and exhaust GPU memory until restart.

## Security Impact

- Threat: attacker-shaped inference requests can consume GPU KV cache memory and make model-serving capacity unavailable.
- Affected boundary: vLLM 0.29.0 and earlier, Mooncake KV-transfer connector, transfer IDs, GPU KV cache ownership, and prefill/decode disaggregated serving.
- Exploit or incident status: public CVE, NVD, VulnCheck advisory, and upstream pull-request evidence; no local exploitation incident is recorded.
- Mitigation state: fixed-release status needs release-note confirmation; patched builds should prove transfer-ID isolation and orphan-block cleanup under concurrent child requests.
- Confidence: high for affected connector and GPU-memory exhaustion mechanism; medium for fixed release because the collected source references a pull request rather than a release tag.
- Residual risk: connector-specific cache ownership is a tenant and availability boundary in hosted LLM deployments.

## Authoritative Sources

- [September 22 topic collector source](../../../raw/processed/2026-09-22/ai-security-wiki-topic-news-collector-2026-09-22T233219Z.json)
- [CVE-2026-94627 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-94627)
- [NVD CVE-2026-94627](https://nvd.nist.gov/vuln/detail/CVE-2026-94627)
- [vLLM pull request 49796](https://github.com/vllm-project/vllm/pull/49796)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/vllm-through-0.29.0-gpu-kv-cache-leak-via-mooncake-transfer-id-collision)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [vLLM sampler state corruption](vllm-sampler-state-corruption.md)
- [vLLM NIXL prefix cache worker DoS](vllm-nixl-prefix-cache-worker-dos.md)

## Open Questions

- Which vLLM release first ships the CVE-2026-94627 Mooncake transfer-ID ownership fix?

## Maintenance Notes

- Created on 2026-09-23 from the [September 22 topic collector source](../../../raw/processed/2026-09-22/ai-security-wiki-topic-news-collector-2026-09-22T233219Z.json) as a connector-specific model-serving availability leaf.
