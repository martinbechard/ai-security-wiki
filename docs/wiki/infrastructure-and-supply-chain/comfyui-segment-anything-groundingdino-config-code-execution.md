---
type: "Topic"
title: "ComfyUI Segment Anything GroundingDINO Config Code Execution"
description: "Security analysis for CVE-2026-108962 unsafe GroundingDINO configuration loading."
tags: ["infrastructure-and-supply-chain"]
---

# ComfyUI Segment Anything GroundingDINO Config Code Execution

## Current Understanding

[The October 14 collector](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json) records [CVE-2026-108962](https://nvd.nist.gov/vuln/detail/CVE-2026-108962) for `comfyui_segment_anything` through commit `ab63955`. Broad ComfyUI context belongs upstream; this page owns the GroundingDINO configuration-loading execution boundary.

## Security Impact

- Threat: attacker-controlled GroundingDINO configuration can execute code during extension model loading.
- Affected boundary: `comfyui_segment_anything` through `ab63955` and GroundingDINO configuration loading.
- Exploit or incident status: public CVE; no confirmed public exploit or incident is recorded in this source.
- Mitigation state: no vendor-confirmed patch is recorded.
- Confidence and residual risk: high for the NVD-described boundary; workflow extensions can import unsafe artifact configuration.

## Control Implications

- Review and pin extension configuration with the same controls used for model code.
- Run untrusted workflow and model preparation outside privileged ComfyUI deployments.

## Authoritative Sources

- [October 14 topic collector source](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json)
- [NVD CVE-2026-108962](https://nvd.nist.gov/vuln/detail/CVE-2026-108962)

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

- Which extension revision fixes the GroundingDINO configuration path?

## Maintenance Notes

- Created on 2026-10-14 from the October 14 collector.
