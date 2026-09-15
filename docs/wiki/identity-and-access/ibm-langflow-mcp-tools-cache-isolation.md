---
type: "Topic"
title: "IBM Langflow MCP Tools cache isolation"
description: "Security analysis for CVE-2026-12763 IBM Langflow MCP Tools cache-key isolation exposing another user's MCP context."
tags: ["identity-and-access", "agent-and-tool-security", "data-and-privacy"]
---

# IBM Langflow MCP Tools cache isolation

## Current Understanding

The [September 14 topic collector source](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json) records [CVE-2026-12763](https://cveawg.mitre.org/api/cve/CVE-2026-12763) for IBM Langflow OSS 1.0.0 through 1.11.5. Broad Langflow product and MCP workflow coverage belongs upstream; this page owns the local per-user MCP context isolation boundary.

The CVE says an authenticated attacker could access another user's MCP server context because the MCP Tools component used improper cache-key isolation. MCP server context can include delegated tool authority and connection state, so cache keys are an authorization boundary rather than only a performance detail.

## Security Impact

- Threat: authenticated users can cross into another user's MCP context when cache entries are not scoped by stable user and workspace principals.
- Affected boundary: IBM Langflow OSS 1.0.0 through 1.11.5, MCP Tools component, cache-key construction, and MCP server context.
- Exploit or incident status: public CVE and IBM advisory reference; no local exploitation incident is recorded.
- Mitigation state: apply the IBM Langflow fix when available and ensure MCP context caches include user, workspace, and server identity in the cache key.
- Confidence: high for the affected range and isolation failure; medium for remediation details until IBM's fixed-release wording is reconciled locally.
- Residual risk: MCP context can carry sensitive connection material, available tools, or delegated access assumptions, so shared caches must be designed as multi-tenant security controls.

## Authoritative Sources

- [September 14 topic collector source](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json)
- [CVE-2026-12763 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-12763)
- [IBM support advisory](https://www.ibm.com/support/pages/node/7286662)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [IBM Langflow MCP stdio command execution](../agent-and-tool-security/ibm-langflow-mcp-stdio-command-execution.md)
- [IBM Langflow public MCP endpoint RCE](../agent-and-tool-security/ibm-langflow-public-mcp-endpoint-rce.md)

## Open Questions

- Which IBM Langflow release fixes CVE-2026-12763, and what principals are included in the corrected MCP Tools cache key?

## Maintenance Notes

- Created on 2026-09-15 from the [September 14 topic collector](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json) as a per-user MCP context isolation leaf.
