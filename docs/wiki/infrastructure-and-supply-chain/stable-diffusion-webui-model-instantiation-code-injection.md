---
type: "Topic"
title: "Stable Diffusion WebUI Model-Instantiation Code Injection"
description: "Security analysis for CVE-2026-111986 code injection in AUTOMATIC1111 model instantiation."
tags: ["infrastructure-and-supply-chain"]
---

# Stable Diffusion WebUI Model-Instantiation Code Injection

## Current Understanding

[CVE-2026-111986](https://nvd.nist.gov/vuln/detail/CVE-2026-111986) records code injection through the `Target` value processed by AUTOMATIC1111 stable-diffusion-webui's model-instantiation path through 1.10.1. The [October 19 collector](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json) notes public exploit availability and no project response.

## Security Impact

- Threat: model-instantiation configuration can cross into executable runtime behavior.
- Affected boundary: stable-diffusion-webui through 1.10.1 and its model-instantiation `Target` handling.
- Exploit or incident status: public CVE reports a public exploit; no project response is recorded.
- Mitigation state: fixed version is not identified; do not load untrusted model configurations and run affected workloads with least privilege.
- Confidence: medium for remediation state because only the CVE record and linked issue are available.
- Residual risk: model configuration remains an execution surface even if artifacts themselves are signed.

## Authoritative Sources

- [October 19 collector source](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json)
- [CVE-2026-111986](https://nvd.nist.gov/vuln/detail/CVE-2026-111986)
- [project issue](https://github.com/AUTOMATIC1111/stable-diffusion-webui/issues/17499)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)

## Open Questions

- Has the project published a remediated release or disputed the CVE scope?

## Maintenance Notes

- Created on 2026-10-20 from the October 19 collector.
