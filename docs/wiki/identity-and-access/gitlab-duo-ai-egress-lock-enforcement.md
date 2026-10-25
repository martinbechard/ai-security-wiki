---
type: "Topic"
title: "GitLab Duo AI Egress Lock Enforcement"
description: "Security analysis for CVE-2026-103515 delegated re-enablement of a locked AI egress control."
tags: ["identity-and-access", "governance-and-compliance"]
---

# GitLab Duo AI Egress Lock Enforcement

## Current Understanding

[CVE-2026-103515](https://nvd.nist.gov/vuln/detail/CVE-2026-103515), captured by the [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json), allows a GitLab EE group Owner to re-enable Duo after an instance administrator locks group availability. Product context belongs upstream; this page owns the delegated AI-egress control boundary.

## Security Impact

- Threat: a delegated role re-enables third-party AI data egress despite an administrative lock.
- Affected boundary: GitLab EE 19.2 before 19.3.6, 19.4 before 19.4.3, and 19.5 before 19.5.1.
- Exploit or incident status: public disclosure; no local exploitation or incident is recorded.
- Mitigation state: upgrade to a fixed release and audit locked groups and descendant projects.
- Confidence: high for affected releases; deployment-specific lock inheritance remains to be checked.
- Residual risk: availability configuration remains an egress control only if every delegated administration path enforces it.

## Authoritative Sources

- [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json)
- [CVE-2026-103515](https://nvd.nist.gov/vuln/detail/CVE-2026-103515)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [GitLab Duo workflow-token governance bypass](gitlab-duo-workflow-token-governance-bypass.md)

## Open Questions

- Does the fixed lock apply transitively to existing descendant projects?

## Maintenance Notes

- Created on 2026-10-24 from a dated NVD record; reconcile against GitLab's primary advisory when available.
