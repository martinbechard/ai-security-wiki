---
type: "Topic"
title: "vLLM gRPC Input Validation DoS"
description: "Security analysis for CVE-2026-116172 through CVE-2026-116174 Rust gRPC validation failures in vLLM."
tags: ["model-and-prompt-security", "agent-and-tool-security"]
---

# vLLM gRPC Input Validation DoS

## Current Understanding

The [October 25 topic collector source](../../../raw/processed/2026-10-25/ai-security-wiki-topic-news-collector-2026-10-25T232906Z.json) groups [CVE-2026-116172](https://nvd.nist.gov/vuln/detail/CVE-2026-116172), [CVE-2026-116173](https://nvd.nist.gov/vuln/detail/CVE-2026-116173), and [CVE-2026-116174](https://nvd.nist.gov/vuln/detail/CVE-2026-116174): vLLM Rust gRPC requests can bypass token and candidate limits or submit out-of-vocabulary prompt IDs, terminating EngineCore. Broad vLLM coverage belongs upstream; this page owns the inference-protocol validation boundary.

## Security Impact

- Threat: hostile gRPC fields reach `torch.topk`, sampler, or embedding operations without range and cardinality validation.
- Affected boundary: vLLM 0.22.0 before 0.24.0 Rust `Generate` and `GenerateStream` inputs.
- Exploit or incident status: public CVE disclosures; no local incident is recorded.
- Mitigation state: upgrade to 0.24.0 or later and validate numeric ranges, candidate counts, and vocabulary membership before EngineCore execution.
- Confidence: high for the disclosed versions and crash impact.
- Residual risk: separately exposed HTTP, batch, and connector paths can accept different token-field encodings.

## Authoritative Sources

- [October 25 topic collector source](../../../raw/processed/2026-10-25/ai-security-wiki-topic-news-collector-2026-10-25T232906Z.json)
- [CVE-2026-116172](https://nvd.nist.gov/vuln/detail/CVE-2026-116172)
- [CVE-2026-116173](https://nvd.nist.gov/vuln/detail/CVE-2026-116173)
- [CVE-2026-116174](https://nvd.nist.gov/vuln/detail/CVE-2026-116174)

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

- Do deployment frontends reject these inputs before they reach Rust gRPC, and are crash-recovery probes present for EngineCore?

## Maintenance Notes

- Created on 2026-10-25 from the three closely coupled Rust gRPC CVEs; keep media and worker-boundary issues separate.
