---
type: "Topic"
title: "UniFi Protect AI Key Privilege Escalation"
description: "Security analysis for CVE-2026-77557 access-control failure in an AI-enabled physical security device."
tags: ["identity-and-access", "infrastructure-and-supply-chain"]
---

# UniFi Protect AI Key Privilege Escalation

## Current Understanding

CVE-2026-77557 affects UniFi Protect AI Key and crosses the local AI-enabled physical-security device access-control boundary. Broad Ubiquiti and UniFi product background belongs upstream. The [August 26 topic news collector source](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json) and [August 27 leaf update watch source](../../../raw/processed/2026-08-27/ai-security-wiki-leaf-update-watch-20260828T000238Z.json) provide the current evidence.

A malicious actor with network access can exploit improper access control to escalate privileges on the device. The source did not capture exact firmware or fixed-version details, so this page keeps the affected boundary narrow and preserves an open question for bulletin-level verification.

## Security Impact

- Threat: network-accessible privilege escalation can affect an AI-enabled physical security device.
- Affected boundary: UniFi Protect AI Key; device network access-control and privilege boundary.
- Exploit or incident status: public NVD and official Ubiquiti bulletin reference; no local exploitation incident is recorded.
- Mitigation state: not fully identified in the raw source; consult Ubiquiti Security Advisory Bulletin 067 for exact affected and fixed versions.
- Confidence: medium-high for advisory existence and impact, medium for affected and fixed version detail.
- Residual risk: AI-enabled edge devices still depend on ordinary device identity, authorization, and patch management controls.

## Authoritative Sources

- [August 27 leaf update watch source](../../../raw/processed/2026-08-27/ai-security-wiki-leaf-update-watch-20260828T000238Z.json)
- [CVE-2026-77557 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-77557)
- [August 26 topic news collector source](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json)
- [NVD CVE-2026-77557](https://nvd.nist.gov/vuln/detail/CVE-2026-77557)
- [Ubiquiti Security Advisory Bulletin 067](https://community.ui.com/releases/Security-Advisory-Bulletin-067/fc4a3488-7c43-4628-8bab-f715e96dbfc9)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [production agent identity and access controls](production-agent-identity-and-access-controls.md)
- [infrastructure and supply chain](../infrastructure-and-supply-chain/index.md)

## Open Questions

- Which UniFi Protect AI Key firmware versions are affected and fixed under Security Advisory Bulletin 067?

## Maintenance Notes

- Updated on 2026-08-28 with August 27 leaf-update evidence for CVE-2026-77557.
- Created on 2026-08-27 from the [August 26 topic collector](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json) as an AI-enabled device access-control leaf.
