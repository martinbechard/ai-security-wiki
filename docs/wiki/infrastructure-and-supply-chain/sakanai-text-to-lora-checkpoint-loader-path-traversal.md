---
type: "Topic"
title: "SakanaAI text-to-LoRA Checkpoint-Loader Path Traversal"
description: "Security analysis for CVE-2026-126996 attacker-controlled checkpoint-loader paths in text-to-LoRA."
tags: ["infrastructure-and-supply-chain", "model-security"]
---

# SakanaAI text-to-LoRA Checkpoint-Loader Path Traversal

## Current Understanding

The [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json) records [CVE-2026-126996](https://nvd.nist.gov/vuln/detail/CVE-2026-126996) for text-to-LoRA 0.0.1. An attacker-controlled `base_model_name_or_path` reaches `get_tokenizer` during checkpoint loading and permits path traversal. Broad SakanaAI coverage belongs upstream; this leaf owns the model-artifact namespace boundary.

## Security Impact

- Threat: checkpoint metadata selects paths outside the intended model-artifact namespace.
- Affected boundary: text-to-LoRA 0.0.1 checkpoint loading through `base_model_name_or_path`.
- Exploit or incident status: NVD records a public proof-of-concept reference; no local incident is identified.
- Mitigation state: constrain checkpoint and tokenizer resolution to canonicalized allowlisted roots, and verify a maintainer patch before relying on a version upgrade.
- Confidence: medium because NVD and the referenced issue establish the disclosure while maintainer remediation is absent.
- Residual risk: model-loading services retain file-system authority granted to their runtime account.

## Authoritative Sources

- [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json)
- [NVD CVE-2026-126996](https://nvd.nist.gov/vuln/detail/CVE-2026-126996)
- [text-to-LoRA issue 13](https://github.com/SakanaAI/text-to-lora/issues/13)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)

## Open Questions

- Does a maintained text-to-LoRA release reject traversal and symlink escapes for every checkpoint-loading path?

## Maintenance Notes

- Created on 2026-11-13; a fixed version was not established by the collected evidence.
