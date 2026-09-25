---
type: "Topic"
title: "Discourse AI Reviewables Private Message Exposure"
description: "Security analysis for CVE-2026-84302, where Discourse AI reviewables could expose private-message content to moderators outside the conversation."
tags: ["data-and-privacy", "identity-and-access"]
---

# Discourse AI Reviewables Private Message Exposure

## Current Understanding

The [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) records [CVE-2026-84302](https://cveawg.mitre.org/api/cve/CVE-2026-84302) for Discourse AI reviewables associated with private messages. Broad Discourse product context belongs upstream; this page owns the local AI moderation and private-message visibility boundary.

Reviewables created from private messages could appear in a moderator review queue for a moderator who was not a participant in the message. Depending on reviewable actions, the issue could expose private-message content and possibly allow edit or delete actions through the review path.

## Security Impact

- Threat: AI moderation artifacts become a secondary access path to private conversation content and related actions.
- Affected boundary: Discourse before 2026.1.6, 2026.5.2, 2026.6.1, and 2026.7.0; Discourse AI reviewables; private messages; moderator review queues.
- Exploit or incident status: public CVE, NVD, GitHub Security Advisory, and pull-request evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: upgrade to a fixed Discourse release and verify reviewable visibility inherits private-message participant authorization.
- Confidence: high for affected releases and access path; medium for action impact because it depends on enabled reviewable actions.
- Residual risk: AI moderation queues need to inherit the underlying content authorization boundary rather than using a separate reviewer-visible object model.

## Authoritative Sources

- [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json)
- [CVE-2026-84302 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-84302)
- [NVD CVE-2026-84302](https://nvd.nist.gov/vuln/detail/CVE-2026-84302)
- [GHSA-3rx9-fqgh-wfpc](https://github.com/discourse/discourse/security/advisories/GHSA-3rx9-fqgh-wfpc)
- [Discourse pull request 42091](https://github.com/discourse/discourse/pull/42091)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [identity and access](../identity-and-access/index.md)
- [AI agent collaboration DLP controls](ai-agent-collaboration-dlp-controls.md)

## Open Questions

- Which reviewable actions were available to non-participant moderators for affected Discourse private-message reviewables?

## Maintenance Notes

- Created on 2026-09-25 from the [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json); keep future updates focused on AI reviewable authorization and private-message data exposure.
