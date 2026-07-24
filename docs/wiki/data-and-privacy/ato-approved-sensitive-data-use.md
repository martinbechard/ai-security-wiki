---
type: "Topic"
title: "ATO-Approved Sensitive Data Use"
description: "Security controls for limiting sensitive-data use in generative AI tools to approved authorization boundaries."
---

# ATO-Approved Sensitive Data Use

## Current Understanding

The [July 23 topic news collector source](../../../raw/processed/2026-07-23/ai-security-wiki-topic-news-collector-2026-07-23T193409-0400.json) records [U.S. Department of Veterans Affairs guidance](https://department.va.gov/ai/guidance-for-generative-ai-use-at-va/) updated on July 23, 2026. The guidance says VA sensitive data may be used only with generative AI tools that have a VA Authority to Operate for that purpose, and that PHI, PII, and other sensitive data cannot be entered into tools whose ATO does not cover that data class.

Broad product entries for VA GPT, Microsoft Copilot Chat, GitHub Copilot, Claude for Gov, ChatGPT FedRAMP, and similar tools belong upstream. The local security control is data-class authorization: tool approval, identity authentication, authorized-use policy, user accountability, records management, and human review need to line up before sensitive prompts or outputs enter a generative AI system.

## Control Implications

- Bind generative AI tool approval to explicit data classes, not only to product availability.
- Require authenticated access and an approved ATO boundary before allowing PHI, PII, pre-decisional documents, or equivalent sensitive data.
- Distinguish all-employee tools from gated sensitive-data tools in user guidance and enforcement.
- Keep human review, records-management, security, privacy, and authorized-use obligations attached to AI output workflows.
- Treat unapproved public commercial tools as outside the sensitive-data boundary even when they are technically reachable.

## Authoritative Sources

- [July 23 topic news collector source](../../../raw/processed/2026-07-23/ai-security-wiki-topic-news-collector-2026-07-23T193409-0400.json)
- VA generative AI guidance: https://department.va.gov/ai/guidance-for-generative-ai-use-at-va/

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [identity and access](../identity-and-access/index.md)
- [governance and compliance](../governance-and-compliance/index.md)
- Upstream AI development wiki owns general employee AI adoption practice.

## Open Questions

- Which local AI tool categories require explicit data-class approval language beyond generic sensitive-data warnings?

## Maintenance Notes

- Added from the July 23, 2026 raw collector artifact; preserve agency-specific product approvals as source evidence, not as universal product recommendations.
