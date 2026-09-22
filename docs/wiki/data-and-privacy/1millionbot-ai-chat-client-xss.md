---
type: "Topic"
title: "1millionbot AI Chat Client XSS"
description: "Security analysis for CVE-2026-91921 client-side XSS in 1millionbot AI Chat Platform."
tags: ["data-and-privacy", "model-and-prompt-security"]
---

# 1millionbot AI Chat Client XSS

## Current Understanding

The [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json) records [CVE-2026-91921](https://cveawg.mitre.org/api/cve/CVE-2026-91921) for 1millionbot AI Chat Platform. Broad product context belongs upstream if needed; this page owns the local chat-rendering and user-session exposure boundary.

The record describes client-side XSS in the rendering engine. An unauthenticated remote user can send messages containing Markdown syntax and unsanitized content blocks that render external hyperlinks in the web interface. The captured source states the impact is limited to the user's own interactive session and does not identify compromise of internal infrastructure, third-party data, or admin panels. Affected versions and fixed versions were not identified in the fetched evidence.

## Security Impact

- Threat: chat content rendering can execute or present unsafe client-side content in the recipient's session.
- Affected boundary: 1millionbot AI Chat Platform client-side rendering engine; affected and fixed versions are not identified in the captured evidence.
- Exploit or incident status: public CVE/NVD records; no local exploitation evidence or broader infrastructure compromise is recorded.
- Mitigation state: fixed version not identified; sanitize Markdown and HTML blocks, restrict link rendering, and treat assistant/chat transcript display as an untrusted content surface.
- Confidence: medium because the CVE identifies the rendering issue and impact limitation, but version and fix metadata are missing.
- Residual risk: AI chat UIs often mix user messages, model output, and retrieval snippets, so even limited client-side rendering flaws can expose session-local data or train unsafe operator behavior.

## Authoritative Sources

- [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json)
- [CVE-2026-91921 JSON](https://cveawg.mitre.org/api/cve/CVE-2026-91921)
- [NVD CVE-2026-91921](https://nvd.nist.gov/vuln/detail/CVE-2026-91921)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [model and prompt security](../model-and-prompt-security/index.md)

## Open Questions

- Which 1millionbot AI Chat Platform versions are affected and which release fixes CVE-2026-91921?

## Maintenance Notes

- Created on 2026-09-21 from the [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json); preserve the source's limited-impact statement until stronger evidence appears.
