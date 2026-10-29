---
type: "Topic"
title: "llama.cpp Crafted GGUF Memory Corruption"
description: "Security analysis for CVE-2026-116816 in llama.cpp model loading."
tags: ["infrastructure-and-supply-chain"]
---

# llama.cpp Crafted GGUF Memory Corruption

## Current Understanding

The [October 28 collector source](../../../raw/processed/2026-10-28/ai-security-wiki-topic-news-collector-2026-10-28T233111Z.json) records [CVE-2026-116816](https://cveawg.mitre.org/api/cve/CVE-2026-116816): llama.cpp before b10261 can write beyond a heap buffer in the plamo2 tokenizer path while loading a crafted GGUF artifact. Broad llama.cpp context belongs upstream; this page owns the hostile model-artifact boundary.

## Security Impact

- Threat: a crafted model or tokenizer can crash the loader or potentially execute code.
- Affected boundary: llama.cpp b5899 through before b10261, at GGUF/tokenizer loading.
- Exploit or incident status: public CVE; no confirmed incident is recorded locally.
- Mitigation state: update to b10261 or a verified downstream backport.
- Confidence: high for the affected range; residual risk remains for untrusted model artifacts.

## Control Implications

- Treat GGUF files and tokenizer metadata as hostile input.
- Pin model artifacts by trusted registry and hash, and isolate loaders from credentials and production networks.

## Authoritative Sources

- [October 28 collector source](../../../raw/processed/2026-10-28/ai-security-wiki-topic-news-collector-2026-10-28T233111Z.json)
- [CVE-2026-116816](https://cveawg.mitre.org/api/cve/CVE-2026-116816)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)

## Open Questions

- Which distributor builds carry the b10261 fix?

## Maintenance Notes

- Created on 2026-10-28 from the October 28 collector.
