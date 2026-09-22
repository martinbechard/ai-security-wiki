---
type: "Topic"
title: "Hatchet Durable Task Event Log Disclosure"
description: "Security analysis for CVE-2026-63342 cross-tenant durable task event-log disclosure in Hatchet."
tags: ["data-and-privacy", "identity-and-access", "agent-and-tool-security"]
---

# Hatchet Durable Task Event Log Disclosure

## Current Understanding

The [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json) records [CVE-2026-63342](https://cveawg.mitre.org/api/cve/CVE-2026-63342) for Hatchet before 0.91.1. Broad Hatchet product context belongs upstream; this page owns durable task event-log tenant scoping.

`GET /api/v1/stable/durable-tasks/{durable-task}` is implemented by `listDurableEventLog` without requiring the target tenant as a parent resource. An authenticated user who obtains another tenant's durable task UUID can read that task's event log, including task display names, workflow identifiers, user messages, wait conditions, branching logic, and timing information. Version 0.91.1 fixes the issue.

## Security Impact

- Threat: a durable task UUID can become a cross-tenant read key for workflow event logs.
- Affected boundary: Hatchet before 0.91.1; durable task event-log API.
- Exploit or incident status: public CVE and GitHub advisory; no local exploitation evidence is recorded.
- Mitigation state: upgrade to 0.91.1 or later and require tenant identity in durable-task routes.
- Confidence: high because CVE Services and the GitHub advisory agree on mechanism and fix.
- Residual risk: durable event logs can contain prompts, workflow branches, wait states, and timing metadata.

## Authoritative Sources

- [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json)
- [CVE-2026-63342 JSON](https://cveawg.mitre.org/api/cve/CVE-2026-63342)
- [GitHub advisory GHSA-g26x-m427-f48f](https://github.com/hatchet-dev/hatchet/security/advisories/GHSA-g26x-m427-f48f)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [Hatchet durable callback payload disclosure](hatchet-durable-callback-payload-disclosure.md)
- [Hatchet worker-status event disclosure](hatchet-worker-status-event-disclosure.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-21 from the [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json).
