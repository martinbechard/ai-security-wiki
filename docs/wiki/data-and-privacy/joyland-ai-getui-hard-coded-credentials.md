---
type: "Topic"
title: "Joyland AI GeTui Hard-Coded Credentials"
description: "Security analysis for CVE-2026-102666 hard-coded GeTui push notification credentials in Joyland AI."
tags: ["data-and-privacy", "identity-and-access"]
---

# Joyland AI GeTui Hard-Coded Credentials

## Current Understanding

The [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json) records [CVE-2026-102666](https://cveawg.mitre.org/api/cve/CVE-2026-102666) for hard-coded GeTui push notification credentials in the Joyland AI app. Broad AI companion product context belongs upstream if it becomes durable; this page owns the local mobile credential and push-notification trust boundary.

The CVE record says attackers can access the GeTui REST API and send push notifications containing arbitrary content to any user, groups of users, or all users of the app.

## Security Impact

- Threat: exposed push credentials can let attackers send arbitrary app notifications at scale.
- Affected boundary: Joyland AI mobile app, embedded GeTui credentials, GeTui REST API, user, group, and all-user push notification targets.
- Exploit or incident status: public CVE record; no confirmed active exploitation is recorded in the source.
- Mitigation state: vendor remediation and affected app versions require follow-up; rotate exposed push credentials and remove service credentials from client binaries.
- Confidence: medium-high for CVE identity and impact; medium-low for exact affected app versions and fix status.
- Residual risk: AI companion apps can use push messages to steer users back into sensitive conversations, so push-provider credentials are security-critical.

## Authoritative Sources

- [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json)
- [CVE-2026-102666 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-102666)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [identity and access](../identity-and-access/index.md)

## Open Questions

- Which Joyland AI vendor advisory or app-store release identifies the fixed build for CVE-2026-102666?

## Maintenance Notes

- Created on 2026-10-02 from the [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json) after splitting the Joyland AI mobile-app CVE cluster into item-level leaves.
