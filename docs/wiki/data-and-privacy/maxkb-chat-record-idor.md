---
type: "Topic"
title: "MaxKB Chat Record IDOR"
description: "Security analysis for CVE-2026-77525 MaxKB management chat-record authorization bypass."
tags: ["data-and-privacy", "identity-and-access"]
---

# MaxKB Chat Record IDOR

## Current Understanding

The [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json) records [CVE-2026-77525](https://cveawg.mitre.org/api/cve/CVE-2026-77525) for MaxKB 2.10.2-lts and earlier. Broad MaxKB product context belongs upstream; this page owns management chat-record ownership checks.

Management chat-record routes authorize the path `application_id` but load records using global `chat_id` and `chat_record_id` values without confirming that the chat belongs to the authorized application. A normal user in the same workspace who knows a victim chat ID can read victim chat records through an attacker-owned application path. An attacker with an owned knowledge base and document can also use `add_knowledge` to copy victim answers while updating the victim record's improve paragraph list. No fixed version was available in the captured record.

## Security Impact

- Threat: global chat identifiers can expose persisted assistant conversations through a mismatched application path.
- Affected boundary: MaxKB 2.10.2-lts and earlier; management chat-record routes.
- Exploit or incident status: public GitHub advisory; no local exploitation evidence is recorded.
- Mitigation state: no fixed version identified; bind chat and chat-record IDs to the authorized application before read or mutation.
- Confidence: high for advisory existence and affected range; fixed-version confidence is unavailable.
- Residual risk: chat records can hold prompts, answers, file references, and knowledge-improvement links.

## Authoritative Sources

- [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json)
- [CVE-2026-77525 JSON](https://cveawg.mitre.org/api/cve/CVE-2026-77525)
- [GitHub advisory GHSA-7fmh-98f2-2cfg](https://github.com/1Panel-dev/MaxKB/security/advisories/GHSA-7fmh-98f2-2cfg)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [MaxKB chat share link owner bypass](maxkb-chat-share-link-owner-bypass.md)

## Open Questions

- Which MaxKB release fixes CVE-2026-77525?

## Maintenance Notes

- Created on 2026-09-21 from the [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json).
