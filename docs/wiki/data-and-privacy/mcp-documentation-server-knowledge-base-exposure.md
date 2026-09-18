---
type: "Topic"
title: "MCP Documentation Server Knowledge Base Exposure"
description: "Security analysis for CVE-2026-54504 unauthenticated document API exposure in MCP Documentation Server."
tags: ["data-and-privacy", "agent-and-tool-security"]
---

# MCP Documentation Server Knowledge Base Exposure

## Current Understanding

The [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) records CVE-2026-54504 for MCP Documentation Server. Broad MCP Documentation Server product context belongs upstream; this page owns the local assistant-knowledge-store boundary where an automatically started Web UI API can expose and poison documents used by an MCP assistant.

The CVE says versions 1.13.0 through 1.13.1 automatically started a Web UI API on port 3080 using `app.listen` without a host, binding an unauthenticated document-management API to all interfaces. Network-reachable clients could read, search, insert, delete, or tamper with the MCP assistant knowledge base. The raw collector notes a version wording tension because the record says "from 1.13.0 until 1.13.1" and also "fixed in 1.13.1"; keep that as unresolved until release evidence clarifies the fixed boundary.

## Security Impact

- Threat: unauthenticated network clients can read private assistant context or poison documents later trusted by MCP-driven answers.
- Affected boundary: MCP Documentation Server Web UI API on port 3080, document insertion/deletion/search paths, and assistant knowledge-base content.
- Exploit or incident status: public CVE record; no local exploitation incident is recorded.
- Mitigation state: bind document APIs to loopback or an authenticated interface, upgrade to the clarified fixed version, and audit any knowledge base modified while the Web UI API was reachable.
- Confidence: medium-high for API exposure and data/poisoning impact; medium for exact fixed-version wording until primary release notes are reconciled.
- Residual risk: documentation servers can become prompt-context supply-chain inputs when write APIs are exposed without authentication.

## Authoritative Sources

- [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json)
- [CVE-2026-54504 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-54504)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [MCP data movement exposure controls](mcp-data-movement-exposure-controls.md)
- [MCP context injection transparency](../agent-and-tool-security/mcp-context-injection-transparency.md)

## Open Questions

- Does MCP Documentation Server 1.13.1 remain affected, or is 1.13.1 the fixed release boundary?

## Maintenance Notes

- Created on 2026-09-18 from the [September 17 topic collector](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) as a knowledge-base exposure and poisoning leaf.
