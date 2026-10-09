---
type: "Topic"
title: "vLLM Harmony Tool Cache Salt Oracle"
description: "Security analysis for CVE-2026-105752 cache_salt loss in vLLM Harmony tool continuations."
tags: ["model-and-prompt-security", "data-and-privacy"]
---

# vLLM Harmony Tool Cache Salt Oracle

## Current Understanding

The [October 7 topic collector source](../../../raw/processed/2026-10-07/ai-security-wiki-topic-news-collector-2026-10-07T233304Z.json) records [CVE-2026-105752](https://cveawg.mitre.org/api/cve/CVE-2026-105752) for vLLM before 0.30.0. The [October 9 leaf update watch source](../../../raw/processed/2026-10-09/ai-security-wiki-leaf-update-watch-20261009T000340Z.json) corroborates the October 6 GitHub Advisory Database publication/review/update and points to PR 51818 and release 0.30.0 for patch reconciliation. Broad vLLM runtime and Responses API product context belongs upstream; this page owns the local prompt-runtime privacy boundary for salted prefix-cache isolation during Harmony tool continuations.

The CVE evidence says vLLM rebuilds Harmony tool-continuation inputs for `POST /v1/responses` without preserving `cache_salt`. With prefix caching enabled, an authenticated tenant that can reconstruct low-entropy post-tool history can use `cached_tokens_per_turn` as a membership oracle for whether a victim prefix was previously processed.

## Security Impact

- Threat: cross-tenant prefix-cache timing or token-count signals can disclose whether another tenant's prompt or tool-continuation prefix has been processed.
- Affected boundary: vLLM before 0.30.0, Harmony tool continuations, Responses API deployments, prefix caching, `cache_salt`, and `cached_tokens_per_turn` telemetry.
- Exploit or incident status: public CVE Services and GitHub advisory references; no local exploitation incident is recorded.
- Mitigation state: update to vLLM 0.30.0 or later and require cache-salt preservation across every rewritten tool-continuation path.
- Confidence: high for the affected component and fixed-version evidence from the collector; medium for exact telemetry preconditions until the GitHub advisory and patch are reconciled.
- Residual risk: prefix-cache isolation tests need tool-continuation coverage, not only direct prompt submission, because rewritten histories can silently drop tenant-isolation metadata.

## Authoritative Sources

- [October 7 topic collector source](../../../raw/processed/2026-10-07/ai-security-wiki-topic-news-collector-2026-10-07T233304Z.json)
- [October 9 leaf update watch source](../../../raw/processed/2026-10-09/ai-security-wiki-leaf-update-watch-20261009T000340Z.json)
- [CVE-2026-105752 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-105752)
- [GitHub advisory GHSA-935w-9g4m-p28p](https://github.com/advisories/GHSA-935w-9g4m-p28p)
- [vLLM pull request 50195](https://github.com/vllm-project/vllm/pull/50195)
- [vLLM pull request 51818](https://github.com/vllm-project/vllm/pull/51818)
- [vLLM 0.30.0 release](https://github.com/vllm-project/vllm/releases/tag/v0.30.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [vLLM NIXL Prefix Cache Worker DoS](vllm-nixl-prefix-cache-worker-dos.md)
- [vLLM Mooncake KV cache exhaustion](vllm-mooncake-kv-cache-exhaustion.md)
- [data and privacy](../data-and-privacy/index.md)

## Open Questions

- Which vLLM patch test proves `cache_salt` is preserved through every Harmony tool-continuation rebuild path?

## Maintenance Notes

- Created on 2026-10-08 from the [October 7 topic collector source](../../../raw/processed/2026-10-07/ai-security-wiki-topic-news-collector-2026-10-07T233304Z.json) as a distinct tenant prefix-cache privacy leaf.
- Updated on 2026-10-09 from the [October 9 leaf update watch source](../../../raw/processed/2026-10-09/ai-security-wiki-leaf-update-watch-20261009T000340Z.json) with duplicate GHSA/CVE provenance and no separate digest item.
