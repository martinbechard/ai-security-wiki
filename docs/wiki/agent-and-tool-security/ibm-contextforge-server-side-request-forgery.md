---
type: "Topic"
title: "IBM ContextForge Server-Side Request Forgery"
description: "Security analysis for CVE-2026-110194 server-side request forgery in ContextForge MCP Gateway."
tags: ["agent-and-tool-security"]
---

# IBM ContextForge Server-Side Request Forgery

## Current Understanding

The [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json) records [CVE-2026-110194](https://nvd.nist.gov/vuln/detail/CVE-2026-110194) as server-side request forgery in IBM ContextForge MCP Gateway. Broad ContextForge coverage belongs upstream; this leaf owns this gateway egress boundary separately from older DNS-rebinding findings.

## Security Impact

- Threat: a request controlled through the gateway reaches network destinations that should not be exposed to the gateway runtime.
- Affected boundary: the advisory set covers ContextForge MCP Gateway 1.0.0 through 1.0.11, with selected findings also affecting 1.1.0; CVE-2026-110194's individual affected and fixed versions require IBM PSIRT verification.
- Exploit or incident status: public NVD disclosure; no active exploitation or local incident is established.
- Mitigation state: apply IBM maintenance guidance, restrict egress, canonicalize and allowlist destinations, and block private and metadata address ranges after resolution.
- Confidence: high for disclosure; individual affected-range and fixed-version evidence remains open.
- Residual risk: tool and gateway egress paths can create access to internal services despite application-layer authorization.

## Authoritative Sources

- [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json)
- [NVD CVE-2026-110194](https://nvd.nist.gov/vuln/detail/CVE-2026-110194)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [IBM ContextForge tool invocation DNS rebinding](ibm-contextforge-tool-invocation-dns-rebinding.md)

## Open Questions

- Which IBM PSIRT release remediates CVE-2026-110194, and do its destination checks resist redirect and DNS-rebinding changes?

## Maintenance Notes

- Created on 2026-11-13; this is distinct from endpoint-specific DNS-rebinding controls.
