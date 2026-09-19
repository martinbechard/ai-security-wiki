---
type: "Topic"
title: "cc-connect Card Callback Command Authorization"
description: "Security analysis for CVE-2026-92801 Feishu card callbacks bypassing cc-connect per-user agent-command allowlists."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# cc-connect Card Callback Command Authorization

## Current Understanding

The [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) records [CVE-2026-92801](https://cveawg.mitre.org/api/cve/CVE-2026-92801) for cc-connect through 1.5.0. General chat-agent workflow context belongs upstream in ai-dev-wiki; this page owns the local alternate callback-path authorization boundary.

The CVE says Feishu interactive-card `onCardAction` handling does not enforce the same per-user allowlist filtering as the text-message handler. Attackers who can trigger card actions in admitted chats can dispatch agent commands while bypassing per-user access controls.

## Security Impact

- Threat: a shared chat card callback can invoke agent commands through a path that lacks the user's normal command allowlist.
- Affected boundary: cc-connect through 1.5.0, Feishu interactive-card callbacks, admitted chat membership, and per-user command authorization.
- Exploit or incident status: public CVE and upstream issue/code references; no local exploitation incident is recorded.
- Mitigation state: enforce the same per-user allowlist at every command ingress path, including text messages, cards, webhooks, and callbacks; log callback-origin principals.
- Confidence: high for publication and affected version after direct CVE Services re-fetch; medium for exploit prerequisites until upstream issue detail is reconciled.
- Residual risk: agent command surfaces often grow secondary UI callback paths, so authorization tests must cover every dispatch path rather than only the primary chat parser.

## Authoritative Sources

- [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json)
- [CVE-2026-92801 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-92801)
- [cc-connect repository](https://github.com/chenhg5/cc-connect)
- [cc-connect issue 1852](https://github.com/chenhg5/cc-connect/issues/1852)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP tool-level IAM authorization](../identity-and-access/mcp-tool-level-iam-authorization.md)
- [Coding agent command approval boundaries](coding-agent-command-approval-boundaries.md)

## Open Questions

- Which cc-connect patch adds equivalent allowlist checks to Feishu card callbacks?

## Maintenance Notes

- Created on 2026-09-19 from the [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json).
