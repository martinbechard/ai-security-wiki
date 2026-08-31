---
type: "Topic"
title: "pg-aiguide MCP DNS Rebinding Host Allow-List"
description: "Security analysis for CVE-2026-81095 pg-aiguide MCP HTTP transport Host allow-list bypass."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# pg-aiguide MCP DNS Rebinding Host Allow-List

## Current Understanding

The [August 30 topic collector source](../../../raw/processed/2026-08-30/ai-security-wiki-topic-news-collector-2026-08-30T233055Z.json) records [CVE-2026-81095](https://nvd.nist.gov/vuln/detail/CVE-2026-81095) for pg-aiguide through 0.5.0. Broad pg-aiguide, Timescale, and MCP server catalog context belongs upstream; this page owns the local browser-origin Host validation boundary.

NVD and the [VulnCheck advisory](https://www.vulncheck.com/advisories/timescale-pg-aiguide-through-0.5.0-dns-rebinding-via-disabled-host-header-allow-list) describe an MCP HTTP transport started without the SDK host allow-list. A malicious browser page could use DNS rebinding through an attacker-controlled hostname to drive a locally reachable pg-aiguide MCP server. The [0.5.1 patch](https://github.com/timescale/pg-aiguide/pull/121) explicitly passes the protection option.

## Security Impact

- Threat: browser-origin DNS rebinding can cross from untrusted web content into local MCP tool authority.
- Affected boundary: pg-aiguide through 0.5.0 MCP HTTP transport and SDK Host header allow-list configuration.
- Exploit or incident status: public vulnerability database and advisory evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade to 0.5.1 or later, enable SDK Host allow-list protection, validate Origin and Host before session initialization, and require authentication for local MCP transports.
- Confidence: high for advisory identity, affected range, and patch intent from NVD, VulnCheck, and the pull request; the collector used an in-window NVD lastModified timestamp.
- Residual risk: locally bound MCP servers remain browser reachable when deployments treat Host checks as optional hardening instead of delegated-tool authorization.

## Control Implications

- Treat local MCP HTTP transports as exposed to browser-origin traffic unless Host, Origin, authentication, and session binding are all enforced.
- Record the SDK transport option state during agent-tool inventory.
- Test DNS rebinding and simple browser request paths before approving a local MCP server for database-adjacent tool authority.

## Authoritative Sources

- [August 30 topic collector source](../../../raw/processed/2026-08-30/ai-security-wiki-topic-news-collector-2026-08-30T233055Z.json)
- [NVD CVE-2026-81095](https://nvd.nist.gov/vuln/detail/CVE-2026-81095)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/timescale-pg-aiguide-through-0.5.0-dns-rebinding-via-disabled-host-header-allow-list)
- [pg-aiguide patch pull request](https://github.com/timescale/pg-aiguide/pull/121)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [mcp-go DNS rebinding host validation](mcp-go-dns-rebinding-host-validation.md)
- [genieacs-mcp loopback DNS rebinding](genieacs-mcp-loopback-dns-rebinding.md)

## Open Questions

- Which pg-aiguide deployments expose database or repository authority through local MCP transports?

## Maintenance Notes

- Created on 2026-08-30 from the [August 30 topic collector](../../../raw/processed/2026-08-30/ai-security-wiki-topic-news-collector-2026-08-30T233055Z.json) as a product-specific MCP Host allow-list advisory leaf.
