---
type: "Topic"
title: "Joyland AI WebView JavaScript Injection"
description: "Security analysis for CVE-2026-102667 JavaScript injection into Joyland AI WebView content."
tags: ["data-and-privacy", "agent-and-tool-security"]
---

# Joyland AI WebView JavaScript Injection

## Current Understanding

The [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json) records [CVE-2026-102667](https://cveawg.mitre.org/api/cve/CVE-2026-102667) for Joyland AI WebView content on shared networks. This page owns the local mobile WebView injection and app-permission exposure boundary.

The CVE record says an attacker with shared network access can inject JavaScript into WebView content. Without user-granted permissions, the attacker could access the clipboard, make arbitrary HTTP requests through the Weex `stream` module, or access app-internal storage; with previously granted permissions, the attacker can access the file system, camera, microphone, and GPS tracking.

## Security Impact

- Threat: shared-network attackers can run JavaScript in app WebView context and reach app capabilities.
- Affected boundary: Joyland AI mobile app WebView content, shared-network traffic, Weex `stream`, clipboard, app-internal storage, and previously granted mobile permissions.
- Exploit or incident status: public CVE record; no confirmed active exploitation is recorded in the source.
- Mitigation state: vendor remediation and affected app versions require follow-up; enforce authenticated HTTPS content, WebView isolation, permission minimization, and content integrity.
- Confidence: medium-high for CVE identity and impact; medium-low for exact affected app versions and fix status.
- Residual risk: AI companion WebViews can expose conversation-adjacent data and mobile sensors when WebView content is not isolated from app privileges.

## Authoritative Sources

- [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json)
- [CVE-2026-102667 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-102667)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [AI Sidebar extension AI chat theft](ai-sidebar-extension-ai-chat-theft.md)

## Open Questions

- Which Joyland AI vendor advisory or app-store release identifies the fixed build for CVE-2026-102667?

## Maintenance Notes

- Created on 2026-10-02 from the [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json) after splitting the Joyland AI mobile-app CVE cluster into item-level leaves.
