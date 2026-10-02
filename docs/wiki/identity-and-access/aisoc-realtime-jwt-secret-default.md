---
type: "Topic"
title: "AiSOC Realtime JWT Secret Default"
description: "Security analysis for CVE-2026-103055 hard-coded JWT verification in AiSOC realtime WebSocket and SSE services."
tags: ["identity-and-access", "data-and-privacy"]
---

# AiSOC Realtime JWT Secret Default

## Current Understanding

The [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json) records [CVE-2026-103055](https://cveawg.mitre.org/api/cve/CVE-2026-103055) for AiSOC versions 7.5.0 before 12.0.0. This page owns the local realtime JWT verification and cross-tenant live-event subscription boundary.

The CVE record says the realtime WebSocket and SSE service uses a hard-coded constant for JWT verification when `AISOC_REALTIME_JWT_SECRET` is not set. Unauthenticated attackers can forge subscription tickets with arbitrary tenant identifiers and access cross-tenant live alerts, cases, agent events, and graph updates.

## Security Impact

- Threat: unauthenticated attackers can forge realtime subscription tickets for other tenants.
- Affected boundary: AiSOC 7.5.0 before 12.0.0, realtime WebSocket and SSE service, unset `AISOC_REALTIME_JWT_SECRET`, tenant identifiers, live alerts, cases, agent events, and graph updates.
- Exploit or incident status: public CVE record; no confirmed active exploitation is recorded in the source.
- Mitigation state: update to AiSOC 12.0.0 or later and require deployment-specific realtime JWT secrets with startup failure when unset.
- Confidence: high for public CVE identity and behavior; medium for exact deployment defaults outside the CVE text.
- Residual risk: realtime agent and security-event streams need tenant-bound token validation and should fail closed when signing secrets are missing.

## Authoritative Sources

- [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json)
- [CVE-2026-103055 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-103055)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [data and privacy](../data-and-privacy/index.md)
- [Cheshire Cat AI default identity bypass](cheshire-cat-ai-default-identity-bypass.md)

## Open Questions

- Which AiSOC release note documents secret-generation or startup-failure behavior for missing realtime JWT secrets?

## Maintenance Notes

- Created on 2026-10-02 from the [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json) after splitting the AiSOC CVE cluster into item-level leaves.
