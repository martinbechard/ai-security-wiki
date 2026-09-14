---
type: "Topic"
title: "WPBot AI provider API-key spend"
description: "Security analysis for CVE-2026-87918 unauthenticated WPBot AJAX actions spending configured AI provider API keys."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# WPBot AI provider API-key spend

## Current Understanding

The [September 13 topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json) records [CVE-2026-87918](https://cveawg.mitre.org/api/cve/CVE-2026-87918) for WPBot before 8.5.7. Broad WordPress plugin and chatbot product coverage belongs upstream; this page owns the local AI provider credential-use and cost boundary.

The CVE and WPScan advisory say several unauthenticated AJAX actions lacked authorization or nonce checks while relaying prompts to configured AI providers. Attackers could make third-party AI provider API calls using the site's configured API keys and consume associated cost.

## Security Impact

- Threat: unauthenticated prompt relay can spend site-owned AI provider API keys and create provider-side abuse records.
- Affected boundary: WPBot before 8.5.7, unauthenticated AJAX prompt-relay actions, configured AI provider API keys, and provider billing/rate-limit surfaces.
- Exploit or incident status: public CVE/WPScan/NVD evidence; no local exploitation incident is recorded.
- Mitigation state: update WPBot to 8.5.7 or later, require WordPress capability and nonce checks for AI relay actions, and monitor provider cost anomalies.
- Confidence: high because the direct CVE Services record and WPScan advisory align.
- Residual risk: provider API keys should be scoped and monitored so a plugin authorization failure cannot become unlimited external spend.

## Authoritative Sources

- [September 13 topic collector source](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json)
- [CVE-2026-87918 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-87918)
- [WPScan CVE-2026-87918 advisory](https://wpscan.com/vulnerability/d6b3745b-bda1-4734-b39c-75376477ba0a/)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [WPBot chat-session contact disclosure](../data-and-privacy/wpbot-chat-session-contact-disclosure.md)
- [AI provider override trust boundaries](../data-and-privacy/ai-provider-override-trust-boundaries.md)

## Open Questions

- Which WPBot AJAX actions relay prompts to each configured AI provider?

## Maintenance Notes

- Created on 2026-09-13 from the [September 13 topic collector](../../../raw/processed/2026-09-13/ai-security-wiki-topic-news-collector-2026-09-13T171540Z.json) after verifier correction split provider-key spend from chat-session disclosure.
