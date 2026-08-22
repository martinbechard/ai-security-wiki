---
type: "Topic"
title: "vLLM Derender Denial Of Service"
description: "Security analysis for CVE-2026-71486 authenticated derender denial of service in vLLM."
tags: ["model-and-prompt-security", "infrastructure-and-supply-chain"]
---

# vLLM Derender Denial Of Service

## Current Understanding

The [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) records [CVE-2026-71486](https://nvd.nist.gov/vuln/detail/CVE-2026-71486) for vLLM prior to 0.26.0. Broad vLLM runtime coverage belongs upstream; this page owns the local derender endpoint availability boundary.

[vLLM multimodal input boundary vulnerabilities](vllm-multimodal-input-boundary-vulnerabilities.md) routes the broader vLLM 0.26.0 vulnerability family. This leaf is narrower: authenticated denial of service occurs through caller-supplied `GenerateResponse` objects on derender endpoints before size limits apply.

The [August 21 leaf update watch source](../../../raw/processed/2026-08-21/ai-security-wiki-leaf-update-watch-20260822T000454Z.json) adds release-level evidence that CVE-2026-71486 is fixed in vLLM 0.26.0. The issue remains an availability leaf because it concerns CPU, memory, and oversized-response exhaustion before response limits apply.

## Security Impact

- Threat: authenticated callers can exhaust model-serving resources through derender payloads before size controls apply.
- Affected boundary: vLLM prior to 0.26.0; derender endpoints and `GenerateResponse` handling.
- Exploit or incident status: public NVD record; no local exploitation evidence is recorded.
- Mitigation state: update to vLLM 0.26.0 or later and apply size limits before expensive derender processing.
- Confidence: medium-high from collector NVD evidence.
- Residual risk: model-serving availability controls need endpoint-specific negative tests, not only shared request-size checks.

## Authoritative Sources

- [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json)
- [August 21 leaf update watch source](../../../raw/processed/2026-08-21/ai-security-wiki-leaf-update-watch-20260822T000454Z.json)
- [NVD CVE-2026-71486](https://nvd.nist.gov/vuln/detail/CVE-2026-71486)

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

- Which vLLM patch applies size limits before derender processing?

## Maintenance Notes

- Created on 2026-08-19 after verifier correction split the vLLM vulnerability family.
- Updated on 2026-08-21 from the [August 21 watcher](../../../raw/processed/2026-08-21/ai-security-wiki-leaf-update-watch-20260822T000454Z.json) with vLLM 0.26.0 fixed-release evidence.
