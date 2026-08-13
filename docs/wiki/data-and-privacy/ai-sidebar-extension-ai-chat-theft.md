---
type: "Topic"
title: "AI Sidebar Extension AI Chat Theft"
description: "Security analysis for malicious AI browser-extension updates that expose AI conversation content and browser trust."
tags: ["data-and-privacy", "infrastructure-and-supply-chain"]
---

# AI Sidebar Extension AI Chat Theft

## Current Understanding

The AI Sidebar with DeepSeek AI Chrome extension is a browser-extension supply-chain and AI-conversation theft case. The [August 11 topic news collector source](../../../raw/processed/2026-08-11/ai-security-wiki-topic-news-collector-2026-08-11T233115Z.json) records [Netskope Threat Labs research](https://www.netskope.com/blog/ai-sidebar-extension-monetizes-its-own-updates) and [SecurityWeek reporting](https://www.securityweek.com/extension-banned-for-stealing-ai-chats-returns-to-chrome-store-resumes-malicious-activities/) that extension ID `inhcgfpbfdjbjogdfjbclgolkmhnooop` was removed after scraping ChatGPT and DeepSeek conversations, then reappeared and delivered new malicious updates through Google's CRX CDN.

The [August 12 leaf update watch source](../../../raw/processed/2026-08-12/ai-security-wiki-leaf-update-watch-20260813T000229Z.json) adds that version 1.7.3.0 delivered a monetization payload on update and uninstall events after relisting. Preserve that as a separate update-channel risk from the earlier AI-conversation theft while retaining the same extension identity.

Broad [ChatGPT](../../../upstream-ai-wiki/models/openai-gpt-5-chatgpt-models.md), [DeepSeek](../../../upstream-ai-wiki/companies/deepseek-ai.md), Chrome, Aitopia, and extension product context belongs upstream. Locally, this page owns the data-security boundary: AI chat content in browser extensions can include prompts, retrieved context, credentials, customer data, source snippets, and decisions, and browser auto-update channels can reintroduce code after marketplace removal.

## Security Impact

- Threat: malicious or relisted AI browser extensions can steal AI conversations and later ship updated payloads through trusted browser update infrastructure.
- Affected boundary: Chrome extension ID `inhcgfpbfdjbjogdfjbclgolkmhnooop`, AI Sidebar with DeepSeek AI, ChatGPT and DeepSeek conversations, managed browsers, CRX auto-updates, enterprise extension policies, and affiliate-link payload version 1.7.3.0.
- Exploit or incident status: primary threat research with indicators of compromise; Netskope classifies the CRX as `Trojan.GenericFCA.Script.37952`.
- Mitigation state: remove the extension, block its ID, review historical AI-chat exposure, and restrict AI browser extensions to approved publishers and versions.
- Confidence: high because the primary source has an in-window date, concrete extension ID, version, IOCs, and mitigation guidance.
- Residual risk: marketplace relisting and extension auto-update channels can restore a previously removed AI data-exposure path to managed endpoints.

## Control Implications

- Treat browser extensions that read AI chat pages as sensitive data processors.
- Block unapproved AI assistant extensions and pin approved extensions to reviewed publishers and permissions.
- Monitor extension update events, CRX hashes, and permission changes for managed browsers.
- Review AI chat histories for sensitive data if a theft-capable extension was installed.
- Keep AI conversation retention, export, and browser extension access in the same data-loss review.

## Authoritative Sources

- [August 11 topic news collector source](../../../raw/processed/2026-08-11/ai-security-wiki-topic-news-collector-2026-08-11T233115Z.json)
- [August 12 leaf update watch source](../../../raw/processed/2026-08-12/ai-security-wiki-leaf-update-watch-20260813T000229Z.json)
- Netskope Threat Labs AI Sidebar research: https://www.netskope.com/blog/ai-sidebar-extension-monetizes-its-own-updates
- SecurityWeek AI Sidebar report: https://www.securityweek.com/extension-banned-for-stealing-ai-chats-returns-to-chrome-store-resumes-malicious-activities/

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [AI development context exclusion controls](ai-development-context-exclusion-controls.md)
- [AI coding telemetry access controls](ai-coding-telemetry-access-controls.md)
- [slopsquatting package hallucination risk](../infrastructure-and-supply-chain/slopsquatting-package-hallucination-risk.md)
- Upstream AI wiki owns broad [ChatGPT](../../../upstream-ai-wiki/models/openai-gpt-5-chatgpt-models.md), [DeepSeek](../../../upstream-ai-wiki/companies/deepseek-ai.md), Chrome, and browser-extension product context.

## Open Questions

- What was the final Chrome Web Store removal or enforcement status after Netskope's August 11 report?
- Which enterprise browsers observed the relisted extension after the prior AI-chat theft report?

## Maintenance Notes

- Created on 2026-08-11 from the [August 11 topic collector](../../../raw/processed/2026-08-11/ai-security-wiki-topic-news-collector-2026-08-11T233115Z.json) after routing broad AI product and browser-extension catalog context upstream.
- Updated on 2026-08-12 from the [August 12 leaf watcher](../../../raw/processed/2026-08-12/ai-security-wiki-leaf-update-watch-20260813T000229Z.json) to separate the relisted monetization payload from prior AI-chat theft evidence.
