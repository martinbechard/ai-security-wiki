---
type: "Topic"
title: "TinyLLaVA Factory Model-Config Code Injection"
description: "Security analysis for CVE-2026-108957, where TinyLLaVA Factory model configuration loading can execute attacker-controlled code."
tags: ["infrastructure-and-supply-chain", "model-and-prompt-security"]
---

# TinyLLaVA Factory Model-Config Code Injection

## Current Understanding

The [October 13 topic collector source](../../../raw/processed/2026-10-13/ai-security-wiki-topic-news-collector-2026-10-13T232603Z.json) records [CVE-2026-108957](https://nvd.nist.gov/vuln/detail/CVE-2026-108957) for TinyLLaVA_Factory up to commit `1abc6ac5e76a68d0fd087a071b56da968e69ca9b`. Broad TinyLLaVA model and project context belongs upstream; this page owns the model-configuration code injection and artifact supply-chain boundary.

The CVE evidence says `TinyLlavaConfig._load_text_config` can be abused through manipulation of `llm_model_name_or_path`. The public record says remote exploitation is possible, exploit code has been released, and the rolling-release project had not responded when recorded.

## Security Impact

- Threat: model or path parameters can execute code during model configuration loading.
- Affected boundary: TinyLLaVA_Factory up to `1abc6ac5e76a68d0fd087a071b56da968e69ca9b`, `tinyllava/model/configuration_tinyllava.py`, and model-loading host execution.
- Exploit or incident status: public CVE with public exploit code noted; no confirmed exploitation incident is recorded locally.
- Mitigation state: vendor response and patched release were not visible in the collector evidence.
- Confidence: medium-high for issue shape and exploit status from NVD/CVE evidence; medium for remediation state.
- Residual risk: model-loading configuration remains a supply-chain boundary for training, evaluation, and deployment hosts.

## Control Implications

- Treat model identifiers, paths, and configuration files as untrusted supply-chain input.
- Disable dynamic code execution during model config loading unless explicitly sandboxed and reviewed.
- Pin model artifacts to trusted registries and hashes before loading in privileged environments.

## Authoritative Sources

- [October 13 topic collector source](../../../raw/processed/2026-10-13/ai-security-wiki-topic-news-collector-2026-10-13T232603Z.json)
- [NVD CVE-2026-108957](https://nvd.nist.gov/vuln/detail/CVE-2026-108957)
- [CVE Services CVE-2026-108957](https://cveawg.mitre.org/api/cve/CVE-2026-108957)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [model and prompt security](../model-and-prompt-security/index.md)
- [Axolotl Multipack trust_remote_code RCE](axolotl-multipack-trust-remote-code-rce.md)

## Open Questions

- Has TinyLLaVA_Factory published a patch or mitigation beyond the affected commit boundary recorded by NVD?

## Maintenance Notes

- Created on 2026-10-14 from the October 13 topic collector as a model-loading supply-chain leaf.
