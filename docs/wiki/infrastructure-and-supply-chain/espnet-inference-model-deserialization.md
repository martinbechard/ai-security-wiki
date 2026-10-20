---
type: "Topic"
title: "ESPnet Inference-Model Deserialization"
description: "Security analysis for CVE-2026-112086 attacker-controlled inference model deserialization in ESPnet."
tags: ["infrastructure-and-supply-chain"]
---

# ESPnet Inference-Model Deserialization

## Current Understanding

[CVE-2026-112086](https://nvd.nist.gov/vuln/detail/CVE-2026-112086) reports that ESPnet through 202610.post2 deserializes attacker-controlled input through its `_target_`-driven inference model handler. The [October 19 collector](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json) identifies [patch commit `f217b24`](https://github.com/espnet/espnet/commit/f217b24f06de55e332cab10231469d5890dbbe00).

## Security Impact

- Threat: model configuration can become code execution during inference loading.
- Affected boundary: ESPnet inference model handler through 202610.post2.
- Exploit or incident status: public CVE; active exploitation is not identified.
- Mitigation state: a patch commit is identified, but the first release that contains it is not confirmed.
- Confidence: medium for versioned remediation; high for the affected code path.
- Residual risk: patched deserialization still requires artifact provenance and runtime isolation.

## Authoritative Sources

- [October 19 collector source](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json)
- [CVE-2026-112086](https://nvd.nist.gov/vuln/detail/CVE-2026-112086)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)

## Open Questions

- What is the first ESPnet release that includes the identified patch?

## Maintenance Notes

- Created on 2026-10-20 from the October 19 collector.
