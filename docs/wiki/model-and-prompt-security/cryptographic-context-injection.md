---
type: "Topic"
title: "Cryptographic Context Injection"
description: "Security analysis for encrypted instruction attacks that become trusted runtime output in AI agents."
tags: ["model-and-prompt-security", "agent-and-tool-security", "data-and-privacy"]
---

# Cryptographic Context Injection

## Current Understanding

The [August 21 topic news collector source](../../../raw/processed/2026-08-21/ai-security-wiki-topic-news-collector-2026-08-21T233219Z.json) records [Adversa AI's Cryptographic Context Injection disclosure](https://adversa.ai/blog/cryptographic-context-injection-grok-data-theft/) for [Grok](../../../upstream-ai-wiki/models/grok-model-family.md) and [Gemini](../../../upstream-ai-wiki/models/gemini-model-family.md). Broad Grok, Gemini, xAI, Google, and cryptography background belongs upstream; this page owns the local attack pattern where encrypted content is decoded inside an AI model or agent runtime and then treated as trusted context.

The reported attack uses encrypted instructions, such as AES-256-GCM material derived with PBKDF2, so text filters and safety classifiers do not see the harmful instruction in plaintext before model or runtime processing. Adversa reports a Grok browsing scenario where decrypted instructions could exfiltrate private session context and chat history through outbound navigation without user confirmation, and a Gemini Deep Thinking scenario where prohibited output returned as ciphertext bypassed safety filtering. The collector notes Grok remained reproducible as of 2026-08-19 and Gemini success had declined but was not fully closed according to researcher statements, with [SecurityWeek](https://www.securityweek.com/encrypted-prompts-bypass-ai-safety-guardrails-in-grok-and-gemini/) corroborating the public disclosure window.

## Security Impact

- Threat: encrypted or encoded runtime content can bypass prompt filters and then influence tool use, outbound navigation, or unsafe output after decryption.
- Affected boundary: agentic browsing, code-execution, and reasoning runtimes that decrypt or transform untrusted content inside the model-control loop.
- Exploit or incident status: public research disclosure with security-press corroboration; vendor remediation status is researcher-attributed and unresolved.
- Mitigation state: treat decrypted runtime output as untrusted data, gate egress independently, and require explicit confirmation before external navigation or data disclosure.
- Confidence: high for public disclosure and attack framing; medium for vendor-specific remediation state until xAI or Google publish primary responses.
- Residual risk: model safety controls that only inspect pre-decryption text can miss harmful instructions that become visible later in the tool or runtime path.

## Authoritative Sources

- [August 21 topic news collector source](../../../raw/processed/2026-08-21/ai-security-wiki-topic-news-collector-2026-08-21T233219Z.json)
- Adversa AI research: https://adversa.ai/blog/cryptographic-context-injection-grok-data-theft/
- SecurityWeek report: https://www.securityweek.com/encrypted-prompts-bypass-ai-safety-guardrails-in-grok-and-gemini/

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [agent network egress controls](../agent-and-tool-security/agent-network-egress-controls.md)
- [MCP data movement exposure controls](../data-and-privacy/mcp-data-movement-exposure-controls.md)
- Upstream AI wiki owns broad [Grok](../../../upstream-ai-wiki/models/grok-model-family.md), [Gemini](../../../upstream-ai-wiki/models/gemini-model-family.md), xAI, and Google product context.

## Open Questions

- Which primary vendor mitigations, if any, changed Grok or Gemini behavior after the Adversa disclosure?

## Maintenance Notes

- Created on 2026-08-21 from the [August 21 topic collector](../../../raw/processed/2026-08-21/ai-security-wiki-topic-news-collector-2026-08-21T233219Z.json) as a prompt-security attack-pattern leaf.
