---
type: "Topic"
title: "99AI Chat-Log Export Disclosure"
description: "Security analysis for CVE-2026-111706 unauthenticated export of AI prompts, answers, and user data."
tags: ["data-and-privacy", "identity-and-access"]
---

# 99AI Chat-Log Export Disclosure

## Current Understanding

The [October 17 topic collector source](../../../raw/processed/2026-10-17/ai-security-wiki-topic-news-collector-2026-10-17T193139-0400.json) records [CVE-2026-111706](https://nvd.nist.gov/vuln/detail/CVE-2026-111706): 99AI through 4.3.0 exposes `POST /api/chatLog/exportExcel` without authentication. A remote caller can download usernames, email addresses, prompts, and AI answers. General 99AI product context belongs upstream; this page owns conversation-data confidentiality.

## Security Impact

- Affected boundary: unauthenticated chat-log export through version 4.3.0.
- Exploit or incident status: public CVE; no exploitation is reported by the source.
- Mitigation state: require authorization before export, scope results per tenant or user, audit access, and identify a fixed release.
- Confidence: high for the disclosed endpoint and data categories; residual risk includes previously exported archives and derived datasets.

## Authoritative Sources

- [October 17 topic collector source](../../../raw/processed/2026-10-17/ai-security-wiki-topic-news-collector-2026-10-17T193139-0400.json)
- [CVE-2026-111706](https://nvd.nist.gov/vuln/detail/CVE-2026-111706)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)

## Open Questions

- Which release protects the export route and restricts results by tenant or ownership?

## Maintenance Notes

- Created on 2026-10-17 from CVE-2026-111706.
