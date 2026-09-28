---
type: "Topic"
title: "UTCP MCP Server URL Validation"
description: "Security analysis for CVE-2026-101057 unvalidated MCP server URLs in utcp-mcp."
tags: ["agent-and-tool-security"]
---

# UTCP MCP Server URL Validation

## Current Understanding

The [September 27 topic collector source](../../../raw/processed/2026-09-27/ai-security-wiki-topic-news-collector-2026-09-27T233044Z.json) records [CVE-2026-101057](https://nvd.nist.gov/vuln/detail/CVE-2026-101057) for `utcp-mcp` through 1.1.2. Broad UTCP protocol coverage belongs upstream; this page owns the local MCP server URL validation and cleartext/internal-host connection boundary.

NVD, the [GitHub advisory](https://github.com/universal-tool-calling-protocol/python-utcp/security/advisories/GHSA-qwr9-cj2c-v3fv), and [VulnCheck](https://www.vulncheck.com/advisories/utcp-mcp-before-1.1.3-ssrf-via-unvalidated-mcp-server-url) describe `utcp-mcp` connecting to HTTP and WebSocket MCP server URLs from a call template's `mcpServers` configuration without the `ensure_secure_url` validation used by HTTP-family plugins. The issue permits plain HTTP, non-loopback MCP server URLs and internal-host connections, although NVD notes the configuration is operator-authored and the interaction is an MCP handshake rather than arbitrary body-returning SSRF.

Affected boundary: `utcp-mcp` through 1.1.2, fixed in 1.1.3.

Exploit or incident status: public advisory disclosure; local sources do not record confirmed active exploitation.

Mitigation state: upgrade `utcp-mcp` to 1.1.3 or later and reject non-loopback cleartext MCP server URLs in templates.

Confidence: high for affected and fixed versions from NVD plus linked advisory evidence; medium for practical exploitability because NVD describes operator-authored configuration and handshake-only reach.

Residual risk: agent clients that treat call templates as reusable authority should audit template provenance because URL validation gaps can downgrade tool connections or cross internal network boundaries.

## Authoritative Sources

- [September 27 topic collector source](../../../raw/processed/2026-09-27/ai-security-wiki-topic-news-collector-2026-09-27T233044Z.json)
- [NVD CVE-2026-101057](https://nvd.nist.gov/vuln/detail/CVE-2026-101057)
- [GitHub advisory GHSA-qwr9-cj2c-v3fv](https://github.com/universal-tool-calling-protocol/python-utcp/security/advisories/GHSA-qwr9-cj2c-v3fv)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/utcp-mcp-before-1.1.3-ssrf-via-unvalidated-mcp-server-url)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [UTCP remote HTTP manual loopback SSRF](utcp-remote-http-manual-loopback-ssrf.md)
- [MCP context injection transparency](mcp-context-injection-transparency.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-27 from the September 27 collector and NVD enrichment as a focused UTCP MCP URL-validation leaf.
