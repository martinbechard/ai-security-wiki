---
type: "Topic"
title: "Flowise pickle deserialization RCE"
description: "Security analysis for Flowise 3.1.3 read_pickle deserialization remote code execution risk."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# Flowise pickle deserialization RCE

## Current Understanding

The [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json) records an in-window NVD update for Flowise `read_pickle` deserialization risk fixed in 3.1.3. Broad Flowise context belongs upstream; this page owns the model and data artifact boundary where serialized Python objects can become code execution inside an agent-builder runtime.

## Security Impact

- Threat: attacker-controlled pickle data can execute code when a Flowise path deserializes it.
- Affected boundary: Flowise versions before 3.1.3; `read_pickle` and related data-loading paths.
- Exploit or incident status: public NVD/CVE/GitHub advisory evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade to Flowise 3.1.3 or later and reject unsafe pickle deserialization for untrusted data.
- Confidence: high for NVD update timing and fixed-version signal; medium for exact reachability from deployed flows.
- Residual risk: AI builders often import datasets, examples, and node artifacts whose serialization format carries more authority than ordinary prompt data.

## Authoritative Sources

- [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json)
- [Flowise 3.1.3 release](https://github.com/FlowiseAI/Flowise/releases/tag/flowise@3.1.3)
- [CVE-2026-69257 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-69257)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [NLTK transition parser model pickle RCE](nltk-transition-parser-model-pickle-rce.md)
- [Elasticsearch ML model artifact deserialization RCE](elasticsearch-ml-model-artifact-deserialization-rce.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-08 from the September 8 topic collector after verifier correction split the Flowise release wave into focused security-boundary leaves.
