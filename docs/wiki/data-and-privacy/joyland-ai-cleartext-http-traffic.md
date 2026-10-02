---
type: "Topic"
title: "Joyland AI Cleartext HTTP Traffic"
description: "Security analysis for CVE-2026-102670 explicit cleartext HTTP permission in Joyland AI on Android 9 and later."
tags: ["data-and-privacy", "infrastructure-and-supply-chain"]
---

# Joyland AI Cleartext HTTP Traffic

## Current Understanding

The [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json) records [CVE-2026-102670](https://cveawg.mitre.org/api/cve/CVE-2026-102670) for Joyland AI explicitly permitting cleartext HTTP traffic on Android 9 and later. This page owns the local mobile cleartext-transport boundary.

Android 9 and later block cleartext HTTP by default. Explicitly permitting it reopens network interception and content-tampering paths for app traffic that should be encrypted.

## Security Impact

- Threat: app traffic may travel over cleartext HTTP and be observed or modified on-path.
- Affected boundary: Joyland AI mobile app network security configuration on Android 9+.
- Exploit or incident status: public CVE record; no confirmed active exploitation is recorded in the source.
- Mitigation state: vendor remediation and affected app versions require follow-up; remove cleartext allowances and require HTTPS for all app, AI, WebView, and telemetry endpoints.
- Confidence: medium-high for CVE identity and impact; medium-low for exact affected app versions and fix status.
- Residual risk: cleartext allowances can compound WebView and TLS-validation flaws because they lower the baseline for all network trust.

## Authoritative Sources

- [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json)
- [CVE-2026-102670 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-102670)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [AI development context exclusion controls](ai-development-context-exclusion-controls.md)

## Open Questions

- Which Joyland AI vendor advisory or app-store release identifies the fixed build for CVE-2026-102670?

## Maintenance Notes

- Created on 2026-10-02 from the [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json) after splitting the Joyland AI mobile-app CVE cluster into item-level leaves.
