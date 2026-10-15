---
type: "Topic"
title: "Praat whisper.cpp Model-Dimension Out-of-Bounds Write"
description: "Security analysis for CVE-2026-110698 malformed whisper.cpp model dimensions in Praat."
tags: ["infrastructure-and-supply-chain"]
---

# Praat whisper.cpp Model-Dimension Out-of-Bounds Write

## Current Understanding

[The October 14 collector](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json) records [CVE-2026-110698](https://nvd.nist.gov/vuln/detail/CVE-2026-110698) for Praat through 7.0.02 in its embedded whisper.cpp model loader. Broad application context belongs upstream; this page owns the model-dimension native parsing boundary.

## Security Impact

- Threat: malformed model dimensions can cause an out-of-bounds write during embedded whisper.cpp loading.
- Affected boundary: Praat through 7.0.02 and the embedded whisper.cpp model loader.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: the collector identifies patch `a910d21` and Praat 7.0.03 as initial remediation.
- Confidence and residual risk: high for the CVE and stated patch line; untrusted speech-model files remain a native parser risk.

## Control Implications

- Upgrade to 7.0.03 or later after validating the vendor remediation.
- Treat model conversion and loading as isolated processing of untrusted binary input.

## Authoritative Sources

- [October 14 topic collector source](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json)
- [NVD CVE-2026-110698](https://nvd.nist.gov/vuln/detail/CVE-2026-110698)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [OAID Tengine tmfile offset out-of-bounds read](oaid-tengine-tmfile-offset-out-of-bounds-read.md)

## Open Questions

- Does the patch cover all shipped embedded whisper.cpp model paths?

## Maintenance Notes

- Created on 2026-10-14 from the October 14 collector.
