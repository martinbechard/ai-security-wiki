---
type: "Topic"
title: "vLLM Multimodal Media SSRF File Read"
description: "Security analysis for CVE-2026-73560 SSRF and local file read in vLLM multimodal media handling."
tags: ["model-and-prompt-security", "agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# vLLM Multimodal Media SSRF File Read

## Current Understanding

The [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) records [CVE-2026-73560](https://nvd.nist.gov/vuln/detail/CVE-2026-73560) for vLLM prior to 0.26.0. Broad vLLM runtime coverage belongs upstream; this page owns the local multimodal media network and local-file boundary.

[vLLM multimodal input boundary vulnerabilities](vllm-multimodal-input-boundary-vulnerabilities.md) routes the broader vLLM 0.26.0 vulnerability family. This leaf is narrower: SSRF and local file reads occur in `MiMoV2OmniMultiModalProcessor` because attacker-controlled image and audio strings bypass `MediaConnector` protections for `allowed_media_domains` and `allowed_local_media_path`.

## Security Impact

- Threat: attacker-controlled multimodal media references can bypass shared media connector controls and reach internal URLs or local files.
- Affected boundary: vLLM prior to 0.26.0; `MiMoV2OmniMultiModalProcessor`, image/audio string handling, media domains, and local media paths.
- Exploit or incident status: public NVD record and secondary CVE mirror; no local exploitation evidence is recorded.
- Mitigation state: update to vLLM 0.26.0 or later and require every multimodal processor to call shared media validation before fetching or opening references.
- Confidence: medium-high from NVD and secondary CVE evidence.
- Residual risk: processor-specific media paths can drift from shared connector protections unless release gates include negative SSRF and local-file tests.

## Authoritative Sources

- [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json)
- [NVD CVE-2026-73560](https://nvd.nist.gov/vuln/detail/CVE-2026-73560)
- [Strix CVE-2026-73560 mirror](https://www.strix.ai/cve/CVE-2026-73560)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [vLLM multimodal input boundary vulnerabilities](vllm-multimodal-input-boundary-vulnerabilities.md)
- [agent network egress controls](../agent-and-tool-security/agent-network-egress-controls.md)
- [agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)

## Open Questions

- Which vLLM patch forces `MiMoV2OmniMultiModalProcessor` through shared `MediaConnector` controls?

## Maintenance Notes

- Created on 2026-08-19 after verifier correction split the vLLM vulnerability family.
