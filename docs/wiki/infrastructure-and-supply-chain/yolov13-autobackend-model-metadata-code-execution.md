---
type: "Topic"
title: "yolov13 AutoBackend Model-Metadata Code Execution"
description: "Security analysis for CVE-2026-108945 unsafe model metadata handling in yolov13 AutoBackend."
tags: ["infrastructure-and-supply-chain"]
---

# yolov13 AutoBackend Model-Metadata Code Execution

## Current Understanding

[The October 14 collector](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json) records [CVE-2026-108945](https://nvd.nist.gov/vuln/detail/CVE-2026-108945) for yolov13 through commit `7328994`. Broad computer-vision model context belongs upstream; this page owns the AutoBackend metadata execution boundary.

## Security Impact

- Threat: attacker-controlled model metadata can execute code during AutoBackend loading.
- Affected boundary: yolov13 through `7328994` and AutoBackend model metadata.
- Exploit or incident status: public CVE; no confirmed public exploit or incident is recorded in this source.
- Mitigation state: no vendor-confirmed fixed release is recorded.
- Confidence and residual risk: high for the NVD-described boundary; externally acquired model packages remain execution-capable inputs.

## Control Implications

- Verify artifact provenance and metadata schemas before automated backend selection.
- Isolate model inspection from production inference credentials and hosts.

## Authoritative Sources

- [October 14 topic collector source](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json)
- [NVD CVE-2026-108945](https://nvd.nist.gov/vuln/detail/CVE-2026-108945)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [LightX2V tokenizer auto_map code execution](lightx2v-tokenizer-auto-map-code-execution.md)

## Open Questions

- Which yolov13 revision fixes AutoBackend metadata loading?

## Maintenance Notes

- Created on 2026-10-14 from the October 14 collector.
