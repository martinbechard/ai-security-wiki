---
type: "Topic"
title: "MaxKB Chat Share Link Owner Bypass"
description: "Security analysis for CVE-2026-79917 public share-link creation for another user's MaxKB conversation."
tags: ["data-and-privacy", "identity-and-access"]
---

# MaxKB Chat Share Link Owner Bypass

## Current Understanding

The [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json) records [CVE-2026-79917](https://cveawg.mitre.org/api/cve/CVE-2026-79917) for MaxKB 2.7.0 through 2.10.4-lts. Broad MaxKB product context belongs upstream; this page owns chat share-link ownership checks.

`POST /chat/api/{application_id}/chat/{chat_id}/share_chat` verifies that a conversation exists but does not verify that it belongs to the authenticated `chat_user_id` or to the application bound to the caller's token. An attacker with any chat token and a known victim `chat_id` can create an unauthenticated public `ChatShareLink` exposing the victim conversation and can create `PublicFileAccess` state that makes associated files retrievable without credentials. The source records no available revoke path and no fixed version.

## Security Impact

- Threat: any valid chat token plus a known chat ID can publish another user's conversation and associated files.
- Affected boundary: MaxKB 2.7.0 through 2.10.4-lts; chat share-link endpoint and public file access state.
- Exploit or incident status: public GitHub advisory; no local exploitation evidence is recorded.
- Mitigation state: no fixed version identified; bind share creation to chat owner and application token, and revoke or rotate exposed share links.
- Confidence: high for advisory existence and affected range; fixed-version confidence is unavailable.
- Residual risk: public share links can turn an object-scope bug into durable unauthenticated disclosure.

## Authoritative Sources

- [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json)
- [CVE-2026-79917 JSON](https://cveawg.mitre.org/api/cve/CVE-2026-79917)
- [GitHub advisory GHSA-m8gr-554p-8r82](https://github.com/1Panel-dev/MaxKB/security/advisories/GHSA-m8gr-554p-8r82)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [MaxKB chat record IDOR](maxkb-chat-record-idor.md)

## Open Questions

- Which MaxKB release fixes CVE-2026-79917, and how should existing public share links be revoked?

## Maintenance Notes

- Created on 2026-09-21 from the [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json).
