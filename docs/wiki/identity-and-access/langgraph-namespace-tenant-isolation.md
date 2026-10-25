---
type: "Topic"
title: "LangGraph Namespace Tenant Isolation"
description: "Security analysis for GHSA-6hmw-9432-67qq persisted namespace collisions."
tags: ["identity-and-access", "data-and-privacy"]
---

# LangGraph Namespace Tenant Isolation

## Current Understanding

The [October 23 collector](../../../raw/processed/2026-10-23/ai-security-wiki-topic-news-collector-2026-10-23T233200Z.json) records [GHSA-6hmw-9432-67qq](https://github.com/langchain-ai/langgraph/security/advisories/GHSA-6hmw-9432-67qq): dot-delimited serialization lets `(tenant, bob)` collide with `(tenant.bob)` in LangGraph Postgres and SQLite stores. The [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json) independently identifies the same boundary as [CVE-2026-115883](https://nvd.nist.gov/vuln/detail/CVE-2026-115883). Broad LangGraph context belongs [upstream](../../../upstream-ai-wiki/agentic-frameworks/langgraph.md); this page owns tenant-state isolation.

## Security Impact

- Threat: untrusted namespace labels cause cross-tenant reads, overwrites, or deletes.
- Affected boundary: langgraph-checkpoint-postgres before 3.1.3 and SQLite before 3.1.2; InMemoryStore is not affected.
- Exploit or incident status: maintainer advisory; no local incident is recorded.
- Mitigation state: upgrade Postgres to 3.1.3 or SQLite to 3.1.2 with langgraph-checkpoint 4.3.0; reject empty, non-string, and dot-containing labels everywhere.
- Confidence: high for scope, affected stores, and remediation.
- Residual risk: state-store authorization depends on lossless key encoding and batch-path parity.

## Authoritative Sources

- [October 23 collector](../../../raw/processed/2026-10-23/ai-security-wiki-topic-news-collector-2026-10-23T233200Z.json)
- [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json)
- [October 24 leaf watch](../../../raw/processed/2026-10-24/ai-security-wiki-leaf-update-watch-20261025T000016Z.json)
- [CVE-2026-115883](https://nvd.nist.gov/vuln/detail/CVE-2026-115883)
- [GHSA-6hmw-9432-67qq](https://github.com/langchain-ai/langgraph/security/advisories/GHSA-6hmw-9432-67qq)
- [Postgres 3.1.3](https://github.com/langchain-ai/langgraph/releases/tag/checkpointpostgres%3D%3D3.1.3)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [Strands A2A Conversation-State Isolation](strands-a2a-conversation-state-isolation.md)

## Open Questions

- Which deployments accept tenant labels from request input or batch operations?

## Maintenance Notes

- Updated on 2026-10-24 from the [October 24 leaf watch](../../../raw/processed/2026-10-24/ai-security-wiki-leaf-update-watch-20261025T000016Z.json), which corroborated the existing boundary without changing current understanding or adding a duplicate digest item.
- Updated on 2026-10-24 with October 24 collector provenance and the CVE-2026-115883 alias; the collector corroborates the existing persistent-store boundary without adding a duplicate digest item.
- Created on 2026-10-23 as a tenant-state serialization boundary.
