---
type: "Topic"
title: "IBM ContextForge Bulk-Import Tenant Overwrite"
description: "Security analysis for CVE-2026-110178 cross-tenant bulk-import overwrite of MCP endpoints and credentials."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# IBM ContextForge Bulk-Import Tenant Overwrite

## Current Understanding

The [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json) records [CVE-2026-110178](https://nvd.nist.gov/vuln/detail/CVE-2026-110178): ContextForge MCP Gateway bulk import could overwrite another tenant's tool, resource, prompt endpoints, and credentials. Broad ContextForge coverage belongs upstream; this leaf owns control-plane import tenant isolation.

## Security Impact

- Threat: a tenant's import action alters another tenant's delegated-tool configuration and credentials.
- Affected boundary: the advisory set covers ContextForge MCP Gateway 1.0.0 through 1.0.11, with selected findings also affecting 1.1.0; CVE-2026-110178's individual affected and fixed versions require IBM PSIRT verification.
- Exploit or incident status: public NVD disclosure; no active exploitation or local incident is established.
- Mitigation state: follow the applicable IBM advisory, authorize imports per tenant and object, and audit imported public tool resources and credential changes.
- Confidence: high for the CVE disclosure; the individual affected range and remediation version are not established here.
- Residual risk: import workflows combine supply-chain content, tenant scope, and credential mutation.

## Authoritative Sources

- [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json)
- [NVD CVE-2026-110178](https://nvd.nist.gov/vuln/detail/CVE-2026-110178)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)

## Open Questions

- Which IBM PSIRT advisory and release prevent cross-tenant overwrite for every bulk-import object type?

## Maintenance Notes

- Created on 2026-11-13 as a tenant-isolation control-plane boundary.
