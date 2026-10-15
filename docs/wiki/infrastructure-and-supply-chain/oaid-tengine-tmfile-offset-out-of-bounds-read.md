---
type: "Topic"
title: "OAID Tengine tmfile Offset Out-of-Bounds Read"
description: "Security analysis for CVE-2026-110694 malformed tmfile offset handling in OAID Tengine."
tags: ["infrastructure-and-supply-chain"]
---

# OAID Tengine tmfile Offset Out-of-Bounds Read

## Current Understanding

[The October 14 collector](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json) records [CVE-2026-110694](https://nvd.nist.gov/vuln/detail/CVE-2026-110694) for OAID Tengine through 1.12.0. Broad Tengine context belongs upstream; this page owns tmfile model-format parsing as a supply-chain boundary.

## Security Impact

- Threat: malformed tmfile offsets can trigger an out-of-bounds read during model loading.
- Affected boundary: OAID Tengine through 1.12.0 and tmfile offset parsing.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: a fixed version is not confirmed in the collector evidence.
- Confidence and residual risk: high for the NVD-described boundary; external model formats need isolated parsing.

## Control Implications

- Verify and inspect model packages before runtime ingestion.
- Run native model conversion and loading with resource and privilege isolation.

## Authoritative Sources

- [October 14 topic collector source](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json)
- [NVD CVE-2026-110694](https://nvd.nist.gov/vuln/detail/CVE-2026-110694)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [PowerInfer GGUF offset out-of-bounds read](powerinfer-gguf-offset-out-of-bounds-read.md)

## Open Questions

- Which OAID Tengine release remediates tmfile offset validation?

## Maintenance Notes

- Created on 2026-10-14 from the October 14 collector.
