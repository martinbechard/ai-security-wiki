---
type: "Topic"
title: "NLTK Transition Parser Model Pickle RCE"
description: "Security analysis for CVE-2026-71513 NLTK AllowlistUnpickler transition-parser model remote code execution."
tags: ["infrastructure-and-supply-chain", "model-and-prompt-security"]
---

# NLTK Transition Parser Model Pickle RCE

## Current Understanding

The [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) records CVE-2026-71513 for NLTK before 3.10.3. Broad NLTK library context belongs upstream; this page owns the local model and NLP artifact deserialization boundary.

The [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-71513) and [CVE record](https://www.cve.org/CVERecord?id=CVE-2026-71513) describe `AllowlistUnpickler` validating only the pickle module string and not the global name. A crafted untrusted transition-parser model could therefore execute arbitrary commands when loaded through `allowlisted_pickle_load`.

## Security Impact

- Threat: an NLP model artifact can execute code during loading when pickle allowlisting does not bind both module and global name.
- Affected boundary: NLTK before 3.10.3 transition-parser model loading through `allowlisted_pickle_load`.
- Exploit or incident status: public CVE evidence; no local exploitation evidence is recorded.
- Mitigation state: upgrade to 3.10.3 or later, avoid loading untrusted pickle-backed models, and prefer signed or non-executable model formats where possible.
- Confidence: medium-high because NVD and CVE evidence identify mechanics and affected range; primary project advisory details were not captured.
- Residual risk: AI pipelines commonly fetch models and corpora from shared storage, making deserialization constraints a supply-chain control rather than a local-only concern.

## Authoritative Sources

- [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json)
- [August 23 leaf update watch source](../../../raw/processed/2026-08-23/ai-security-wiki-leaf-update-watch-20260824T000259Z.json)
- [NVD CVE-2026-71513](https://nvd.nist.gov/vuln/detail/CVE-2026-71513)
- [CVE record CVE-2026-71513](https://www.cve.org/CVERecord?id=CVE-2026-71513)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [ONNX external data symlink file write](onnx-external-data-symlink-file-write.md)
- [Hugging Face Transformers checkpoint shard file read](huggingface-transformers-checkpoint-shard-file-read.md)

## Open Questions

- Which NLTK release note or advisory confirms the full fix behavior for `AllowlistUnpickler` in 3.10.3?

## Maintenance Notes

- Created on 2026-08-22 from the [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) as an NLP model deserialization leaf.
