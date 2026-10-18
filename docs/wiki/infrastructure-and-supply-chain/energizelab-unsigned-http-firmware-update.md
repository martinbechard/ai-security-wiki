---
type: "Topic"
title: "EnergizeLab Unsigned HTTP Firmware Update"
description: "Security analysis for CVE-2026-105036 firmware update integrity failure in an AI robot deployment boundary."
tags: ["infrastructure-and-supply-chain"]
---

# EnergizeLab Unsigned HTTP Firmware Update

## Current Understanding

The [October 17 topic collector source](../../../raw/processed/2026-10-17/ai-security-wiki-topic-news-collector-2026-10-17T193139-0400.json) groups [CVE-2026-105036](https://nvd.nist.gov/vuln/detail/CVE-2026-105036) with related EnergizeLab AI Station disclosures. It identifies unsigned firmware updates delivered over HTTP in affected Eilik/EilikO AI Station firmware or station-middleware images 1.6.5 through 1.8.2. This page owns update-chain integrity.

## Security Impact

- Affected boundary: firmware download transport and signature verification in versions 1.6.5 through 1.8.2.
- Exploit or incident status: public CVE; no exploitation is reported by the source.
- Mitigation state: require authenticated transport and verified signed firmware before installation; a fixed release is not established by the source.
- Confidence: high for the reported update-integrity concern; residual risk includes network-position attackers replacing update artifacts.

## Authoritative Sources

- [October 17 topic collector source](../../../raw/processed/2026-10-17/ai-security-wiki-topic-news-collector-2026-10-17T193139-0400.json)
- [CVE-2026-105036](https://nvd.nist.gov/vuln/detail/CVE-2026-105036)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)

## Open Questions

- Does a later firmware train enforce both transport authentication and artifact signatures?

## Maintenance Notes

- Created on 2026-10-17 as a supply-chain advisory distinct from device-access controls.
