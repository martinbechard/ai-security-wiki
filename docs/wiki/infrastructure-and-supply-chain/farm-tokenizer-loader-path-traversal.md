---
type: Topic
title: FARM Tokenizer Loader Path Traversal
description: A tokenizer vocabulary filename can cross FARM model-artifact loading boundaries.
tags: [infrastructure-and-supply-chain]
---

# FARM Tokenizer Loader Path Traversal

## Current Understanding

[CVE-2026-120334](https://nvd.nist.gov/vuln/detail/CVE-2026-120334) affects deepset-ai FARM through 0.8.0. A manipulated `EmbeddingTokenizer.from_pretrained` vocabulary filename can traverse paths during model-tokenizer loading. Treat model-package filenames as untrusted supply-chain input and constrain them to resolved artifact roots.

The affected project is reported unsupported; no maintainer patch is identified. No exploitation is reported, and confidence is medium.

- Mitigation state: isolate or replace the unsupported loader and enforce resolved artifact-root containment.
- Residual risk: no supported upstream patch is identified for deployments that continue loading attacker-supplied tokenizer metadata.

## Authoritative Sources

- [November 3 collector source](../../../raw/processed/2026-11-03/ai-security-wiki-topic-news-collector-2026-11-03T002828Z.json)
- [NVD CVE-2026-120334](https://nvd.nist.gov/vuln/detail/CVE-2026-120334)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [Agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)

## Open Questions

- Is there an actively maintained FARM replacement with a documented migration and security posture?

## Maintenance Notes

- Created on 2026-11-03; FARM ecosystem background remains upstream-owned.
