---
type: "Topic"
title: "Hatchet OAuth State Reuse"
description: "Security analysis for CVE-2026-61687 OAuth state collision in Hatchet."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# Hatchet OAuth State Reuse

## Current Understanding

The [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json) records [CVE-2026-61687](https://cveawg.mitre.org/api/cve/CVE-2026-61687) for Hatchet before 0.91.1. Broad Hatchet durable-workflow context belongs upstream; this page owns the local session-binding and OAuth-state boundary.

`ValidateOAuthState` clears the `oauth_state_` session value to an empty string after a successful callback and later accepts an empty `state` parameter as equal. The [CVE record](https://cveawg.mitre.org/api/cve/CVE-2026-61687) says an unauthenticated attacker can bind a victim's Hatchet session to an attacker-controlled OAuth identity when the victim has completed an OAuth flow in the current session and Google, GitHub, or Slack OAuth integration is enabled. Version 0.91.1 fixes the issue.

## Security Impact

- Threat: login CSRF can attach a workflow-console session to the wrong external identity.
- Affected boundary: Hatchet before 0.91.1; OAuth callback state validation for Google, GitHub, and Slack-enabled deployments.
- Exploit or incident status: public CVE and GitHub advisory; exploitation requires a prior completed OAuth flow in the victim session.
- Mitigation state: upgrade to 0.91.1 or later, treat empty or previously consumed OAuth states as invalid, and bind state to issuer, session, and one-time nonce.
- Confidence: high because the CVE record, GitHub advisory, and patch reference agree on mechanism and fixed version.
- Residual risk: agent workflow consoles often chain OAuth identity into task authority, so session binding flaws can affect later tool and workflow permissions.

## Authoritative Sources

- [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json)
- [CVE-2026-61687 JSON](https://cveawg.mitre.org/api/cve/CVE-2026-61687)
- [NVD CVE-2026-61687](https://nvd.nist.gov/vuln/detail/CVE-2026-61687)
- [GitHub advisory GHSA-phg3-3g28-wq9v](https://github.com/hatchet-dev/hatchet/security/advisories/GHSA-phg3-3g28-wq9v)
- [Hatchet patch commit](https://github.com/hatchet-dev/hatchet/commit/f90464189ad642251e09412d0f99fde353036428)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [Hatchet durable task event log disclosure](../data-and-privacy/hatchet-durable-task-event-log-disclosure.md)
- [Hatchet SNS metadata SSRF](../infrastructure-and-supply-chain/hatchet-sns-metadata-ssrf.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-21 from the [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json); split from the Hatchet advisory cluster because OAuth session binding has a distinct identity-control boundary.
