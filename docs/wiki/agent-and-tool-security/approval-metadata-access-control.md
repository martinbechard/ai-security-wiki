---
type: "Topic"
title: "Approval Metadata Access Control"
description: "Security controls for protecting agent approval queues, read APIs, and streams."
---

# Approval Metadata Access Control

## Current Understanding

Approval metadata access control treats queued action details as sensitive even before an agent executes an action. [Network-AI ApprovalInbox authorization bypass](network-ai-approval-inbox-authorization-bypass.md) shows that pending commands, file paths, justifications, and risk levels can leak through read and stream routes even when approve and deny routes are protected.

The durable rule is authorization parity: read, stats, and event-stream routes for approval systems need explicit access control aligned with mutating routes. Wildcard CORS is unsafe for sensitive approval queues because a browser session can become an unintended reader. The [July 24 leaf update watch source](../../../raw/processed/2026-07-24/ai-security-wiki-leaf-update-watch-2026-07-24T200235-0400.json) records the [VulnCheck APSAdapter signature-verification bypass](https://www.vulncheck.com/advisories/network-ai-before-cryptographic-signature-verification-bypass) as a deferred follow-up candidate that still needs visible-date confirmation, so it is not treated as current control evidence or added to the digest.

## Control Implications

- Gate list, detail, stats, and streaming approval routes with the same identity policy as approve and deny routes.
- Treat command strings, file paths, requester names, justifications, and risk labels as sensitive operational metadata.
- Avoid wildcard CORS on approval queues and administrative event streams.
- Include approval-read coverage in regression tests after patching mutating routes.
- Log approval metadata access separately from approval decisions.

## Authoritative Sources

- [Network-AI ApprovalInbox authorization bypass](network-ai-approval-inbox-authorization-bypass.md)
- [July 22 topic news collector source](../../../raw/processed/2026-07-22/ai-security-wiki-topic-news-collector-2026-07-22T193242-0400.json)
- [July 23 leaf update watch source](../../../raw/processed/2026-07-23/ai-security-wiki-leaf-update-watch-2026-07-23T200300-0400.json)
- [July 24 leaf update watch source](../../../raw/processed/2026-07-24/ai-security-wiki-leaf-update-watch-2026-07-24T200235-0400.json)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [cross-site agent forgery](cross-site-agent-forgery.md)
- [identity and access](../identity-and-access/index.md)
- [data and privacy](../data-and-privacy/index.md)
- Upstream AI development wiki owns general [human-agent approval boundaries](../../../upstream-ai-dev-wiki/adoption-and-operating-model/human-agent-approval-boundaries.md).

## Open Questions

- No open approval metadata access-control questions are recorded.

## Maintenance Notes

- Created as a reusable control leaf during July 22, 2026 raw-source ingest; enriched from the [July 23 leaf watcher](../../../raw/processed/2026-07-23/ai-security-wiki-leaf-update-watch-2026-07-23T200300-0400.json) with independent VulnCheck severity evidence and from the [July 24 leaf watcher](../../../raw/processed/2026-07-24/ai-security-wiki-leaf-update-watch-2026-07-24T200235-0400.json) with a weak-date APSAdapter follow-up that remains deferred pending visible-date confirmation.
