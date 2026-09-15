---
type: "Topic"
title: "WPBot chat-session contact disclosure"
description: "Security analysis for CVE-2026-87916 unauthenticated WPBot chat-session listing exposing visitor contact data."
tags: ["data-and-privacy", "identity-and-access"]
---

# WPBot chat-session contact disclosure

## Current Understanding

The [September 13 topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json) records NVD evidence for [CVE-2026-87916](https://nvd.nist.gov/vuln/detail/CVE-2026-87916) in WPBot before 8.6.0. A direct NVD recheck during correction confirmed the WPScan detail URL. Broad WordPress plugin and chatbot product coverage belongs upstream; this page owns the local AI chat-session personal-data disclosure boundary.

NVD says WPBot does not perform capability or nonce checks on the AJAX action that lists stored chat sessions. Unauthenticated attackers can retrieve every chat visitor's name, email address, and phone number by requesting a wide date range.

The [September 15 leaf update watch source](../../../raw/processed/2026-09-15/ai-security-wiki-leaf-update-watch-20260915T000244Z.json) records NVD's 2026-09-14 enrichment: the record shows Deferred status, CVSS v3.1, SSVC metadata, CWE-200, and WPScan as the reference for the unauthenticated chat-session contact disclosure.

## Security Impact

- Threat: unauthenticated chat-session export can expose visitor contact data collected by an AI chatbot.
- Affected boundary: WPBot before 8.6.0, stored chat-session listing AJAX action, visitor names, email addresses, and phone numbers.
- Exploit or incident status: public NVD and WPScan evidence; no local exploitation incident is recorded.
- Mitigation state: update WPBot to 8.6.0 or later, require capability and nonce checks for session listing, and audit exposed chat-session records.
- Confidence: high after direct NVD recheck confirmed the CVE description and WPScan detail URL.
- Residual risk: chatbot session stores may retain personal data long after the conversation, so access-control failures can create delayed privacy exposure.

## Authoritative Sources

- [September 13 topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json)
- [September 15 leaf update watch source](../../../raw/processed/2026-09-15/ai-security-wiki-leaf-update-watch-20260915T000244Z.json)
- [NVD CVE-2026-87916](https://nvd.nist.gov/vuln/detail/CVE-2026-87916)
- [WPScan CVE-2026-87916 advisory](https://wpscan.com/vulnerability/31d65e66-10b1-467a-8b20-ecf4880359e0/)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [WPBot AI provider API-key spend](../identity-and-access/wpbot-ai-provider-api-key-spend.md)
- [AI provider override trust boundaries](ai-provider-override-trust-boundaries.md)

## Open Questions

- Which retention controls or export logs are available for WPBot chat-session data after patching?

## Maintenance Notes

- Updated on 2026-09-15 from the [September 15 leaf update watch](../../../raw/processed/2026-09-15/ai-security-wiki-leaf-update-watch-20260915T000244Z.json) with NVD Deferred, CVSS, SSVC, CWE-200, and WPScan-reference enrichment.
- Created on 2026-09-13 from the [September 13 topic collector](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json) and direct NVD recheck after verifier correction split chat-session disclosure from provider-key spend.
