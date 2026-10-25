---
type: "Topic"
title: "PraisonAI Discord Approval Request Binding"
description: "Security analysis for CVE-2026-56832 unrelated-channel approval acceptance."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# PraisonAI Discord Approval Request Binding

## Current Understanding

[CVE-2026-56832](https://nvd.nist.gov/vuln/detail/CVE-2026-56832), captured by the [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json), reports that unrelated Discord-channel text could approve a dangerous tool action. This page owns request-bound human approval, not upstream PraisonAI product context.

## Security Impact

- Threat: unrelated channel traffic authorizes a privileged agent action.
- Affected boundary: PraisonAI 4.5.2 before 4.6.59.
- Exploit or incident status: public disclosure; no local incident is recorded.
- Mitigation state: upgrade to 4.6.59 and bind approvals to actor, request, action, and expiry.
- Confidence: high for disclosed scope and fixed version.
- Residual risk: chat identity alone is insufficient authorization context.

## Authoritative Sources

- [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json)
- [CVE-2026-56832](https://nvd.nist.gov/vuln/detail/CVE-2026-56832)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)

## Open Questions

- Does the fixed implementation reject delayed and replayed approval messages?

## Maintenance Notes

- Created on 2026-10-24 after verifier-required split from the original approval family.
