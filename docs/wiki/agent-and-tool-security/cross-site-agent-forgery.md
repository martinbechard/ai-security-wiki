---
type: "Topic"
title: "Cross-Site Agent Forgery"
description: "Security analysis for web flaws that create or modify autonomous agents through a victim's authenticated session."
---

# Cross-Site Agent Forgery

## Current Understanding

Cross-site agent forgery is a delegated-authority variant of CSRF: a crafted web entry point can drive an authenticated agent-builder session into creating, publishing, scheduling, or reconfiguring an agent. The [July 24 topic news collector source](../../../raw/processed/2026-07-24/ai-security-wiki-topic-news-collector-2026-07-24T193213-0400.json) records [Zenity's AgentForger disclosure](https://zenity.io/company-overview/newsroom/company-news/zenity-labs-uncovers-agentforger-a-chatgpt-vulnerability) for [ChatGPT Workspace Agents](../../../upstream-ai-wiki/products/chatgpt-workspace-agents.md), where a crafted ChatGPT URL reportedly used an authenticated victim session to attach already-authorized connectors, lower approvals, publish the agent, schedule it, and run preview mode. Broad [AgentForger](../../../upstream-ai-wiki/techniques/agentforger.md) technique tracking belongs upstream.

Broad [OpenAI](../../../upstream-ai-wiki/companies/openai.md), [ChatGPT Workspace Agents](../../../upstream-ai-wiki/products/chatgpt-workspace-agents.md), and [AgentForger](../../../upstream-ai-wiki/techniques/agentforger.md) background belongs upstream. This page owns the local security boundary: agent-builder endpoints need anti-forgery protection, connector attachment needs explicit authorization checks, and approval-policy changes need human-visible confirmation because the resulting agent can persist beyond the initial browser action.

## Security Impact

- Threat: cross-site request flow turns a victim's active workspace session into persistent rogue-agent creation.
- Affected boundary: ChatGPT Workspace Agents builder, authenticated workspace sessions, already-authorized enterprise connectors, approval settings, preview mode, publishing, and scheduling.
- Exploit or incident status: public security research disclosure; [Zenity reports](https://zenity.io/company-overview/newsroom/company-news/zenity-labs-uncovers-agentforger-a-chatgpt-vulnerability) OpenAI fixed the issue on 2026-06-08 after responsible disclosure.
- Mitigation state: reported patched by the researcher; enterprises should review agent creation logs, connector attachments, approval-policy changes, and scheduled-agent inventory after comparable bugs.
- Confidence: medium-high because the disclosure comes from [Zenity primary research](https://labs.zenity.io/p/agentforger-part-1-chatgpt-cross-site-agent-forgery); fix status is researcher-reported unless an OpenAI advisory is later linked.
- Residual risk: connector grants and lowered approval settings may persist if platforms do not log and expose historical agent configuration changes.

## Authoritative Sources

- [July 24 topic news collector source](../../../raw/processed/2026-07-24/ai-security-wiki-topic-news-collector-2026-07-24T193213-0400.json)
- Zenity company disclosure: https://zenity.io/company-overview/newsroom/company-news/zenity-labs-uncovers-agentforger-a-chatgpt-vulnerability
- Zenity AgentForger part 1: https://labs.zenity.io/p/agentforger-part-1-chatgpt-cross-site-agent-forgery
- Zenity AgentForger part 2: https://labs.zenity.io/p/agentforger-part-2-the-autonomous-insider

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [approval metadata access control](approval-metadata-access-control.md)
- [identity and access](../identity-and-access/index.md)
- [data and privacy](../data-and-privacy/index.md)
- Upstream AI wiki owns broad OpenAI and ChatGPT product context.

## Open Questions

- Is there an OpenAI advisory or release note that independently confirms the fixed boundary and affected Workspace Agents versions?

## Maintenance Notes

- Added from the [July 24, 2026 topic collector](../../../raw/processed/2026-07-24/ai-security-wiki-topic-news-collector-2026-07-24T193213-0400.json); keep the page focused on agent-builder authorization, connector inheritance, and approval-policy persistence.
