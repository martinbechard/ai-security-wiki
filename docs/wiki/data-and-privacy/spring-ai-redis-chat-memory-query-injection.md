---
type: "Topic"
title: "Spring AI Redis Chat Memory Query Injection"
description: "Security analysis for CVE-2026-59319 Redis chat-memory query injection in Spring AI."
tags: ["data-and-privacy", "infrastructure-and-supply-chain", "model-and-prompt-security"]
---

# Spring AI Redis Chat Memory Query Injection

## Current Understanding

The [August 21 topic news collector source](../../../raw/processed/2026-08-21/ai-security-wiki-topic-news-collector-2026-08-21T233219Z.json) records CVE-2026-59319 as a [Spring AI 2.0.1](https://spring.io/blog/2026/08/21/spring-ai-2-0-1-available-now/) fixed advisory for Redis chat-memory query injection. Broad [Java AI application framework](../../../upstream-ai-wiki/developer-tools/java-ai-application-frameworks.md) and Redis product background belongs upstream; this page owns the local memory-store query boundary for AI conversation data.

The [CVE-2026-59319 advisory](https://spring.io/security/cve-2026-59319/) identifies `RedisChatMemoryRepository` and says the issue can expose messages across conversations. The affected OSS line captured here is Spring AI 2.0.0, fixed in Spring AI 2.0.1. The security boundary is distinct from [tool dispatch authorization](../agent-and-tool-security/spring-ai-tool-dispatch-authorization-bypass.md) and [semantic cache cross-context leakage](spring-ai-semantic-cache-cross-context-leakage.md) because chat memory stores durable conversational content and may be queried by user, conversation, or application identifiers.

The [August 22 leaf update watch source](../../../raw/processed/2026-08-22/ai-security-wiki-leaf-update-watch-20260823T000329Z.json) adds the primary RediSearch mechanics: user-controlled metadata reaching tag queries can affect `RedisChatMemoryRepository.findByMetadata()` matching. The local fix expectation is therefore escaping and parameterization of RediSearch tag/text query material plus ownership checks on final conversation matches.

## Security Impact

- Threat: injected Redis chat-memory queries can cross conversation boundaries and expose stored AI messages.
- Affected boundary: Spring AI 2.0.0 `RedisChatMemoryRepository`, as captured by CVE-2026-59319.
- Exploit or incident status: public Spring advisory; no local exploitation evidence is recorded.
- Mitigation state: update to Spring AI 2.0.1 and validate that chat-memory queries parameterize identifiers and enforce conversation ownership.
- Confidence: high for advisory identifiers, fixed release, and RediSearch tag-query mechanics from Spring and watcher evidence.
- Residual risk: chat memory backends need authorization tests that cover malicious identifiers, not only normal conversation retrieval.

## Authoritative Sources

- [August 21 topic news collector source](../../../raw/processed/2026-08-21/ai-security-wiki-topic-news-collector-2026-08-21T233219Z.json)
- [August 22 leaf update watch source](../../../raw/processed/2026-08-22/ai-security-wiki-leaf-update-watch-20260823T000329Z.json)
- Spring AI 2.0.1 release post: https://spring.io/blog/2026/08/21/spring-ai-2-0-1-available-now/
- Spring advisory CVE-2026-59319: https://spring.io/security/cve-2026-59319/

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [AI coding telemetry access controls](ai-coding-telemetry-access-controls.md)
- [development agent credential isolation](../identity-and-access/development-agent-credential-isolation.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-08-21 from the [August 21 topic collector](../../../raw/processed/2026-08-21/ai-security-wiki-topic-news-collector-2026-08-21T233219Z.json) as the chat-memory data-isolation member of the Spring AI 2.0.1 advisory family.
- Updated on 2026-08-22 from the [August 22 leaf update watch source](../../../raw/processed/2026-08-22/ai-security-wiki-leaf-update-watch-20260823T000329Z.json) with RediSearch tag-query escape mechanics.
