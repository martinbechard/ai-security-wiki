---
type: "Topic"
title: "Firefox AI Chatbot Tab Title Leak"
description: "Security analysis for CVE-2025-3035 cross-tab document-title leakage into Firefox AI chatbot prompts."
tags: ["data-and-privacy", "model-and-prompt-security"]
---

# Firefox AI Chatbot Tab Title Leak

## Current Understanding

The [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json) records [CVE-2025-3035](https://nvd.nist.gov/vuln/detail/CVE-2025-3035) and [MFSA 2025-20](https://www.mozilla.org/security/advisories/mfsa2025-20/) for Firefox before 137. Broad Firefox product context belongs upstream; this page owns the local prompt-context privacy boundary.

The advisory says using the AI chatbot in one tab and later activating it in another could leak the previous tab's document title into the chat prompt. This is a browser-assistant data-minimization issue: page context from one tab can enter a different AI interaction.

## Security Impact

- Threat: browser AI assistant state can carry prior-tab metadata into a later prompt.
- Affected boundary: Firefox before 137, AI chatbot prompt construction, tab/document-title state, and cross-tab context separation.
- Exploit or incident status: public NVD and Mozilla advisory records; no local exploitation incident is recorded.
- Mitigation state: upgrade Firefox to 137 or later and verify browser-assistant context isolation when enabling page-aware chat features.
- Confidence: high for fixed version and leakage boundary from NVD and Mozilla references; the publication predates the window and the qualifying signal is NVD last-modified metadata.
- Residual risk: browser-integrated AI assistants need explicit context reset and provenance indicators because small page metadata can still disclose sensitive user activity.

## Authoritative Sources

- [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json)
- [NVD CVE-2025-3035](https://nvd.nist.gov/vuln/detail/CVE-2025-3035)
- [Mozilla Firefox 137 advisory](https://www.mozilla.org/security/advisories/mfsa2025-20/)
- [Mozilla bug 1952268](https://bugzilla.mozilla.org/show_bug.cgi?id=1952268)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [model and prompt security](../model-and-prompt-security/index.md)
- [AI agent interaction transparency controls](../agent-and-tool-security/ai-agent-interaction-transparency-controls.md)
- Upstream AI wiki owns broad Firefox and browser assistant context.

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-10-01 from the [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json).
