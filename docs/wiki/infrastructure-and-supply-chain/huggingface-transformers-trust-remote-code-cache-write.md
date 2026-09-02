---
type: "Topic"
title: "Hugging Face Transformers trust_remote_code Cache Write"
description: "Security analysis for CVE-2026-80047 custom generate code caching before trust_remote_code consent."
tags: ["infrastructure-and-supply-chain", "model-and-prompt-security"]
---

# Hugging Face Transformers trust_remote_code Cache Write

## Current Understanding

The [September 1 topic collector source](../../../raw/processed/2026-09-01/ai-security-wiki-topic-news-collector-2026-09-01T233307Z.json) records [CVE-2026-80047](https://nvd.nist.gov/vuln/detail/CVE-2026-80047) for Hugging Face Transformers. Broad Hugging Face and Transformers library context belongs upstream; this page owns the local model-loading consent and cache-persistence boundary.

NVD says Transformers versions 4.49.0 through 5.8.1 allow `GenerativePreTrainedModel.load_custom_generate()` to fetch and cache remote `custom_generate/generate.py` before the `trust_remote_code` consent check. Execution remains gated, but unauthorized code can persist under `~/.cache/huggingface/modules` and collide with later trusted loads.

## Security Impact

- Threat: model repository code can be persisted before a user grants remote-code trust.
- Affected boundary: Hugging Face Transformers 4.49.0 through 5.8.1; custom generate loading; Hugging Face module cache.
- Exploit or incident status: public NVD vulnerability record; no local exploitation evidence is recorded.
- Mitigation state: patched version not captured; use isolated caches for untrusted model evaluation and clean module caches after rejected trust prompts.
- Confidence: high for affected range and behavior from NVD; medium for fixed-version guidance until vendor release evidence is captured.
- Residual risk: consent gates that protect only execution may still leave persistent supply-chain artifacts behind.

## Control Implications

- Treat fetch, cache write, import, and execution as separate model-loading trust decisions.
- Use disposable runtime profiles or caches when evaluating untrusted model repositories.
- Add cache-integrity checks before later trusted remote-code loads.

## Authoritative Sources

- [September 1 topic collector source](../../../raw/processed/2026-09-01/ai-security-wiki-topic-news-collector-2026-09-01T233307Z.json)
- [NVD CVE-2026-80047](https://nvd.nist.gov/vuln/detail/CVE-2026-80047)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [Hugging Face Transformers checkpoint shard file read](huggingface-transformers-checkpoint-shard-file-read.md)
- [AI supply chain provenance credentialing](ai-supply-chain-provenance-credentialing.md)

## Open Questions

- Which Transformers release first prevents custom-generate cache writes before `trust_remote_code` consent?

## Maintenance Notes

- Created on 2026-09-01 from the [September 1 topic collector](../../../raw/processed/2026-09-01/ai-security-wiki-topic-news-collector-2026-09-01T233307Z.json) as a model-loading consent and cache-boundary leaf.
