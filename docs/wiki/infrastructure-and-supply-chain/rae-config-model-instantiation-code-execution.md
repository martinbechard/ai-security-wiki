---
type: "Topic"
title: "RAE Config Model Instantiation Code Execution"
description: "Security analysis for CVE-2026-108944 configuration-driven code execution in RAE."
tags: ["infrastructure-and-supply-chain"]
---

# RAE Config Model Instantiation Code Execution

## Current Understanding

[The October 14 collector](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json) records [CVE-2026-108944](https://nvd.nist.gov/vuln/detail/CVE-2026-108944) for RAE through commit `a4d18c4`. Broad framework context belongs upstream; this page owns configuration-driven model-instantiation execution.

## Security Impact

- Threat: an untrusted model configuration can cause arbitrary code execution while a model is instantiated.
- Affected boundary: RAE through `a4d18c4` and configuration-to-class resolution.
- Exploit or incident status: public CVE; no confirmed public exploit or incident is recorded in this source.
- Mitigation state: no vendor-confirmed patched release is recorded.
- Confidence and residual risk: high for the affected boundary; configuration remains executable artifact input.

## Control Implications

- Allowlist model classes and validate configuration schemas before instantiation.
- Separate artifact preparation from privileged training or serving hosts.

## Authoritative Sources

- [October 14 topic collector source](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json)
- [NVD CVE-2026-108944](https://nvd.nist.gov/vuln/detail/CVE-2026-108944)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [ModelScope unsafe YAML loader RCE](modelscope-unsafe-yaml-loader-rce.md)

## Open Questions

- Which RAE revision remediates the configuration-instantiation path?

## Maintenance Notes

- Created on 2026-10-14 from the October 14 collector.
