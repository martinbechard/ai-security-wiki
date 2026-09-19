---
type: "Topic"
title: "CordysCRM SSE Workflow Event Authorization"
description: "Security analysis for CVE-2026-63647 anonymous CordysCRM SSE workflow event access."
tags: ["identity-and-access", "data-and-privacy"]
---

# CordysCRM SSE Workflow Event Authorization

## Current Understanding

The [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) records [CVE-2026-63647](https://cveawg.mitre.org/api/cve/CVE-2026-63647) for CordysCRM before 1.7.2. This page owns the local workflow-event stream identity boundary.

The CVE says anonymous `/sse/subscribe`, `/sse/broadcast`, and `/sse/close` endpoints trust caller-controlled `userId` instead of deriving identity from an authenticated principal. Attackers can read workflow events, approval requests, mentions, and alerts for another user, inject heartbeat messages, or close channels.

## Security Impact

- Threat: anonymous callers can subscribe to or manipulate workflow event streams for another CRM user.
- Affected boundary: CordysCRM before 1.7.2, SSE subscription, broadcast, close endpoints, and caller-controlled `userId`.
- Exploit or incident status: public CVE and upstream patch references; no local exploitation incident is recorded.
- Mitigation state: upgrade to 1.7.2 or later, derive SSE identity from authenticated principals, reject caller-supplied user identity, and audit cross-user workflow event access.
- Confidence: high for CVE publication and affected routes after direct CVE Services re-fetch.
- Residual risk: event streams can expose approval, mention, and workflow context that may be used for social engineering or agent workflow manipulation.

## Authoritative Sources

- [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json)
- [CVE-2026-63647 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-63647)
- [CordysCRM CVE-2026-63647 patch commit](https://github.com/1Panel-dev/CordysCRM/commit/6cb81deb53434ae7792673c50312ff91685d7f9d)
- [CordysCRM CVE-2026-63647 pull request](https://github.com/1Panel-dev/CordysCRM/pull/2719)
- [CordysCRM 1.7.2 release](https://github.com/1Panel-dev/CordysCRM/releases/tag/v1.7.2)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [CordysCRM AI CRM authorization cluster](cordyscrm-ai-crm-authorization-cluster.md)
- [data and privacy](../data-and-privacy/index.md)

## Open Questions

- Which CordysCRM patch tests confirm that SSE `userId` is principal-derived?

## Maintenance Notes

- Created on 2026-09-19 from the [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) after verifier correction split the CordysCRM authorization cluster.
