---
type: "Topic"
title: "LangBot Lark Webhook Signature Bypass"
description: "Security analysis for CVE-2026-112265 forged Lark and Feishu events entering LangBot LLM workflows."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# LangBot Lark Webhook Signature Bypass

## Current Understanding

[CVE-2026-112265](https://nvd.nist.gov/vuln/detail/CVE-2026-112265) reports that LangBot through 4.11.0 does not verify Lark or Feishu webhook signatures. The [October 19 late collector](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T193149-0400.json) records that an actor knowing a bot UUID can forge message or card-action events that drive these flows as another user:

- LLM processing
- tool invocation
- approval handling

## Security Impact

- Threat: unauthenticated webhooks can impersonate users in agent-triggering workflows.
- Affected boundary: LangBot through 4.11.0 Lark/Feishu event ingress and downstream LLM, tool, and approval flows.
- Exploit or incident status: public CVE; active exploitation is not identified.
- Mitigation state: fixed version is not confirmed; enforce platform signature validation before any workflow dispatch.
- Confidence: high for the message-ingress boundary; medium for remediation state.
- Residual risk: bot UUIDs are identifiers, not authenticators, and should not authorize actions.

## Authoritative Sources

- [October 19 late collector source](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T193149-0400.json)
- [CVE-2026-112265](https://nvd.nist.gov/vuln/detail/CVE-2026-112265)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)

## Open Questions

- Which LangBot release verifies both message and card-action signatures?

## Maintenance Notes

- Created on 2026-10-20 from the October 19 late collector.
