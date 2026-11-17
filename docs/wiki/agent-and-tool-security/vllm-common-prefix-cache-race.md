---
type: "Topic"
title: "vLLM Common-Prefix Cache Race"
description: "Security analysis for CVE-2026-129356 race conditions in vLLM common-prefix cache handling."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# vLLM Common-Prefix Cache Race

## Current Understanding

The [November 15 collector source](../../../raw/processed/2026-11-15/ai-security-wiki-topic-news-collector-2026-11-16T003018Z.json) records [CVE-2026-129356](https://nvd.nist.gov/vuln/detail/CVE-2026-129356) / [GHSA-fj8v-85jv-jwpv](https://github.com/advisories/GHSA-fj8v-85jv-jwpv) in vLLM 0.30.0 and 0.31.0. Broad vLLM background belongs upstream; this page owns the inference-runtime common-prefix cache concurrency and tenant-isolation boundary.

The [November 16 leaf-watch source](../../../raw/processed/2026-11-16/ai-security-wiki-leaf-update-watch-20261117T010644Z.json) records an in-window NVD metadata update without changing the affected range or 0.32.0 remediation boundary. The GHSA's reference to public exploit material is not confirmation of exploitation in the wild.

## Security Impact

- Threat: a remotely reachable, high-complexity race in the Common Prefix Handler can affect shared inference state.
- Affected boundary: vLLM 0.30.0 and 0.31.0, `single_type_kv_cache_manager.py`, the Common Prefix Handler, and deployments serving concurrent or mutually untrusted workloads.
- Exploit or incident status: the public GHSA states that exploit material is public; no local exploitation or incident is recorded.
- Mitigation state: upgrade to [vLLM 0.32.0](https://github.com/vllm-project/vllm/releases/tag/v0.32.0); the advisory identifies commit [`e687a25`](https://github.com/vllm-project/vllm/commit/e687a251bb056fa527846633f7a1b0a6c0f42374), whose release context removes cascade-attention and common-prefix plumbing.
- Confidence: medium because the public advisory is unreviewed, but the cited commit and release are available and align with removal of the affected implementation surface.
- Residual risk: version upgrades do not substitute for tenant partitioning and deployment review where cache state is shared across security principals.

## Authoritative Sources

- [November 15 collector source](../../../raw/processed/2026-11-15/ai-security-wiki-topic-news-collector-2026-11-16T003018Z.json)
- [November 16 leaf-watch source](../../../raw/processed/2026-11-16/ai-security-wiki-leaf-update-watch-20261117T010644Z.json)
- [CVE-2026-129356](https://nvd.nist.gov/vuln/detail/CVE-2026-129356)
- [GHSA-fj8v-85jv-jwpv](https://github.com/advisories/GHSA-fj8v-85jv-jwpv)
- [vLLM commit e687a25](https://github.com/vllm-project/vllm/commit/e687a251bb056fa527846633f7a1b0a6c0f42374)
- [vLLM 0.32.0 release](https://github.com/vllm-project/vllm/releases/tag/v0.32.0)

## Related Code

- [`single_type_kv_cache_manager.py` Common Prefix Handler](https://github.com/vllm-project/vllm/commit/e687a251bb056fa527846633f7a1b0a6c0f42374), removed with the cited cascade-attention and common-prefix plumbing change.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [vLLM worker egress and KV-cache exposure](vllm-worker-egress-kv-cache-exposure.md)
- [vLLM shared-memory pickle RCE](../infrastructure-and-supply-chain/vllm-shared-memory-pickle-rce.md)

## Open Questions

- Which vLLM deployment modes retain common-prefix cache state across mutually untrusted principals before the 0.32.0 upgrade?
- Does maintainer-authored vulnerability analysis provide a more specific exploitation precondition than the public GHSA?

## Maintenance Notes

- Created on 2026-11-15 from the November 15 collector source as a cache-concurrency boundary separate from vLLM worker egress and serialization findings.
- Updated on 2026-11-16 with the NVD metadata watch; no confirmed-exploitation claim is added.
