---
type: "Topic"
title: "vLLM Connector-Cache Logprob Tenant DoS"
description: "Security analysis for CVE-2026-116180 connector-cache logprob handling that can terminate co-tenant vLLM requests."
tags: ["model-and-prompt-security", "identity-and-access"]
---

# vLLM Connector-Cache Logprob Tenant DoS

## Current Understanding

The [October 25 topic collector source](../../../raw/processed/2026-10-25/ai-security-wiki-topic-news-collector-2026-10-25T232906Z.json) records [CVE-2026-116180](https://nvd.nist.gov/vuln/detail/CVE-2026-116180): before 0.31.0, a client sharing an engine can request prompt logprobs or echo on a connector-cached prefix, causing uninitialized prompt positions to reach tokenizer decoding and crash EngineCore. This page owns the connector-cache tenant-isolation and availability boundary.

## Security Impact

- Threat: one client can select a cache state that causes engine-wide failure and drops co-tenant requests.
- Affected boundary: vLLM 0.8.5 before 0.31.0, V1 `LogprobsTensors.empty_cpu`, KV connector-cached prefixes, and prompt-logprob or echo requests.
- Exploit or incident status: public CVE disclosure; no local incident is recorded.
- Mitigation state: upgrade to 0.31.0 or later and ensure computed prompt positions are initialized before logprob decoding.
- Confidence: high for the cross-tenant denial-of-service path.
- Residual risk: other cache-hit paths can have separate output-state initialization assumptions.

## Authoritative Sources

- [October 25 topic collector source](../../../raw/processed/2026-10-25/ai-security-wiki-topic-news-collector-2026-10-25T232906Z.json)
- [CVE-2026-116180](https://nvd.nist.gov/vuln/detail/CVE-2026-116180)
- [vLLM GHSA-rhcx-5729-88vg](https://github.com/vllm-project/vllm/security/advisories/GHSA-rhcx-5729-88vg)

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

- Which connector configurations share EngineCore across tenants, and what monitoring detects cache-hit logprob crashes before requests are lost?

## Maintenance Notes

- Created on 2026-10-25 from CVE-2026-116180 as a distinct connector-cache isolation boundary.
