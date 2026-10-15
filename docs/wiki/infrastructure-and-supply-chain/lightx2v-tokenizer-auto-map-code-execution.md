---
type: "Topic"
title: "LightX2V Tokenizer auto_map Code Execution"
description: "Security analysis for CVE-2026-108943 unsafe tokenizer auto_map loading in ModelTC LightX2V."
tags: ["infrastructure-and-supply-chain"]
---

# LightX2V Tokenizer auto_map Code Execution

## Current Understanding

[The October 14 collector](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json) records [CVE-2026-108943](https://nvd.nist.gov/vuln/detail/CVE-2026-108943) for ModelTC LightX2V through 0.5.0. Broad model context belongs upstream; this page owns the tokenizer metadata execution boundary.

## Security Impact

- Threat: attacker-controlled tokenizer `auto_map` metadata can execute code during model loading.
- Affected boundary: LightX2V through 0.5.0 and tokenizer artifact loading.
- Exploit or incident status: NVD records public exploit information; no confirmed incident is recorded locally.
- Mitigation state: no vendor-confirmed patched version is in the collector evidence.
- Confidence and residual risk: high for the NVD-described boundary; untrusted tokenizer artifacts remain executable supply-chain inputs.

## Control Implications

- Pin and verify tokenizer metadata before loading; disable dynamic mapping in privileged runtimes.
- Load untrusted models only in isolated conversion or evaluation environments.

## Authoritative Sources

- [October 14 topic collector source](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json)
- [NVD CVE-2026-108943](https://nvd.nist.gov/vuln/detail/CVE-2026-108943)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [TinyLLaVA Factory model-config code injection](tinyllava-factory-model-config-code-injection.md)

## Open Questions

- Has ModelTC published a fixed release after 0.5.0?

## Maintenance Notes

- Created on 2026-10-14 from the October 14 collector.
