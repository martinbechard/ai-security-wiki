---
type: "Topic"
title: "Hyve Lite AI Chatbot IDOR"
description: "Security analysis for CVE-2026-97305 IDOR authorization bypass in AI Chatbot for WordPress - Hyve Lite."
tags: ["identity-and-access", "data-and-privacy"]
---

# Hyve Lite AI Chatbot IDOR

## Current Understanding

The [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) records [CVE-2026-97305](https://cveawg.mitre.org/api/cve/CVE-2026-97305) for Themeisle AI Chatbot for WordPress - Hyve Lite. Broad WordPress plugin catalog context belongs upstream if needed; this page owns the AI-chatbot authorization boundary and keeps the exact object class open until Patchstack detail is reconciled.

The CVE Services record classifies the issue as CWE-639 / IDOR through a user-controlled key. Versions through 2.0.2 are affected, and 2.0.3 is marked unaffected. The captured source does not yet prove whether the object is chatbot conversation state, configuration, prompt-linked content, or generic WordPress state, so this page keeps that uncertainty explicit.

## Security Impact

- Threat: a user-controlled key can bypass object-level authorization in an AI chatbot plugin.
- Affected boundary: AI Chatbot for WordPress - Hyve Lite through 2.0.2; fixed in at least 2.0.3.
- Exploit or incident status: public CVE, NVD, and Patchstack reference evidence; no local exploitation incident is recorded.
- Mitigation state: update to Hyve Lite 2.0.3 or later and verify object ownership on every chatbot-related read or write path.
- Confidence: medium-high for affected version and IDOR classification; medium on AI-specific impact until Patchstack details identify the vulnerable object.
- Residual risk: chatbot plugins can hold customer conversation, configuration, and prompt-linked state that ordinary WordPress authorization checks may not cover.

## Authoritative Sources

- [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json)
- [CVE-2026-97305 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-97305)
- [NVD CVE-2026-97305](https://nvd.nist.gov/vuln/detail/CVE-2026-97305)
- [Patchstack Hyve Lite advisory](https://patchstack.com/database/wordpress/plugin/hyve-lite/vulnerability/wordpress-ai-chatbot-for-wordpress-hyve-lite-plugin-2-0-2-insecure-direct-object-references-idor-vulnerability?_s_id=cve)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [data and privacy](../data-and-privacy/index.md)

## Open Questions

- Which Hyve Lite object type is addressable through the user-controlled key: chatbot conversation, configuration, prompt-linked content, or generic WordPress state?

## Maintenance Notes

- Created on 2026-10-06 from the [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) with an explicit open question because the collected CVE summary does not expose the exact object boundary.
