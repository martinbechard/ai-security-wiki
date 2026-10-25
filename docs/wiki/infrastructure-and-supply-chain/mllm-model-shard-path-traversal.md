---
type: "Topic"
title: "mllm Model Shard Path Traversal"
description: "Security analysis for CVE-2026-115800 untrusted shard metadata escaping model-loading paths."
tags: ["infrastructure-and-supply-chain"]
---

# mllm Model Shard Path Traversal

## Current Understanding

[CVE-2026-115800](https://nvd.nist.gov/vuln/detail/CVE-2026-115800), captured by the [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json), reports `mllm` `load_model` traversal through a manipulated `shard_file` path up to 2.0.2. The record reports public exploit availability and no project response; this page owns model-artifact path containment.

## Security Impact

- Threat: model shard metadata reads outside the intended filesystem root.
- Affected boundary: UbiquitousLearning `mllm` through 2.0.2, `pymllm/mobile/convertor/__init__.py` `load_model`.
- Exploit or incident status: public exploit availability is reported by NVD; no local exploitation or incident is recorded.
- Mitigation state: no patched release is identified; avoid untrusted shards and enforce canonical containment before load.
- Confidence: medium because a maintainer advisory or response is not yet identified.
- Residual risk: model-loading pipelines remain a filesystem authority boundary when metadata names paths.

## Authoritative Sources

- [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json)
- [CVE-2026-115800](https://nvd.nist.gov/vuln/detail/CVE-2026-115800)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [Hugging Face Transformers checkpoint shard file read](huggingface-transformers-checkpoint-shard-file-read.md)

## Open Questions

- Is a maintained release or maintainer response available?

## Maintenance Notes

- Created on 2026-10-24 with an explicit public-exploit and unpatched-status caveat.
