---
type: "Topic"
title: "HanLP Model-Configuration Deserialization"
description: "Security analysis for CVE-2026-112081 attacker-controlled model configuration deserialization in HanLP."
tags: ["infrastructure-and-supply-chain"]
---

# HanLP Model-Configuration Deserialization

## Current Understanding

[CVE-2026-112081](https://nvd.nist.gov/vuln/detail/CVE-2026-112081) reports that HanLP through 2.1.0-beta.64 deserializes attacker-controlled configuration through its classpath-driven model loader. The [October 19 collector](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json) preserves the finding separately from ESPnet because the product and remediation paths can change independently.

## Security Impact

- Threat: a model configuration can execute code while an inference environment loads it.
- Affected boundary: HanLP model configuration loading through 2.1.0-beta.64.
- Exploit or incident status: public CVE; active exploitation is not identified.
- Mitigation state: fixed version is not identified; block untrusted model configurations and isolate loaders.
- Confidence: medium because no project remediation is cited.
- Residual risk: classpath-controlled configuration makes artifact integrity a code-execution control.

## Authoritative Sources

- [October 19 collector source](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json)
- [CVE-2026-112081](https://nvd.nist.gov/vuln/detail/CVE-2026-112081)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)

## Open Questions

- Which HanLP release, if any, removes unsafe configuration deserialization?

## Maintenance Notes

- Created on 2026-10-20 from the October 19 collector.
