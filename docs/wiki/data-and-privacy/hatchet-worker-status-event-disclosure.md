---
type: "Topic"
title: "Hatchet Worker Status Event Disclosure"
description: "Security analysis for CVE-2026-88978 WorkerStatus durable event disclosure in Hatchet."
tags: ["data-and-privacy", "identity-and-access", "agent-and-tool-security"]
---

# Hatchet Worker Status Event Disclosure

## Current Understanding

The [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json) records [CVE-2026-88978](https://cveawg.mitre.org/api/cve/CVE-2026-88978) for Hatchet before 0.106.1. Broad Hatchet product context belongs upstream; this page owns WorkerStatus polling tenant filters.

The WorkerStatus gRPC polling path in `pkg/repository/durable_events.go` passes caller-supplied durable task, node, and branch identifiers to `ListSatisfiedEntries` without a tenant filter. An authenticated tenant worker that knows another tenant's durable-task UUID can retrieve matching durable event-log records. The CVE record notes that UUIDv4 requirements make exploitation unlikely and single-tenant deployments are unaffected in practice. Version 0.106.1 fixes the issue.

## Security Impact

- Threat: worker-status polling can disclose durable event-log records when tenant filters are missing from repository queries.
- Affected boundary: Hatchet before 0.106.1; WorkerStatus gRPC polling and `ListSatisfiedEntries`.
- Exploit or incident status: public CVE and GitHub advisory; exploitation requires another tenant's UUID.
- Mitigation state: upgrade to 0.106.1 or later and include tenant filters in durable event repository calls.
- Confidence: high for mechanism and fix version; exploitability is conditional on UUID knowledge and deployment topology.
- Residual risk: background worker APIs are often less visible than user APIs but can carry equivalent tenant-scoped workflow state.

## Authoritative Sources

- [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json)
- [CVE-2026-88978 JSON](https://cveawg.mitre.org/api/cve/CVE-2026-88978)
- [GitHub advisory GHSA-992g-9cr3-vm5x](https://github.com/hatchet-dev/hatchet/security/advisories/GHSA-992g-9cr3-vm5x)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [Hatchet durable task event log disclosure](hatchet-durable-task-event-log-disclosure.md)
- [Hatchet durable callback payload disclosure](hatchet-durable-callback-payload-disclosure.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-21 from the [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json).
