---
type: "Topic"
title: "Open GenAI Stack Jinja Prompt Injection RCE"
description: "Security analysis for CVE-2026-77177, where prompt injection reaches Jinja server-side expression evaluation."
tags: ["model-and-prompt-security", "agent-and-tool-security"]
---

# Open GenAI Stack Jinja Prompt Injection RCE

## Current Understanding

The [September 29 topic collector source](../../../raw/processed/2026-09-29/ai-security-wiki-topic-news-collector-2026-09-29T233133Z.json) records [CVE-2026-77177](https://nvd.nist.gov/vuln/detail/CVE-2026-77177) for Open GenAI Stack, also named ogx-ai. Broad Meta AI, WhatsApp, and Open GenAI Stack entity context belongs upstream; this page owns the prompt-injection-to-server-side-template-execution boundary.

The source says prompt injection using Jinja2 template syntax can reach unsanitized server-side expression evaluation, permitting code execution. The collector source notes that NVD describes the stack as used in the Meta AI backend for WhatsApp and other products, but local analysis should preserve that as source-attributed evidence rather than generalizing beyond the advisory.

The [September 30 leaf update watch source](../../../raw/processed/2026-09-30/ai-security-wiki-leaf-update-watch-20261001T000313Z.json) corroborates CVE Services publication/update evidence and keeps the vendor-advisory and fixed-release questions open.

## Security Impact

- Threat: untrusted model-facing content can cross from prompt text into server-side Jinja expression evaluation and code execution.
- Affected boundary: Open GenAI Stack / ogx-ai; Jinja2 template syntax; prompt-processing path; server-side expression evaluation.
- Exploit or incident status: public NVD entry with linked proof-oriented gist; no active exploitation was identified in the collector source.
- Mitigation state: remove server-side template evaluation from prompt-controlled paths, sandbox template rendering, and treat any model or user text as data rather than executable template source.
- Confidence: high for the prompt-injection-to-template-execution class from NVD; medium for affected deployment boundaries because the collector did not capture a vendor advisory or fixed release.
- Residual risk: any prompt pipeline that renders model or user text through a general-purpose template engine can turn indirect prompt injection into application code execution.

## Authoritative Sources

- [September 29 topic collector source](../../../raw/processed/2026-09-29/ai-security-wiki-topic-news-collector-2026-09-29T233133Z.json)
- [September 30 leaf update watch source](../../../raw/processed/2026-09-30/ai-security-wiki-leaf-update-watch-20261001T000313Z.json)
- [CVE-2026-77177 NVD entry](https://nvd.nist.gov/vuln/detail/CVE-2026-77177)
- [Linked gist evidence](https://gist.github.com/abhi04anon/8ce0b68a5a7dda8a0501cbaf933173eb)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [LaVague indirect prompt injection RCE](lavague-indirect-prompt-injection-rce.md)
- [Skyvern TextPromptBlock Jinja sandbox escape](../agent-and-tool-security/skyvern-textpromptblock-jinja-sandbox-escape.md)
- [PraisonAI execute_code sandbox bypass](praisonai-execute-code-sandbox-bypass.md)
- Upstream AI wiki owns broad Meta AI, WhatsApp, and Open GenAI Stack entity context if needed.

## Open Questions

- Which Open GenAI Stack release or patch removes prompt-controlled Jinja server-side expression evaluation for CVE-2026-77177?

## Maintenance Notes

- Created on 2026-09-30 from the [September 29 topic collector source](../../../raw/processed/2026-09-29/ai-security-wiki-topic-news-collector-2026-09-29T233133Z.json) after routing broad product and company context upstream.
- Updated on 2026-10-01 from the [September 30 leaf update watch source](../../../raw/processed/2026-09-30/ai-security-wiki-leaf-update-watch-20261001T000313Z.json) with CVE Services provenance and no duplicate digest item.
