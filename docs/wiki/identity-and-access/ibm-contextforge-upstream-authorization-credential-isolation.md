---
type: "Topic"
title: "IBM ContextForge Upstream-Authorization Credential Isolation"
description: "Security analysis for CVE-2026-110279 upstream-authorization credential isolation in ContextForge MCP Gateway."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# IBM ContextForge Upstream-Authorization Credential Isolation

## Current Understanding

The [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json) records [CVE-2026-110279](https://nvd.nist.gov/vuln/detail/CVE-2026-110279) as an upstream-authorization credential isolation failure in IBM ContextForge MCP Gateway. Broad ContextForge coverage belongs upstream; this leaf owns preservation of credential scope across gateway-to-upstream delegation.

## Security Impact

- Threat: a gateway can present credentials outside the intended upstream authorization context.
- Affected boundary: the advisory set covers ContextForge MCP Gateway 1.0.0 through 1.0.11, with selected findings also affecting 1.1.0; CVE-2026-110279's individual affected and fixed versions require IBM PSIRT verification.
- Exploit or incident status: public NVD disclosure; no active exploitation or local incident is established.
- Mitigation state: follow IBM guidance, bind upstream authorization headers to tenant, target, and tool context, and prevent fallback or cross-request reuse.
- Confidence: high for disclosure; individual affected-range and fixed-version evidence remains open.
- Residual risk: delegated credentials may be more privileged or longer lived than the action that caused their use.

## Authoritative Sources

- [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json)
- [NVD CVE-2026-110279](https://nvd.nist.gov/vuln/detail/CVE-2026-110279)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [IBM ContextForge token-exchange cache isolation](ibm-contextforge-token-exchange-cache-isolation.md)

## Open Questions

- Which IBM PSIRT release validates target, tenant, and tool context before forwarding upstream authorization?

## Maintenance Notes

- Created on 2026-11-13 as a credential-forwarding boundary separate from cache isolation.
