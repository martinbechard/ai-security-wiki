---
type: "Topic"
title: "Hatchet Durable Callback Payload Disclosure"
description: "Security analysis for CVE-2026-84298 cross-tenant durable callback payload disclosure in Hatchet."
tags: ["data-and-privacy", "identity-and-access", "agent-and-tool-security"]
---

# Hatchet Durable Callback Payload Disclosure

## Current Understanding

The [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json) records [CVE-2026-84298](https://cveawg.mitre.org/api/cve/CVE-2026-84298) for Hatchet before 0.95.3. Broad Hatchet product context belongs upstream; this page owns dispatcher callback tenant routing.

The V1 durable-task stream handler stores worker-supplied `task_external_id` values in the `durableInvocations` routing map before tenant ownership is verified, and callback delivery resolves that map by task UUID without tenant identity. An authenticated tenant worker that knows another tenant's durable task UUID and keeps a stream open on the same dispatcher process can receive that task's durable callback result payload. The CVE record notes UUIDv4 values are not enumerable and single-tenant deployments are unaffected in practice. Version 0.95.3 fixes the issue.

## Security Impact

- Threat: dispatcher routing can leak another tenant's durable callback result payload to a malicious worker.
- Affected boundary: Hatchet before 0.95.3; V1 durable-task dispatcher callback routing.
- Exploit or incident status: public CVE and GitHub advisory; exploitation requires another tenant's UUID and shared dispatcher process.
- Mitigation state: upgrade to 0.95.3 or later and include tenant identity in durable callback routing keys.
- Confidence: high for mechanism and fix version; exploitability is conditional on UUID knowledge and deployment topology.
- Residual risk: callback payloads can carry agent output, workflow state, or application data.

## Authoritative Sources

- [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json)
- [CVE-2026-84298 JSON](https://cveawg.mitre.org/api/cve/CVE-2026-84298)
- [GitHub advisory GHSA-9q4h-f4x5-ffq8](https://github.com/hatchet-dev/hatchet/security/advisories/GHSA-9q4h-f4x5-ffq8)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [Hatchet durable task event log disclosure](hatchet-durable-task-event-log-disclosure.md)
- [Hatchet worker-status event disclosure](hatchet-worker-status-event-disclosure.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-21 from the [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json).
