---
type: "Topic"
title: "Flexible GraphRAG FalkorDB Ingestion Cypher Injection"
description: "Security analysis for CVE-2026-114510 model-mediated document ingestion reaching FalkorDB Cypher execution."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# Flexible GraphRAG FalkorDB Ingestion Cypher Injection

## Current Understanding

The [October 22 topic collector source](../../../raw/processed/2026-10-22/ai-security-wiki-topic-news-collector-2026-10-22T232635Z.json) records [CVE-2026-114510](https://cveawg.mitre.org/api/cve/CVE-2026-114510) / [GHSA-vqrg-773h-4wxc](https://github.com/stevereiner/flexible-graphrag/security/advisories/GHSA-vqrg-773h-4wxc). Broad Flexible GraphRAG and RAG-framework context belongs upstream; this leaf owns the untrusted-ingestion to graph-query integrity boundary.

## Security Impact

- Threat: attacker-influenced documents can cause model-extracted values to alter or delete FalkorDB graph data, and can disclose graph data when results reach a user or model.
- Affected boundary: Flexible GraphRAG 0.6.0 through before 0.8.2 with `GRAPH_BACKEND=langchain` and `GRAPH_DB=falkordb`; LlamaIndex FalkorDB is not affected.
- Exploit or incident status: public maintainer advisory and CVE disclosure; no exploitation incident is recorded locally.
- Mitigation state: upgrade to 0.8.2 or later, parameterize query data values, and treat model-extracted graph fields as untrusted input.
- Confidence: high because the source identifies the affected configuration, non-affected alternative, fixed version, and maintainer advisory.
- Residual risk: escaping rules alone can fail across model-mediated extraction and query construction; query authority must remain separate from document content.

## Authoritative Sources

- [October 22 topic collector source](../../../raw/processed/2026-10-22/ai-security-wiki-topic-news-collector-2026-10-22T232635Z.json)
- [GHSA-vqrg-773h-4wxc](https://github.com/stevereiner/flexible-graphrag/security/advisories/GHSA-vqrg-773h-4wxc)
- [Flexible GraphRAG 0.8.2 release](https://github.com/stevereiner/flexible-graphrag/releases/tag/v0.8.2)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [final query authorization for AI data tools](final-query-authorization-for-ai-data-tools.md)

## Open Questions

- Does the 0.8.2 fix parameterize every FalkorDB write and read value, including values produced by retries or alternative extraction paths?

## Maintenance Notes

- Created on 2026-10-22 from the October 22 topic collector; preserve the configuration and LlamaIndex scope distinction.
