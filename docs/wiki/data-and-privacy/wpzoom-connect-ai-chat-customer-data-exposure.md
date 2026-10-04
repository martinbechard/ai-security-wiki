---
type: "Topic"
title: "WPZOOM Connect AI Chat Customer Data Exposure"
description: "Security analysis for CVE-2026-100149 customer-card and license-key exposure in WPZOOM Connect AI Chat."
tags: ["data-and-privacy", "identity-and-access"]
---

# WPZOOM Connect AI Chat Customer Data Exposure

## Current Understanding

The [October 3 topic collector source](../../../raw/processed/2026-10-03/ai-security-wiki-topic-news-collector-2026-10-03T233152Z.json) records [CVE-2026-100149](https://cveawg.mitre.org/api/cve/CVE-2026-100149) for WPZOOM Connect: AI Chat, Click to Chat, Social Icons & Share Buttons through 4.7.3. Broad WPZOOM and WordPress plugin context belongs upstream if needed; this page owns the local AI chat customer-data and signature-domain boundary.

The CVE record says exploitation requires the attacker to register a WooCommerce customer or subscriber-level account with a crafted email address so the inline JavaScript identify payload prints an `x-yamidoo-signature` that can pass `verify_request()` for an arbitrary victim. After the attacker obtains that signature, the customer endpoint discloses the victim customer card without requiring authentication to that victim account. The exposed data can include name, WordPress user ID, order history, order totals, purchased products, payment method labels, and EDD Software Licensing license keys with status and activation counts.

## Security Impact

- Threat: a registered WooCommerce customer or subscriber can turn their own identify payload into a signature that exposes another customer's support and licensing data through the chat customer endpoint.
- Affected boundary: WPZOOM Connect AI Chat through 4.7.3; `inline_js()` identify payload; `verify_request()` signature validation; AI chat customer endpoint; WooCommerce and EDD Software Licensing customer data.
- Exploit or incident status: public CVE, NVD, Wordfence, WordPress source, and GitHub patch references; no confirmed exploitation incident is recorded locally.
- Mitigation state: update beyond the affected range when the fixed plugin release is confirmed, review exposed customer cards and license keys, and disable or constrain customer-data sharing in chat flows where patched signature binding is not available.
- Confidence: high for affected range, data categories, default-setting relevance, and vulnerable boundary from CVE Services; medium for first fixed release and any credential-rotation guidance until vendor release notes are captured.
- Residual risk: AI chat integrations that bridge logged-in identity, commerce records, and support context need signatures scoped to the exact customer, endpoint, and timestamp rather than reusable identify payloads.

## Authoritative Sources

- [October 3 topic collector source](../../../raw/processed/2026-10-03/ai-security-wiki-topic-news-collector-2026-10-03T233152Z.json)
- [CVE-2026-100149 record](https://cveawg.mitre.org/api/cve/CVE-2026-100149)
- [NVD CVE-2026-100149](https://nvd.nist.gov/vuln/detail/CVE-2026-100149)
- [Wordfence CVE-2026-100149 advisory](https://www.wordfence.com/threat-intel/vulnerabilities/id/e0c9026c-d83e-41ac-be3a-93a33c32c47b?source=cve)
- [WPZOOM AI chat customer source](https://plugins.trac.wordpress.org/browser/social-icons-widget-by-wpzoom/tags/4.7.3/includes/classes/class-wpzoom-ai-chat-customer.php#L82)
- [WPZOOM AI chat source](https://plugins.trac.wordpress.org/browser/social-icons-widget-by-wpzoom/tags/4.7.3/includes/classes/class-wpzoom-ai-chat.php#L921)
- [WPZOOM patch commit](https://github.com/wpzoom/social-icons-widget-by-wpzoom/commit/351a873ac6c99fd8fb63115628a9d612427c3097)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [identity and access](../identity-and-access/index.md)
- [WPBot chat-session contact disclosure](wpbot-chat-session-contact-disclosure.md)
- [AI provider override trust boundaries](ai-provider-override-trust-boundaries.md)

## Open Questions

- Which WPZOOM Connect release first fixes CVE-2026-100149, and does the remediation rotate or invalidate signatures that may have been exposed through page HTML?
- Do vendor instructions recommend disabling `share_customer_data` or `identify_logged_in` before updating?

## Maintenance Notes

- Created on 2026-10-04 from the [October 3 topic collector source](../../../raw/processed/2026-10-03/ai-security-wiki-topic-news-collector-2026-10-03T233152Z.json) as an AI chat customer-data exposure leaf.
