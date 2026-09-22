---
type: "Topic"
title: "Feast Privileged CI Credential Exposure"
description: "Security analysis for CVE-2026-55563 pull_request_target credential exposure in Feast."
tags: ["infrastructure-and-supply-chain", "data-and-privacy"]
---

# Feast Privileged CI Credential Exposure

## Current Understanding

The [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json) records [CVE-2026-55563](https://cveawg.mitre.org/api/cve/CVE-2026-55563) for Feast before 0.65.0. Broad Feast and feature-store product context belongs upstream; this page owns the privileged CI and cloud-credential exposure boundary for an AI and machine-learning feature store.

Feast uses `pull_request_target` with the `synchronize` event in `pr_integration_tests.yml` and preserves approval labels across newly pushed commits. A fork contributor can obtain approval for a benign revision, push changed code, and run privileged make targets with GCP, AWS, and Snowflake credentials exposed to the workflow. The [GitHub advisory](https://github.com/feast-dev/feast/security/advisories/GHSA-2j2x-r73g-hrr5), [patch commit](https://github.com/feast-dev/feast/commit/76192229eca01661109ed56e0dd0cf8f732975f6), and [0.65.0 release](https://github.com/feast-dev/feast/releases/tag/v0.65.0) identify the fix boundary.

## Security Impact

- Threat: privileged CI for a machine-learning feature store can expose cloud and data-platform credentials to attacker-controlled fork code.
- Affected boundary: Feast before 0.65.0; privileged GitHub Actions PR integration workflow and approval-label reuse.
- Exploit or incident status: public CVE and GitHub advisory; no local in-the-wild incident is recorded.
- Mitigation state: upgrade to 0.65.0 or later, avoid `pull_request_target` for untrusted code execution, invalidate approvals on synchronize events, and scope cloud credentials to trusted branches or ephemeral jobs.
- Confidence: high because CVE Services, NVD, advisory, commit, and release evidence agree on the workflow issue and fix.
- Residual risk: ML and AI infrastructure CI often holds cloud credentials, model registries, and data warehouse access, so workflow approval state must be tied to the exact reviewed commit.

## Authoritative Sources

- [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json)
- [CVE-2026-55563 JSON](https://cveawg.mitre.org/api/cve/CVE-2026-55563)
- [NVD CVE-2026-55563](https://nvd.nist.gov/vuln/detail/CVE-2026-55563)
- [GitHub advisory GHSA-2j2x-r73g-hrr5](https://github.com/feast-dev/feast/security/advisories/GHSA-2j2x-r73g-hrr5)
- [Feast 0.65.0 release](https://github.com/feast-dev/feast/releases/tag/v0.65.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [data and privacy](../data-and-privacy/index.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-21 from the [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json); keep general CI practice upstream while preserving the AI feature-store credential exposure boundary locally.
