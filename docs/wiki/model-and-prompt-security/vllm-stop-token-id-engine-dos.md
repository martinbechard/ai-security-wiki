---
type: "Topic"
title: "vLLM Stop-Token ID Engine DoS"
description: "Security analysis for CVE-2026-116181 out-of-vocabulary stop-token IDs crashing vLLM."
tags: ["model-and-prompt-security", "agent-and-tool-security"]
---

# vLLM Stop-Token ID Engine DoS

## Current Understanding

The [October 25 topic collector source](../../../raw/processed/2026-10-25/ai-security-wiki-topic-news-collector-2026-10-25T232906Z.json) records [CVE-2026-116181](https://nvd.nist.gov/vuln/detail/CVE-2026-116181): before 0.29.0, out-of-vocabulary `stop_token_ids` can terminate vLLM's engine or write outside the V2 runner logits buffer. This is separate from Rust gRPC request validation because OpenAI chat, completion, generate, and batch interfaces can independently carry the unsafe stop-token field.

## Security Impact

- Threat: a caller selects token IDs outside the serving model's vocabulary.
- Affected boundary: vLLM 0.20.1 before 0.29.0, `stop_token_ids`, OpenAI-compatible and generate/batch request paths, EngineCore, and V2 runner logits buffer.
- Exploit or incident status: public CVE disclosure; no local incident is recorded.
- Mitigation state: upgrade to 0.29.0 or later and validate every stop-token ID against the active model vocabulary before inference dispatch.
- Confidence: high for the disclosed version range and crash impact.
- Residual risk: each request schema can expose a distinct token-list validation path.

## Authoritative Sources

- [October 25 topic collector source](../../../raw/processed/2026-10-25/ai-security-wiki-topic-news-collector-2026-10-25T232906Z.json)
- [CVE-2026-116181](https://nvd.nist.gov/vuln/detail/CVE-2026-116181)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [vLLM gRPC input validation DoS](vllm-grpc-input-validation-dos.md)
- [vLLM prompt-token sampler state corruption](vllm-prompt-token-sampler-state-corruption.md)

## Open Questions

- Do deployed HTTP and batch frontends normalize stop-token IDs before dispatch, and are invalid-ID failures isolated from concurrent requests?

## Maintenance Notes

- Created on 2026-10-25 from CVE-2026-116181 as a separate protocol-surface validation boundary.
