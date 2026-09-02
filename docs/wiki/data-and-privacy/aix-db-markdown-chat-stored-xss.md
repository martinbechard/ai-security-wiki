---
type: "Topic"
title: "Aix-DB Markdown Chat Stored XSS"
description: "Security analysis for CVE-2026-82881 raw Markdown HTML rendered into AI chat and knowledge surfaces."
tags: ["data-and-privacy", "model-and-prompt-security"]
---

# Aix-DB Markdown Chat Stored XSS

## Current Understanding

The [August 31 topic collector source](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json) records [CVE-2026-82881](https://nvd.nist.gov/vuln/detail/CVE-2026-82881) for Aix-DB through 1.2.4. Broad Aix-DB product coverage belongs upstream; this page owns the local AI chat and knowledge-rendering trust boundary.

NVD, the referenced [vulnerable Markdown code](https://github.com/apconw/Aix-DB/blob/v1.2.4/web/src/components/MarkdownPreview/plugins/markdown.ts#L36), [patch commit](https://github.com/apconw/Aix-DB/commit/b568a0f3b18ecead9f7d38bb78017f664d54a1a9), [issue 230](https://github.com/apconw/Aix-DB/issues/230), [pull request 231](https://github.com/apconw/Aix-DB/pull/231), and [VulnCheck advisory](https://www.vulncheck.com/advisories/aix-db-through-1.2.4-stored-cross-site-scripting-via-markdown) describe Markdown rendered with raw HTML into Vue `v-html` without sanitization. Chat responses, skill descriptions, or knowledge messages could therefore become stored browser-executed JavaScript.

The [September 1 leaf update watch source](../../../raw/processed/2026-09-01/ai-security-wiki-leaf-update-watch-20260902T000316Z.json) adds CVEAWG evidence and confirms the issue, pull request, commit, and VulnCheck remediation path. It preserves the through-1.2.4 affected range.

## Security Impact

- Threat: untrusted AI chat, skill, or knowledge content can execute script in a user's browser session.
- Affected boundary: Aix-DB through 1.2.4, Markdown rendering, Vue `v-html`, chat responses, skill descriptions, and knowledge messages.
- Exploit or incident status: public CVE with code, issue, PR, commit, and advisory evidence; no local incident is recorded.
- Mitigation state: apply the patch at commit `b568a0f3b18ecead9f7d38bb78017f664d54a1a9` or later and sanitize rendered Markdown before insertion into privileged DOM sinks.
- Confidence: high for vulnerability identity, vulnerable sink, and patch reference from NVD-linked evidence.
- Residual risk: model output and knowledge content remain untrusted even when produced by an internal assistant.

## Control Implications

- Disable raw HTML in Markdown unless a sanitizer runs after parsing and before rendering.
- Treat model output, retrieved knowledge, skill descriptions, and chat history as hostile rendered content.
- Add regression tests for script tags, event handlers, JavaScript URLs, and HTML entities in AI-generated content.

## Authoritative Sources

- [August 31 topic collector source](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json)
- [September 1 leaf update watch source](../../../raw/processed/2026-09-01/ai-security-wiki-leaf-update-watch-20260902T000316Z.json)
- [NVD CVE-2026-82881](https://nvd.nist.gov/vuln/detail/CVE-2026-82881)
- [Vulnerable Markdown code](https://github.com/apconw/Aix-DB/blob/v1.2.4/web/src/components/MarkdownPreview/plugins/markdown.ts#L36)
- [Patch commit](https://github.com/apconw/Aix-DB/commit/b568a0f3b18ecead9f7d38bb78017f664d54a1a9)
- [Issue 230](https://github.com/apconw/Aix-DB/issues/230)
- [Pull request 231](https://github.com/apconw/Aix-DB/pull/231)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/aix-db-through-1.2.4-stored-cross-site-scripting-via-markdown)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [model and prompt security](../model-and-prompt-security/index.md)
- [AI Sidebar extension AI chat theft](ai-sidebar-extension-ai-chat-theft.md)

## Open Questions

- Which Aix-DB release first includes the Markdown sanitization patch after commit `b568a0f3b18ecead9f7d38bb78017f664d54a1a9`?

## Maintenance Notes

- Created on 2026-08-31 from the [August 31 topic collector](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json) as an AI rendered-content trust leaf.
- Updated on 2026-09-01 from the [September 1 leaf watcher](../../../raw/processed/2026-09-01/ai-security-wiki-leaf-update-watch-20260902T000316Z.json) with CVEAWG and remediation-reference provenance.
