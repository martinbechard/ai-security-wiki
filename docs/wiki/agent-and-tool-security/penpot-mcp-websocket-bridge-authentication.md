---
type: "Topic"
title: "Penpot MCP WebSocket Bridge Authentication"
description: "Security analysis for CVE-2026-100868 unauthenticated Penpot MCP WebSocket bridge access."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# Penpot MCP WebSocket Bridge Authentication

## Current Understanding

The [September 27 topic collector source](../../../raw/processed/2026-09-27/ai-security-wiki-topic-news-collector-2026-09-27T233044Z.json) records [CVE-2026-100868](https://nvd.nist.gov/vuln/detail/CVE-2026-100868) for Penpot before 2.18.0 in single-user mode. Broad Penpot product context belongs upstream; this page owns the local MCP plugin bridge authentication, task payload, and result-integrity boundary.

NVD, the [GitHub advisory](https://github.com/penpot/penpot/security/advisories/GHSA-22qr-rp27-j9wm), and [VulnCheck](https://www.vulncheck.com/advisories/penpot-before-2.18.0-unauthenticated-websocket-access-via-mcp-bridge) describe the MCP server plugin WebSocket bridge binding to all interfaces without authentication in single-user mode. Adjacent-network attackers can impersonate the Penpot browser plugin, intercept task payloads, and return forged results to the MCP client.

Affected boundary: Penpot before 2.18.0 in single-user mode.

Exploit or incident status: public advisory disclosure; local sources do not record confirmed active exploitation.

Mitigation state: upgrade to Penpot 2.18.0 or later and treat exposed single-user MCP bridge listeners as task payload and output-integrity incidents.

Confidence: high for affected and fixed versions from NVD plus linked advisory evidence.

Residual risk: MCP bridges that rely on local browser or desktop components need explicit listener authentication and interface binding controls; otherwise nearby network actors can become tool-result authorities.

## Authoritative Sources

- [September 27 topic collector source](../../../raw/processed/2026-09-27/ai-security-wiki-topic-news-collector-2026-09-27T233044Z.json)
- [NVD CVE-2026-100868](https://nvd.nist.gov/vuln/detail/CVE-2026-100868)
- [GitHub advisory GHSA-22qr-rp27-j9wm](https://github.com/penpot/penpot/security/advisories/GHSA-22qr-rp27-j9wm)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/penpot-before-2.18.0-unauthenticated-websocket-access-via-mcp-bridge)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [approval metadata access control](approval-metadata-access-control.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-27 from the September 27 collector and NVD enrichment as a focused MCP bridge authentication leaf.
