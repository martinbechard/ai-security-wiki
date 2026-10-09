---
type: "Topic"
title: "Banks Chat Message Role Injection"
description: "Security analysis for CVE-2026-107717 user-controlled prompt input parsed as privileged Banks chat messages."
tags: ["model-and-prompt-security", "agent-and-tool-security"]
---

# Banks Chat Message Role Injection

## Current Understanding

The [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json) records [CVE-2026-107717](https://cveawg.mitre.org/api/cve/CVE-2026-107717) for Banks `Prompt.chat_messages()`. Broad package context belongs upstream; this page owns the local prompt-to-message role boundary.

Banks before 2.5.0 can parse rendered untrusted prompt output as `ChatMessage` JSON with arbitrary roles. User-controlled prompt content can therefore cross from ordinary prompt data into privileged system, assistant, or tool message roles.

## Security Impact

- Threat: attacker-controlled prompt input can become privileged chat messages and alter instruction hierarchy or tool-message interpretation.
- Affected boundary: Banks before 2.5.0, `Prompt.chat_messages()`, rendered prompt output, `ChatMessage` JSON parsing, role assignment, and downstream LLM message construction.
- Exploit or incident status: public CVE Services record and GitHub advisory; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to Banks 2.5.0 or later and separate user-rendered content from privileged message-role construction.
- Confidence: high for affected range and fixed release; medium for downstream impact because severity depends on how applications pass rendered messages to models and tools.
- Residual risk: prompt-template libraries need explicit role-boundary tests because serialization conveniences can silently promote untrusted text into system or tool messages.

## Authoritative Sources

- [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json)
- [CVE-2026-107717 record](https://cveawg.mitre.org/api/cve/CVE-2026-107717)
- [GHSA-hmq2-7hp6-7crh](https://github.com/masci/banks/security/advisories/GHSA-hmq2-7hp6-7crh)
- [Banks 2.5.0 release](https://github.com/masci/banks/releases/tag/v2.5.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [Banks Directory Prompt Registry Symlink Traversal](../infrastructure-and-supply-chain/banks-directory-prompt-registry-symlink-traversal.md)
- [Decepticon ChatML role boundary forgery](decepticon-chatml-role-boundary-forgery.md)
- Upstream AI wiki owns broad prompt-template package coverage.

## Open Questions

- Which Banks 2.5.0 change prevents rendered untrusted data from being treated as privileged chat-message JSON?

## Maintenance Notes

- Created on 2026-10-09 from the [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json) as a prompt-role boundary leaf.
