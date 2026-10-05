---
type: "Topic"
title: "aiir Policy Gate Signature Verification"
description: "Security analysis for CVE-2026-105161 improper cryptographic signature verification in the aiir Policy Gate Handler."
tags: ["governance-and-compliance", "identity-and-access"]
---

# aiir Policy Gate Signature Verification

## Current Understanding

The [October 4 topic collector source](../../../raw/processed/2026-10-04/ai-security-wiki-topic-news-collector-2026-10-04T233152Z.json) records [CVE-2026-105161](https://cveawg.mitre.org/api/cve/CVE-2026-105161) for `invariant-systems-ai/aiir` through 1.7.0. Broad product background belongs upstream only if the project remains relevant despite repository removal; this page owns the local signature-verification, unsupported-product, and policy-gate integrity implications.

The CVE record says the Policy Gate Handler improperly verifies a cryptographic signature. The attack can be executed remotely, the captured evidence recommends upgrading, and the source also notes the GitHub repository is no longer available and the affected product is unsupported.

## Security Impact

- Threat: a policy gate can accept untrusted data or decisions when signature verification is insufficient.
- Affected boundary: invariant-systems-ai aiir 1.0 through 1.7.0; Policy Gate Handler; cryptographic signature and data-authenticity boundary.
- Exploit or incident status: public CVE with NVD, VulDB, and GitHub Advisory Database references; no confirmed exploitation incident is recorded locally.
- Mitigation state: avoid relying on unsupported aiir versions for policy enforcement, upgrade only if a maintained successor is verified, and replace affected policy gates with supported controls that fail closed on signature failures.
- Confidence: medium-high for in-window timing and security relevance; medium for remediation because the repository and project advisory are reported as broken links or unavailable in the collector evidence.
- Residual risk: AI policy gates are governance controls, so signature-verification flaws can invalidate downstream audit evidence even if no exploit is observed.

## Authoritative Sources

- [October 4 topic collector source](../../../raw/processed/2026-10-04/ai-security-wiki-topic-news-collector-2026-10-04T233152Z.json)
- [CVE-2026-105161 record](https://cveawg.mitre.org/api/cve/CVE-2026-105161)
- [NVD CVE-2026-105161](https://nvd.nist.gov/vuln/detail/CVE-2026-105161)
- [VulDB advisory](https://vuldb.com/vuln/413387)
- [GitHub Advisory Database reference](https://github.com/advisories/GHSA-73p9-6hrp-8qhr)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [governance and compliance](index.md)
- [identity and access](../identity-and-access/index.md)
- [Copilot Studio signature verification privilege elevation](../identity-and-access/copilot-studio-signature-verification-privilege-elevation.md)

## Open Questions

- Is there a maintained aiir successor release that fixes CVE-2026-105161?
- What signature-verification input or canonicalization error caused the Policy Gate Handler flaw?

## Maintenance Notes

- Created on 2026-10-05 from the [October 4 topic collector source](../../../raw/processed/2026-10-04/ai-security-wiki-topic-news-collector-2026-10-04T233152Z.json) as a policy-gate integrity and unsupported-product leaf.
