---
type: "Topic"
title: "vLLM NIXL Prefix Cache Worker DoS"
description: "Security analysis for CVE-2026-94623 vLLM NIXL multi-prompt assertion failure in disaggregated serving."
tags: ["model-and-prompt-security", "infrastructure-and-supply-chain"]
---

# vLLM NIXL Prefix Cache Worker DoS

## Current Understanding

The [September 22 topic collector source](../../../raw/processed/2026-09-22/ai-security-wiki-topic-news-collector-2026-09-22T233219Z.json) records [CVE-2026-94623](https://cveawg.mitre.org/api/cve/CVE-2026-94623) for vLLM through 0.29.0. Broad vLLM serving-engine context belongs upstream; this page owns the local NIXL KV-transfer availability boundary.

In prefill/decode disaggregated deployments using NIXL prefix caching, vLLM does not validate block counts correctly for multi-prompt completion requests. Prompts with varying lengths can trigger an assertion failure in `NixlBaseConnectorWorker._apply_prefix_caching`, terminating the decode worker until restart.

## Security Impact

- Threat: attacker-shaped inference requests can crash decode workers without needing conventional traffic-volume overload.
- Affected boundary: vLLM 0.29.0 and earlier, NIXL KV-transfer connector, prefix caching, multi-prompt completion requests, and prefill/decode disaggregated serving.
- Exploit or incident status: public CVE, NVD, VulnCheck advisory, and upstream pull-request evidence; no local exploitation incident is recorded.
- Mitigation state: fixed-release status needs release-note confirmation; disable exposed vulnerable NIXL prefix-caching paths or gate them behind patched builds and request-shape regression tests.
- Confidence: high for affected component and worker-crash mechanism; medium for fixed release because the collected source references a pull request rather than a release tag.
- Residual risk: model-serving availability controls must test connector-specific request shapes, not only HTTP ingress rate limits.

## Authoritative Sources

- [September 22 topic collector source](../../../raw/processed/2026-09-22/ai-security-wiki-topic-news-collector-2026-09-22T233219Z.json)
- [CVE-2026-94623 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-94623)
- [NVD CVE-2026-94623](https://nvd.nist.gov/vuln/detail/CVE-2026-94623)
- [vLLM pull request 51505](https://github.com/vllm-project/vllm/pull/51505)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/vllm-through-0.29.0-denial-of-service-via-nixl-multi-prompt-assertion-failure)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [vLLM sampler state corruption](vllm-sampler-state-corruption.md)
- [vLLM Mooncake KV cache exhaustion](vllm-mooncake-kv-cache-exhaustion.md)

## Open Questions

- Which vLLM release first ships the CVE-2026-94623 NIXL block-count validation fix?

## Maintenance Notes

- Created on 2026-09-23 from the [September 22 topic collector source](../../../raw/processed/2026-09-22/ai-security-wiki-topic-news-collector-2026-09-22T233219Z.json) as a connector-specific model-serving availability leaf.
