---
type: "Topic"
title: "IBM ContextForge Token-Exchange Cache Isolation"
description: "Security analysis for CVE-2026-110195 token-exchange cache isolation in ContextForge MCP Gateway."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# IBM ContextForge Token-Exchange Cache Isolation

## Current Understanding

The [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json) records [CVE-2026-110195](https://nvd.nist.gov/vuln/detail/CVE-2026-110195) as a token-exchange cache isolation failure in IBM ContextForge MCP Gateway. Broad ContextForge coverage belongs upstream; this leaf owns delegated-credential cache key isolation.

## Security Impact

- Threat: token-exchange state is reused across security principals or contexts that must remain separate.
- Affected boundary: the advisory set covers ContextForge MCP Gateway 1.0.0 through 1.0.11, with selected findings also affecting 1.1.0; CVE-2026-110195's individual affected and fixed versions require IBM PSIRT verification.
- Exploit or incident status: public NVD disclosure; no active exploitation or local incident is established.
- Mitigation state: follow IBM guidance, partition caches by tenant, subject, audience, issuer, and authorization context, and expire or revoke entries on context changes.
- Confidence: high for disclosure; individual affected-range and fixed-version evidence remains open.
- Residual risk: cache hits can silently amplify identity-misbinding mistakes across upstream services.

## Authoritative Sources

- [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json)
- [NVD CVE-2026-110195](https://nvd.nist.gov/vuln/detail/CVE-2026-110195)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)

## Open Questions

- Which cache-key dimensions and invalidation events does the IBM remediation enforce for token exchange?

## Maintenance Notes

- Created on 2026-11-13 as a delegated-credential cache boundary.
