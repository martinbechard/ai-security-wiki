---
type: "Topic"
title: "IBM ContextForge Identity-Claim Replay"
description: "Security analysis for CVE-2026-110278 identity-claim replay or exposure to third-party MCP servers."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# IBM ContextForge Identity-Claim Replay

## Current Understanding

The [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json) records [CVE-2026-110278](https://nvd.nist.gov/vuln/detail/CVE-2026-110278) as identity-claim replay or exposure to third-party MCP servers through ContextForge MCP Gateway. Broad ContextForge coverage belongs upstream; this leaf owns identity propagation to delegated MCP providers.

## Security Impact

- Threat: an identity claim can be replayed or disclosed beyond its intended third-party MCP server context.
- Affected boundary: the advisory set covers ContextForge MCP Gateway 1.0.0 through 1.0.11, with selected findings also affecting 1.1.0; CVE-2026-110278's individual affected and fixed versions require IBM PSIRT verification.
- Exploit or incident status: public NVD disclosure; no active exploitation or local incident is established.
- Mitigation state: follow IBM guidance, use audience-bound short-lived claims, minimize propagated identity data, and validate each recipient server's trust relationship.
- Confidence: high for disclosure; individual affected-range and fixed-version evidence remains open.
- Residual risk: identity propagation can turn an MCP routing layer into a cross-service identity broker.

## Authoritative Sources

- [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json)
- [NVD CVE-2026-110278](https://nvd.nist.gov/vuln/detail/CVE-2026-110278)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)

## Open Questions

- Which IBM PSIRT release binds claims to audience and prevents replay across third-party MCP servers?

## Maintenance Notes

- Created on 2026-11-13 as an identity-propagation boundary.
