---
type: "Topic"
title: "MCPHub Control Plane Advisory Cluster"
description: "Security analysis for the August 31 2026 MCPHub authorization, SSRF, prompt, and process-spawn CVE cluster."
tags: ["agent-and-tool-security", "identity-and-access", "infrastructure-and-supply-chain"]
---

# MCPHub Control Plane Advisory Cluster

## Current Understanding

The [August 31 topic collector source](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json) records a coordinated MCPHub advisory family: [CVE-2026-79743](https://nvd.nist.gov/vuln/detail/CVE-2026-79743), [CVE-2026-79744](https://nvd.nist.gov/vuln/detail/CVE-2026-79744), [CVE-2026-79745](https://nvd.nist.gov/vuln/detail/CVE-2026-79745), [CVE-2026-79746](https://nvd.nist.gov/vuln/detail/CVE-2026-79746), [CVE-2026-79747](https://nvd.nist.gov/vuln/detail/CVE-2026-79747), [CVE-2026-79748](https://nvd.nist.gov/vuln/detail/CVE-2026-79748), [CVE-2026-79749](https://nvd.nist.gov/vuln/detail/CVE-2026-79749), and [CVE-2026-79750](https://nvd.nist.gov/vuln/detail/CVE-2026-79750). MCPHub product and catalog context belongs upstream; this page owns the local security lens for MCP hub authority concentration.

The collector groups the advisories because the affected control plane can combine tenant isolation, prompt/resource integrity, outbound fetch, process spawning, bearer-key scope, and server-group authorization failures. The linked [GitHub Security Advisory](https://github.com/samanhappy/mcphub/security/advisories/GHSA-4gc8-885f-qj36) is the project advisory anchor; exact fixed versions vary by CVE and need per-advisory confirmation before operational guidance claims a single patched release.

## Security Impact

- Threat: a central MCP hub can turn one authenticated user or bearer key into broad tool, prompt, data, egress, and host-process authority.
- Affected boundary: MCPHub versions before 0.12.13, 0.12.15, 1.0.29, 1.0.30, 1.0.31, or 1.0.32 depending on CVE.
- Exploit or incident status: public NVD and GitHub advisory evidence; no local incident is recorded.
- Mitigation state: upgrade per CVE-specific fixed version, enforce admin checks on configuration mutation, isolate tenants and server groups, block private-network fetches, and restrict stdio server creation to trusted administrators.
- Confidence: high for the advisory family and security themes from NVD; medium for exact remediation boundaries until each GitHub advisory or release is reconciled.
- Residual risk: hub-style MCP routers need defense in depth because prompt/resource poisoning, SSRF, and process spawning can compound across user and server boundaries.

## Advisory Families

- MCPB file handling: ZIP path traversal and cleanup path deletion affect package import and cleanup boundaries.
- Authorization: missing admin checks, bearer-key scope expansion, and cross-tenant tool invocation affect user and server-group isolation.
- Prompt and resource integrity: non-admin global prompt/resource shadowing can alter model-visible instructions or resource content.
- Network and process authority: reflected SSRF, blind SSRF, IPv6 transition-address bypasses, and non-admin stdio server creation cross into egress and command-execution controls.

## Control Implications

- Treat MCP hubs as privileged control planes, not neutral proxies.
- Separate user tenant, server group, prompt/resource namespace, and bearer-key scopes.
- Require allow-listed egress and admin-only process-spawn configuration for server connectors.

## Authoritative Sources

- [August 31 topic collector source](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json)
- [GitHub Security Advisory GHSA-4gc8-885f-qj36](https://github.com/samanhappy/mcphub/security/advisories/GHSA-4gc8-885f-qj36)
- [NVD CVE-2026-79743](https://nvd.nist.gov/vuln/detail/CVE-2026-79743)
- [NVD CVE-2026-79744](https://nvd.nist.gov/vuln/detail/CVE-2026-79744)
- [NVD CVE-2026-79745](https://nvd.nist.gov/vuln/detail/CVE-2026-79745)
- [NVD CVE-2026-79746](https://nvd.nist.gov/vuln/detail/CVE-2026-79746)
- [NVD CVE-2026-79747](https://nvd.nist.gov/vuln/detail/CVE-2026-79747)
- [NVD CVE-2026-79748](https://nvd.nist.gov/vuln/detail/CVE-2026-79748)
- [NVD CVE-2026-79749](https://nvd.nist.gov/vuln/detail/CVE-2026-79749)
- [NVD CVE-2026-79750](https://nvd.nist.gov/vuln/detail/CVE-2026-79750)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP data movement exposure controls](../data-and-privacy/mcp-data-movement-exposure-controls.md)
- [MCP tool-level IAM authorization](../identity-and-access/mcp-tool-level-iam-authorization.md)

## Open Questions

- Which MCPHub release or release set is the minimum fixed boundary for each CVE in the advisory family?

## Maintenance Notes

- Created on 2026-08-31 from the [August 31 topic collector](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json) as a closely coupled advisory-family page because the CVEs share one MCP hub control plane and compound across authorization, prompt, egress, and process-spawn boundaries.
