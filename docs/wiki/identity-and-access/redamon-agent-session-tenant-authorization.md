---
type: "Topic"
title: "RedAmon Agent-Session Tenant Authorization"
description: "Security analysis for CVE-2026-129854 cross-tenant control of RedAmon live agent sessions."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# RedAmon Agent-Session Tenant Authorization

## Current Understanding

The [November 16 collector source](../../../raw/processed/2026-11-16/ai-security-wiki-topic-news-collector-2026-11-17T002817Z.json) records [CVE-2026-129854](https://nvd.nist.gov/vuln/detail/CVE-2026-129854) / [GHSA-w454-6hwp-fm58](https://github.com/samugit83/redamon/security/advisories/GHSA-w454-6hwp-fm58): authenticated RedAmon users could enumerate and control other tenants' live post-exploitation sessions and jobs through guessable session identifiers. Broad RedAmon product context belongs upstream; this page owns the object-level authorization and delegated-session boundary.

## Security Impact

- Threat: an authenticated standard-role tenant can select another tenant's live session or job and send commands, terminate work, or disclose engagement targets.
- Affected boundary: RedAmon 4.0.0 through 7.7.2, four agent session-management routes, user and project ownership checks, and the privileged target-host sessions those routes proxy.
- Exploit or incident status: public disclosed vulnerability; no confirmed exploitation or local incident is recorded.
- Mitigation state: upgrade to RedAmon 7.8.0 and test that every session and job action enforces effective-user and project ownership server-side.
- Confidence: high for the affected range and patch because the maintainer advisory identifies both; the NVD record was published in-window.
- Residual risk: patched route checks do not eliminate risk from over-broad internal agent keys or stale session and job authorization state.

## Authoritative Sources

- [November 16 collector source](../../../raw/processed/2026-11-16/ai-security-wiki-topic-news-collector-2026-11-17T002817Z.json)
- [CVE-2026-129854](https://nvd.nist.gov/vuln/detail/CVE-2026-129854)
- [GHSA-w454-6hwp-fm58](https://github.com/samugit83/redamon/security/advisories/GHSA-w454-6hwp-fm58)
- [RedAmon v7.8.0 release](https://github.com/samugit83/redamon/releases/tag/v7.8.0)

## Related Code

- [Affected route inventory in the maintainer advisory](https://github.com/samugit83/redamon/security/advisories/GHSA-w454-6hwp-fm58)

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [agent delegated-task authorization drift](agent-delegated-task-authorization-drift.md)

## Open Questions

- Does v7.8.0 enforce effective-user and project ownership for all session and job proxy paths, including future routes?

## Maintenance Notes

- Created on 2026-11-16 as a tenant-authorization boundary separate from RedAmon terminal-listener authentication.
