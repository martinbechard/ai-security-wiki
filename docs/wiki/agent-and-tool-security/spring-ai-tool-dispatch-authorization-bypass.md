---
type: "Topic"
title: "Spring AI Tool Dispatch Authorization Bypass"
description: "Security analysis for CVE-2026-59318 Spring AI per-request tool-list enforcement failure."
tags: ["agent-and-tool-security", "identity-and-access", "model-and-prompt-security"]
---

# Spring AI Tool Dispatch Authorization Bypass

## Current Understanding

The [August 21 topic news collector source](../../../raw/processed/2026-08-21/ai-security-wiki-topic-news-collector-2026-08-21T233219Z.json) records CVE-2026-59318 as the most agent-specific item in the [Spring AI 2.0.1 security release](https://spring.io/blog/2026/08/21/spring-ai-2-0-1-available-now/). Broad [Java AI application framework](../../../upstream-ai-wiki/developer-tools/java-ai-application-frameworks.md) and release context belongs upstream; this page owns the local runtime authorization boundary between model-visible tools and server-enforced dispatch.

The [CVE-2026-59318 advisory](https://spring.io/security/cve-2026-59318/) says Spring AI advertised per-request tool lists to the model but did not fully enforce those lists during `DefaultToolCallingManager` dispatch. Under some conditions, a model or prompt-injection path could invoke a tool that was not available for the current request, creating privilege-escalation risk when tools carry different data, action, or administrative authority. The affected lines are Spring AI 2.0.0, 1.1.0 through 1.1.8, and 1.0.0 through 1.0.9; Spring AI 2.0.1 and listed enterprise fixes are the mitigation boundary captured by the source.

The [August 22 leaf update watch source](../../../raw/processed/2026-08-22/ai-security-wiki-leaf-update-watch-20260823T000329Z.json) corroborates the exact `DefaultToolCallingManager` boundary and records the fixed OSS version as Spring AI 2.0.1. It keeps the remaining local question focused on whether applications need per-tool authorization tests beyond the framework fix.

Related Spring AI 2.0.1 advisories are split into [semantic cache cross-context leakage](../data-and-privacy/spring-ai-semantic-cache-cross-context-leakage.md) and [Redis chat memory query injection](../data-and-privacy/spring-ai-redis-chat-memory-query-injection.md) because cache isolation and chat-memory query control can change independently from tool dispatch authorization.

## Security Impact

- Threat: prompt-level tool selection can become a misleading UI or model contract unless the runtime authorizes the final dispatched tool against the requesting context.
- Affected boundary: Spring AI tool calling in the affected 2.0.0, 1.1.x, and 1.0.x lines listed for CVE-2026-59318.
- Exploit or incident status: public Spring advisory; no local exploitation evidence is recorded.
- Mitigation state: update to Spring AI 2.0.1 or the listed enterprise-maintained fixed versions, and enforce per-request allowlists in dispatch code rather than only in prompt construction.
- Confidence: high for advisory identifiers, affected versions, and fix state because the collector cites primary Spring release and security pages.
- Residual risk: framework users still need tool-specific authorization and audit evidence because model-visible tool lists are not a sufficient authorization record.

## Authoritative Sources

- [August 21 topic news collector source](../../../raw/processed/2026-08-21/ai-security-wiki-topic-news-collector-2026-08-21T233219Z.json)
- [August 22 leaf update watch source](../../../raw/processed/2026-08-22/ai-security-wiki-leaf-update-watch-20260823T000329Z.json)
- Spring AI 2.0.1 release post: https://spring.io/blog/2026/08/21/spring-ai-2-0-1-available-now/
- Spring advisory CVE-2026-59318: https://spring.io/security/cve-2026-59318/

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP tool-level IAM authorization](../identity-and-access/mcp-tool-level-iam-authorization.md)
- [final query authorization for AI data tools](final-query-authorization-for-ai-data-tools.md)
- Upstream AI wiki owns broad [Java AI application framework](../../../upstream-ai-wiki/developer-tools/java-ai-application-frameworks.md) context if that coverage is needed.

## Open Questions

- Which Spring AI call paths, if any, still require application-level guardrails beyond the framework dispatch fix?

## Maintenance Notes

- Created on 2026-08-21 from the [August 21 topic collector](../../../raw/processed/2026-08-21/ai-security-wiki-topic-news-collector-2026-08-21T233219Z.json) as a separate tool-dispatch authorization leaf for CVE-2026-59318.
- Updated on 2026-08-22 from the [August 22 leaf update watch source](../../../raw/processed/2026-08-22/ai-security-wiki-leaf-update-watch-20260823T000329Z.json) with fixed-version and dispatch-path corroboration.
