---
type: "Topic"
title: "Frontier Model Cybersecurity Review Transparency"
description: "Security governance analysis for private or public pre-release cybersecurity review of frontier AI models."
tags: ["governance-and-compliance", "testing-and-assurance"]
---

# Frontier Model Cybersecurity Review Transparency

## Current Understanding

Frontier model cybersecurity review transparency is the governance boundary around who can inspect pre-release cyber-risk criteria, evidence, and results. The [August 7 topic news collector source](../../../raw/processed/2026-08-07/ai-security-wiki-topic-news-collector-2026-08-07T233338Z.json) records [Guardian reporting](https://www.theguardian.com/technology/2026/aug/07/white-house-ai) that the White House finalized a voluntary framework for cybersecurity testing of advanced AI models but does not plan to release the policy publicly.

Treat the framework facts as policy-reporting evidence until official White House, NIST, CAISI, Federal Register, or agency text is captured. Broad US AI policy, major company participation, and agency background belongs upstream; this page owns the local security-governance issue: private criteria can create release gates, but they also reduce independent auditability for defenders, researchers, customers, and downstream governance teams.

The reported boundary includes:

- voluntary submission of new closed-source advanced models before release;
- criteria shared only with select companies;
- reported exclusion of open-source models;
- prior public CAISI assessment reporting changes while the framework was developed.

The [August 9 leaf update watch source](../../../raw/processed/2026-08-09/ai-security-wiki-leaf-update-watch-20260809T000323Z.json) keeps the [Guardian White House AI review reporting](https://www.theguardian.com/technology/2026/aug/07/white-house-ai) as an in-window governance-control update. The local security delta remains transparency and accountability: a finalized but unpublished review framework may create private company-facing cybersecurity gates without giving defenders, customers, or independent researchers enough criteria to compare model release claims.

The [August 14 leaf update watch source](../../../raw/processed/2026-08-14/ai-security-wiki-leaf-update-watch-20260815T000408Z.json) adds [WIRED reporting](https://www.wired.com/story/the-white-house-is-going-to-expand-its-ai-policy) that the White House expects to expand the prerelease testing framework from closed frontier models to sufficiently capable open models. Treat this as reported policy intent until official White House, NIST, CAISI, or Federal Register text appears. The local delta is not broad open-model policy; it is the auditability gap created when open-model review expectations are described publicly only through reporting.

## Security Impact

- Threat or control area: private cybersecurity review can gate dangerous model releases, but opaque criteria and selective access can weaken independent assurance and downstream risk acceptance.
- Affected boundary: US voluntary pre-release review for advanced closed-source AI models, reported 30-day review window, CAISI assessment reporting, reported possible expansion to sufficiently capable open models, and company-facing criteria.
- Exploit or incident status: reported governance framework; official public text not captured.
- Mitigation state: no enforceable public control text identified; treat as a watch item for official criteria or assessment evidence.
- Confidence: medium because the sources are reputable and dated, but the reported framework and open-model expansion are not public official text.
- Residual risk: official criteria, reviewer authority, company participation, open-model treatment, publication rules, and appeal or enforcement mechanisms remain unknown.

## Control Implications

- Preserve the distinction between a private release gate and independently auditable security assurance.
- Require local risk records to state whether frontier-model review evidence is public, customer-visible, regulator-only, or unavailable.
- Do not infer that a model passed meaningful cyber review unless the review criteria, scope, and evidence are available or an authoritative source says so.
- Track open-model exclusions separately because threat capability may not follow release or licensing boundaries.

## Authoritative Sources

- [August 7 topic news collector source](../../../raw/processed/2026-08-07/ai-security-wiki-topic-news-collector-2026-08-07T233338Z.json)
- [August 9 leaf update watch source](../../../raw/processed/2026-08-09/ai-security-wiki-leaf-update-watch-20260809T000323Z.json)
- [August 14 leaf update watch source](../../../raw/processed/2026-08-14/ai-security-wiki-leaf-update-watch-20260815T000408Z.json)
- Guardian White House AI review reporting: https://www.theguardian.com/technology/2026/aug/07/white-house-ai
- WIRED White House AI policy reporting: https://www.wired.com/story/the-white-house-is-going-to-expand-its-ai-policy

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [governance and compliance](index.md)
- [testing and assurance](../testing-and-assurance/index.md)
- [frontier model critical cyber release gates](../testing-and-assurance/frontier-model-critical-cyber-release-gates.md)
- [public cyber-capability assessments](../testing-and-assurance/public-cyber-capability-assessments.md)

## Open Questions

- Will an official White House, NIST, CAISI, or Federal Register source publish the framework criteria?
- Which model classes and release types are covered by the voluntary review window?
- How should downstream security teams treat models excluded from or privately cleared by the framework?
- Will reported open-model expansion produce public criteria, regulator-only criteria, or private company-facing criteria?

## Maintenance Notes

- Created on 2026-08-07 from the [August 7 topic collector](../../../raw/processed/2026-08-07/ai-security-wiki-topic-news-collector-2026-08-07T233338Z.json) as a security-governance transparency leaf, not a broad US AI policy page.
- Updated on 2026-08-09 from the [August 9 watcher](../../../raw/processed/2026-08-09/ai-security-wiki-leaf-update-watch-20260809T000323Z.json) to preserve the private-framework transparency risk without duplicating broad policy background.
- Updated on 2026-08-14 from the [August 14 watcher](../../../raw/processed/2026-08-14/ai-security-wiki-leaf-update-watch-20260815T000408Z.json) with reported open-model expansion while preserving the official-source gap.
