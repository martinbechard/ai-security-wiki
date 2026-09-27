---
type: "Topic"
title: "Flowise BullMQ Dashboard Tenant Authorization Bypass"
description: "Security analysis for CVE-2026-100608, where Flowise BullMQ dashboard access lacked role, workspace, and organization scoping."
tags: ["data-and-privacy", "identity-and-access"]
---

# Flowise BullMQ Dashboard Tenant Authorization Bypass

## Current Understanding

The [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) records CVE-2026-100608 for Flowise through 3.1.4. Broad Flowise workflow-builder context belongs upstream; this page owns the local queue-dashboard tenant authorization boundary.

When queue mode and the BullMQ dashboard were enabled outside cloud mode, any authenticated user could access the dashboard without role, workspace, or organization scoping. The dashboard exposed queues and job payloads, including:

- chat inputs, prompts, and model responses;
- `overrideConfig` values and credential IDs;
- files and workspace identifiers;
- write actions over queue and job state.

## Security Impact

- Threat: any authenticated user can inspect or mutate AI workflow queues and job payloads when the dashboard is exposed.
- Affected boundary: Flowise through 3.1.4, queue mode, BullMQ dashboard, non-cloud deployments, role scoping, workspace scoping, and organization scoping.
- Exploit or incident status: disclosed CVE; no confirmed exploitation is recorded in the collector.
- Mitigation state: restrict or disable BullMQ dashboard access, add tenant and role checks, and upgrade when fixed Flowise guidance is confirmed.
- Confidence: medium-high from detailed NVD-backed collector evidence; fixed-version status needs recheck.
- Residual risk: operational dashboards can expose prompts, model outputs, credential IDs, files, and write controls outside normal application authorization.

## Authoritative Sources

- [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json)
- [NVD CVE-2026-100608](https://nvd.nist.gov/vuln/detail/CVE-2026-100608)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [identity and access](../identity-and-access/index.md)

## Open Questions

- Which Flowise release or deployment guidance fixes CVE-2026-100608, and what mitigations apply while BullMQ dashboard remains enabled?

## Maintenance Notes

- Created on 2026-09-27 from the [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) after verifier correction split BullMQ dashboard authorization from chat-history RBAC.
