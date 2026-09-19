---
type: "Topic"
title: "WPBot Claude Provider Settings Overwrite"
description: "Security analysis for CVE-2026-87959 subscriber-level overwrite of WPBot Claude provider settings."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# WPBot Claude Provider Settings Overwrite

## Current Understanding

The [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) records [CVE-2026-87959](https://cveawg.mitre.org/api/cve/CVE-2026-87959) for WPBot before 8.7.6. Broad WordPress plugin, Claude, and chatbot product coverage belongs upstream; this page owns the local AI provider configuration and low-privilege settings-write boundary.

The CVE and [WPScan advisory](https://wpscan.com/vulnerability/3d42171d-6335-4bd3-bbed-fc446da3f945/) say the AJAX action that saves Claude AI provider settings lacks a capability check. Subscriber-level users can overwrite Claude provider settings, including the API key used for outgoing AI requests.

## Security Impact

- Threat: low-privilege WordPress users can change AI provider routing and credential material for chatbot requests.
- Affected boundary: WPBot before 8.7.6, Claude provider settings AJAX action, configured Claude API key, and provider request routing.
- Exploit or incident status: public CVE, NVD, and WPScan advisory; no local exploitation incident is recorded.
- Mitigation state: update WPBot to 8.7.6 or later, require capability and nonce checks for provider settings, rotate exposed provider keys, and audit settings-write events.
- Confidence: high for affected version and authorization class because CVE and WPScan align.
- Residual risk: provider configuration writes are control-plane actions, so chatbot plugins should treat model endpoint, provider key, and provider-selection settings as administrator-only secrets.

## Authoritative Sources

- [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json)
- [CVE-2026-87959 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-87959)
- [NVD CVE-2026-87959](https://nvd.nist.gov/vuln/detail/CVE-2026-87959)
- [WPScan CVE-2026-87959 advisory](https://wpscan.com/vulnerability/3d42171d-6335-4bd3-bbed-fc446da3f945/)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [WPBot AI provider API-key spend](wpbot-ai-provider-api-key-spend.md)
- [AI provider override trust boundaries](../data-and-privacy/ai-provider-override-trust-boundaries.md)

## Open Questions

- Does WPBot 8.7.6 rotate or invalidate Claude provider settings that subscriber users could already overwrite?

## Maintenance Notes

- Created on 2026-09-19 from the [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json).
