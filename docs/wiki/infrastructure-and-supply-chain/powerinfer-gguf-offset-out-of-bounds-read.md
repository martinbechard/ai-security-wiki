---
type: "Topic"
title: "PowerInfer GGUF Offset Out-of-Bounds Read"
description: "Security analysis for CVE-2026-108955 malformed GGUF offset handling in PowerInfer."
tags: ["infrastructure-and-supply-chain"]
---

# PowerInfer GGUF Offset Out-of-Bounds Read

## Current Understanding

[The October 14 collector](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json) records [CVE-2026-108955](https://nvd.nist.gov/vuln/detail/CVE-2026-108955) for PowerInfer through commit `8bd56d6`. Broad runtime and GGUF context belongs upstream; this page owns the malformed-artifact parsing boundary.

## Security Impact

- Threat: crafted GGUF offsets can cause an out-of-bounds read while a model is loaded.
- Affected boundary: PowerInfer through `8bd56d6` and GGUF offset parsing.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: a fixed revision is not confirmed in the collector evidence.
- Confidence and residual risk: high for the NVD-described boundary; model files from untrusted sources can compromise loader availability or memory safety.

## Control Implications

- Require integrity checks and sandboxed inspection for external GGUF artifacts.
- Keep model conversion and loading processes away from high-privilege credentials.

## Authoritative Sources

- [October 14 topic collector source](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json)
- [NVD CVE-2026-108955](https://nvd.nist.gov/vuln/detail/CVE-2026-108955)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [sherpa-onnx vocabulary-metadata buffer overflow](sherpa-onnx-vocabulary-metadata-buffer-overflow.md)

## Open Questions

- Which PowerInfer commit remediates malformed GGUF offsets?

## Maintenance Notes

- Created on 2026-10-14 from the October 14 collector.
