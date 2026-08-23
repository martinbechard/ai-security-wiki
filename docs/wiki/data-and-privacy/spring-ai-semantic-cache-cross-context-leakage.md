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

The [August 22 leaf update watch source](../../../raw/processed/2026-08-22/ai-security-wiki-leaf-update-watch-20260823T000329Z.json) adds GHSA-h4jw-w55g-65gf and records SHA-256 truncation as the now-public isolation detail. The local control implication remains unchanged: semantic-cache partitions need security dimensions that cannot collide or collapse across unrelated system-prompt contexts.

The Spring AI advisory family is split because [tool dispatch authorization](../agent-and-tool-security/spring-ai-tool-dispatch-authorization-bypass.md), semantic-cache isolation, and [Redis chat memory query injection](spring-ai-redis-chat-memory-query-injection.md) require different controls and can receive different future advisories.

## Security Impact

- Threat: semantic-cache reuse can disclose outputs from a different context even when the current user or conversation should not see them.
- Affected boundary: Spring AI 2.0.0 semantic cache handling, as captured by CVE-2026-59308.
- Exploit or incident status: public Spring advisory; no local exploitation evidence is recorded.
- Mitigation state: update to Spring AI 2.0.1 and include tenant, user, policy, data-classification, and tool context in cache partitions where semantic caching remains enabled.
- Confidence: high for advisory existence, fix version, and SHA-256 truncation mechanics from primary Spring and watcher evidence.
- Residual risk: semantically keyed caches can bypass conventional exact-key isolation tests unless security dimensions are part of test fixtures.

## Authoritative Sources

- [August 21 topic news collector source](../../../raw/processed/2026-08-21/ai-security-wiki-topic-news-collector-2026-08-21T233219Z.json)
- [August 22 leaf update watch source](../../../raw/processed/2026-08-22/ai-security-wiki-leaf-update-watch-20260823T000329Z.json)
- Spring AI 2.0.1 release post: https://spring.io/blog/2026/08/21/spring-ai-2-0-1-available-now/
- Spring advisory CVE-2026-59308: https://spring.io/security/cve-2026-59308/
- GitHub advisory GHSA-h4jw-w55g-65gf: https://github.com/advisories/ghsa-h4jw-w55g-65gf

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

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-08-21 from the [August 21 topic collector](../../../raw/processed/2026-08-21/ai-security-wiki-topic-news-collector-2026-08-21T233219Z.json) as the semantic-cache member of the Spring AI 2.0.1 advisory family.
- Updated on 2026-08-22 from the [August 22 leaf update watch source](../../../raw/processed/2026-08-22/ai-security-wiki-leaf-update-watch-20260823T000329Z.json) with GHSA alias and SHA-256 truncation isolation detail.
