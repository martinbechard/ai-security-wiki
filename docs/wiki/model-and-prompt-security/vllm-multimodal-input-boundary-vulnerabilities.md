---
type: "Topic"
title: "vLLM Multimodal Input Boundary Vulnerabilities"
description: "Security analysis for vLLM 0.26.0 fixes around derender DoS and multimodal SSRF or local file read."
tags: ["model-and-prompt-security", "infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# vLLM Multimodal Input Boundary Vulnerabilities

## Current Understanding

The [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) records two vLLM issues fixed before 0.26.0. Broad vLLM runtime coverage belongs upstream; this page owns the local model-serving input-boundary risk for multimodal processors and derender endpoints.

The family is split into focused leaves because availability and media-fetch boundaries can change independently:

- [vLLM derender denial of service](vllm-derender-denial-of-service.md) owns CVE-2026-71486, authenticated denial of service through caller-supplied `GenerateResponse` objects on derender endpoints before size limits apply.
- [vLLM multimodal media SSRF file read](vllm-multimodal-media-ssrf-file-read.md) owns CVE-2026-73560, SSRF and local file read in `MiMoV2OmniMultiModalProcessor` when attacker-controlled image and audio strings bypass `MediaConnector` protections.

## Security Impact

- Threat: model-serving endpoints can treat multimodal references or generated response objects as trusted enough to bypass size, network, or local-file controls; linked leaves own issue-specific details.
- Affected boundary: vLLM prior to 0.26.0; derender endpoints, `MiMoV2OmniMultiModalProcessor`, media URL handling, and local media path controls.
- Exploit or incident status: public NVD records; no local exploitation evidence is recorded.
- Mitigation state: update to vLLM 0.26.0 or later and verify all multimodal processors use shared media validation.
- Confidence: medium-high from NVD and secondary CVE evidence.
- Residual risk: processor-specific media paths can drift from shared connector protections unless release gates include negative SSRF and local-file tests.

## Authoritative Sources

- [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json)
- [NVD CVE-2026-71486](https://nvd.nist.gov/vuln/detail/CVE-2026-71486)
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
- [agent network egress controls](../agent-and-tool-security/agent-network-egress-controls.md)
- [agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)
- [vLLM derender denial of service](vllm-derender-denial-of-service.md)
- [vLLM multimodal media SSRF file read](vllm-multimodal-media-ssrf-file-read.md)

## Open Questions

- Which vLLM release notes or patches identify the exact fixed commits for CVE-2026-71486 and CVE-2026-73560?

## Maintenance Notes

- Created on 2026-08-19 from the [August 18 topic collector](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) as a vLLM 0.26.0 model-serving input-boundary router.
- Split on 2026-08-19 after verifier correction into separate derender DoS and multimodal media SSRF/file-read leaves.
