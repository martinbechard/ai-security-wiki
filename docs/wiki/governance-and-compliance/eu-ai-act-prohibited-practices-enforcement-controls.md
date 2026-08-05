---
type: "Topic"
title: "EU AI Act Prohibited-Practices Enforcement Controls"
description: "Security-governance lens for prohibited-practices enforcement readiness under the EU AI Act."
tags: ["governance-and-compliance"]
---

# EU AI Act Prohibited-Practices Enforcement Controls

## Current Understanding

EU AI Act prohibited-practices enforcement controls are the evidence and release-gate checks that prevent AI systems from entering or remaining in prohibited-use territory. The [August 3 topic news collector source](../../../raw/processed/2026-08-03/ai-security-wiki-topic-news-collector-2026-08-03T151901-0400.json) records the official [European Commission AI Act Service Desk FAQ](https://ai-act-service-desk.ec.europa.eu/en/faq), which says some AI Office and member-state enforcement powers for prohibited practices apply from 2026-08-02.

The [August 4 leaf update watch source](../../../raw/processed/2026-08-04/ai-security-wiki-leaf-update-watch-2026-08-04T161500Z.json) adds the Commission [AI Act Service Desk Resources](https://ai-act-service-desk.ec.europa.eu/en/resources) page as enforcement-response evidence. The source records the AI Office, European Data Protection Supervisor, and member-state national competent authorities as the shared enforcement boundary starting 2026-08-02.

Broad EU AI Act legal background belongs upstream. This page owns the local security-governance lens: release gates need explicit prohibited-practice checks, exception records, risk acceptance boundaries, monitoring signals, and enforcement-response evidence.

## Security Impact

- Threat: an AI system can create unacceptable manipulation, exploitation, biometric, or surveillance risk when prohibited-practice checks are not part of security review.
- Affected boundary: AI product release gates, deployment review, use-case authorization, policy exception records, monitoring, and enforcement-response readiness.
- Exploit or incident status: regulatory enforcement boundary, not a specific exploit.
- Mitigation state: official FAQ and resource-page guidance records the enforcement start and authority boundary; implementation depends on local prohibited-use screening, documentation, monitoring, and escalation paths.
- Confidence: high for the 2026-08-02 enforcement start because the sources are official European Commission guidance; medium for local applicability until use cases are mapped to the prohibited-practices taxonomy.
- Residual risk: exact prohibited-practice classification, exceptions, member-state enforcement practice, and evidence expectations remain implementation-specific.

## Control Implications

- Add prohibited-practice screening to AI system intake, release, and material-change reviews.
- Preserve evidence for why a system is out of scope, permitted, remediated, or blocked.
- Treat unresolved prohibited-practice classification as a release blocker rather than a post-release documentation task.
- Keep monitoring and incident-response records ready for enforcement inquiries once a system is deployed.

## Authoritative Sources

- [August 3 topic news collector source](../../../raw/processed/2026-08-03/ai-security-wiki-topic-news-collector-2026-08-03T151901-0400.json)
- [August 4 leaf update watch source](../../../raw/processed/2026-08-04/ai-security-wiki-leaf-update-watch-2026-08-04T161500Z.json)
- European Commission AI Act Service Desk FAQ: https://ai-act-service-desk.ec.europa.eu/en/faq
- European Commission AI Act Service Desk Resources: https://ai-act-service-desk.ec.europa.eu/en/resources

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [governance and compliance](index.md)
- [synthetic content provenance labeling controls](synthetic-content-provenance-labeling-controls.md)
- [GPAI systemic-risk controls](gpai-systemic-risk-controls.md)
- Upstream AI wiki owns broad EU AI Act legal background.

## Open Questions

- Which local AI system categories need prohibited-practice screening?
- What evidence format is sufficient to show a prohibited-practice review passed, failed, or required remediation?

## Maintenance Notes

- Created on 2026-08-03 from the [August 3 collector](../../../raw/processed/2026-08-03/ai-security-wiki-topic-news-collector-2026-08-03T151901-0400.json) to map the prohibited-practices enforcement boundary separately from transparency and GPAI controls; enriched from the [August 4 leaf watcher](../../../raw/processed/2026-08-04/ai-security-wiki-leaf-update-watch-2026-08-04T161500Z.json) with official resource-page enforcement-authority evidence.
