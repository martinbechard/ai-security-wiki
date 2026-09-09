---
type: "Topic"
title: "llmware collection filter SQL injection"
description: "Security analysis for CVE-2026-85689 llmware collection-filter SQL injection and cross-document disclosure."
tags: ["data-and-privacy", "infrastructure-and-supply-chain"]
---

# llmware collection filter SQL injection

## Current Understanding

The [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json) records CVE-2026-85689 for llmware 0.4.6 collection filters. Broad llmware framework or RAG-library selection coverage belongs upstream; this page owns the retrieval metadata filter boundary where application code uses collection, document, tenant, author, or speaker filters to decide what context can reach an LLM workflow.

CVEAWG and NVD were visibly updated inside the run window. The collected evidence says `llmware/resources.py` interpolates filter and lookup values directly into SQL `WHERE` clauses for SQLite and PostgreSQL collection database paths. The key allow-list does not sanitize values, so attacker-controlled filters that reach `Library.block_lookup`, `Query.text_query_with_custom_filter`, or `Query.text_query_by_author_or_speaker` can bypass intended collection/document scoping and, on PostgreSQL, support boolean- and UNION-based SQL injection.

## Security Impact

- Threat: untrusted retrieval filters can read rows outside the intended document, collection, tenant, author, or speaker scope and contaminate or exfiltrate context supplied to an LLM.
- Affected boundary: llmware 0.4.6; `llmware/resources.py`; `Library.block_lookup`; `Query.text_query_with_custom_filter`; `Query.text_query_by_author_or_speaker`; SQLite and PostgreSQL backends.
- Exploit or incident status: public CVE, NVD, GitHub issue, source-file, and VulnCheck advisory evidence; no local exploitation incident is recorded.
- Mitigation state: fixed-version state was not established from the collector source; use parameterized queries and value-level validation for retrieval metadata filters.
- Confidence: high for advisory existence, in-window CVEAWG/NVD update timing, affected APIs, and cross-document disclosure impact; medium for remediation availability.
- Residual risk: RAG systems that treat metadata filters as trusted strings can leak private context even when vector retrieval, chunk storage, or downstream model calls appear correctly scoped.

## Authoritative Sources

- [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json)
- [CVE-2026-85689 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-85689)
- [CVE-2026-85689 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-85689)
- [llmware issue 1304](https://github.com/llmware-ai/llmware/issues/1304)
- [llmware 0.4.6 resources.py](https://github.com/llmware-ai/llmware/blob/v0.4.6/llmware/resources.py)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/llmware-0.4.6-sql-injection-via-unescaped-filter-values)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [MCP data movement exposure controls](mcp-data-movement-exposure-controls.md)
- [Spring AI Redis chat memory query injection](spring-ai-redis-chat-memory-query-injection.md)
- [infrastructure and supply chain](../infrastructure-and-supply-chain/index.md)

## Open Questions

- Whether a public fixed llmware release exists is not yet identified from the ingested source.

## Maintenance Notes

- Created on 2026-09-08 from the September 8 topic collector as a retrieval-filter data-boundary leaf after routing broad llmware framework coverage upstream.
