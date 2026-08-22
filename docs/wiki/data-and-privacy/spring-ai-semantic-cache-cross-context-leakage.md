---
type: "Topic"
title: "Spring AI Semantic Cache Cross-Context Leakage"
description: "Security analysis for CVE-2026-59308 semantic-cache isolation failure in Spring AI."
tags: ["data-and-privacy", "model-and-prompt-security", "infrastructure-and-supply-chain"]
---

# Spring AI Semantic Cache Cross-Context Leakage

## Current Understanding

The [August 21 topic news collector source](../../../raw/processed/2026-08-21/ai-security-wiki-topic-news-collector-2026-08-21T233219Z.json) records CVE-2026-59308 as a [Spring AI 2.0.1](https://spring.io/blog/2026/08/21/spring-ai-2-0-1-available-now/) fixed advisory for semantic-cache cross-context leakage. Broad [Java AI application framework](../../../upstream-ai-wiki/developer-tools/java-ai-application-frameworks.md) details belong upstream; this page owns the local cache-isolation and conversation-boundary implications.

The [CVE-2026-59308 advisory](https://spring.io/security/cve-2026-59308/) makes semantic caching an AI-specific data boundary because semantically similar prompts can reuse or reveal prior outputs across tenants, users, applications, or policy contexts if cache keys omit the right security dimensions. The collector identifies Spring AI 2.0.0 as affected and Spring AI 2.0.1 as the fixed OSS version for this issue.

The Spring AI advisory family is split because [tool dispatch authorization](../agent-and-tool-security/spring-ai-tool-dispatch-authorization-bypass.md), semantic-cache isolation, and [Redis chat memory query injection](spring-ai-redis-chat-memory-query-injection.md) require different controls and can receive different future advisories.

## Security Impact

- Threat: semantic-cache reuse can disclose outputs from a different context even when the current user or conversation should not see them.
- Affected boundary: Spring AI 2.0.0 semantic cache handling, as captured by CVE-2026-59308.
- Exploit or incident status: public Spring advisory; no local exploitation evidence is recorded.
- Mitigation state: update to Spring AI 2.0.1 and include tenant, user, policy, data-classification, and tool context in cache partitions where semantic caching remains enabled.
- Confidence: high for advisory existence and fix version from primary Spring sources; exact cache-key mechanics need later primary advisory review.
- Residual risk: semantically keyed caches can bypass conventional exact-key isolation tests unless security dimensions are part of test fixtures.

## Authoritative Sources

- [August 21 topic news collector source](../../../raw/processed/2026-08-21/ai-security-wiki-topic-news-collector-2026-08-21T233219Z.json)
- Spring AI 2.0.1 release post: https://spring.io/blog/2026/08/21/spring-ai-2-0-1-available-now/
- Spring advisory CVE-2026-59308: https://spring.io/security/cve-2026-59308/

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [model processing data residency controls](model-processing-data-residency-controls.md)
- [MCP data movement exposure controls](mcp-data-movement-exposure-controls.md)

## Open Questions

- Which cache partitioning fields does Spring AI 2.0.1 enforce for CVE-2026-59308?

## Maintenance Notes

- Created on 2026-08-21 from the [August 21 topic collector](../../../raw/processed/2026-08-21/ai-security-wiki-topic-news-collector-2026-08-21T233219Z.json) as the semantic-cache member of the Spring AI 2.0.1 advisory family.
