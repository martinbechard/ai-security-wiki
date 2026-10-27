---
type: "Topic"
title: "vLLM Image Decoder Dependency Execution"
description: "Security analysis for CVE-2026-115915 decoder selection in vLLM image paths reaching vulnerable host dependencies."
tags: ["infrastructure-and-supply-chain", "model-and-prompt-security"]
---

# vLLM Image Decoder Dependency Execution

## Current Understanding

The October 26 collector records [CVE-2026-115915](https://www.cve.org/CVERecord?id=CVE-2026-115915) in vLLM before 0.32.0. This page owns untrusted image bytes and decoder selection, which can reach Ghostscript or Pillow independently of the request MIME label.

## Security Impact

- Threat: image-capable endpoints can dispatch an EPS payload to host components; vulnerable Ghostscript can execute commands and vulnerable Pillow can exhaust media workers.
- Affected boundary: `parse_image()` and `fetch_image()` before vLLM 0.32.0, subject to affected Ghostscript or Pillow versions.
- Exploit or incident status: public advisory; no local exploitation evidence is recorded.
- Mitigation state: upgrade to [0.32.0](https://github.com/vllm-project/vllm/releases/tag/v0.32.0), restrict accepted image decoders, and inventory Ghostscript and Pillow in serving images.
- Confidence: high for vLLM remediation; dependency-specific impact is conditional.
- Residual risk: MIME validation alone does not constrain a decoder selected from content bytes.

## Authoritative Sources

- [October 26 collector source](../../../raw/processed/2026-10-26/ai-security-wiki-topic-news-collector-2026-10-26T233009Z.json)
- [CVE-2026-115915](https://www.cve.org/CVERecord?id=CVE-2026-115915)
- [vLLM advisory](https://github.com/vllm-project/vllm/security/advisories/GHSA-h3rc-j82p-2c3h)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [vLLM multimodal input boundary vulnerabilities](../model-and-prompt-security/vllm-multimodal-input-boundary-vulnerabilities.md)

## Open Questions

- Which production images combine vulnerable Ghostscript or Pillow with image-capable vLLM endpoints?

## Maintenance Notes

- Created on 2026-10-26 as a decoder supply-chain boundary.
