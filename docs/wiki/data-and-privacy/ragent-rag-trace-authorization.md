---
type: "Topic"
title: "ragent RAG Trace Authorization"
description: "Security analysis for CVE-2026-129157 cross-user access to ragent RAG execution traces."
tags: ["data-and-privacy", "identity-and-access"]
---

# ragent RAG Trace Authorization

## Current Understanding

The [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json) records [CVE-2026-129157](https://nvd.nist.gov/vuln/detail/CVE-2026-129157): ragent 1.0.0 through 1.1.0 allowed any logged-in user to read other users' RAG traces, including identities, questions, and execution details. Broad ragent and RAG context belongs upstream; this leaf owns trace-data tenant isolation.

## Security Impact

- Threat: an authenticated user reads another user's sensitive RAG observability data.
- Affected boundary: ragent trace authorization in versions 1.0.0 through 1.1.0.
- Exploit or incident status: public CVE disclosure; no active exploitation or local incident is established.
- Mitigation state: apply per-tenant and per-owner authorization at trace APIs, minimize trace contents, and verify a maintainer fixed release.
- Confidence: medium-high because NVD includes code and issue references while a project fix is not established.
- Residual risk: traces can carry prompts, retrieved content, identities, and tool execution details even when primary application data is isolated.

## Authoritative Sources

- [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json)
- [NVD CVE-2026-129157](https://nvd.nist.gov/vuln/detail/CVE-2026-129157)
- [ragent issue 186](https://github.com/nageoffer/ragent/issues/186)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)

## Open Questions

- Which ragent release enforces tenant and owner authorization for every trace retrieval route?

## Maintenance Notes

- Created on 2026-11-13 as a data-isolation boundary distinct from knowledge-document rendering.
