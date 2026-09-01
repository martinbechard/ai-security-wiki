---
type: "Topic"
title: "sdcb chats MCP Fetch-Tools SSRF"
description: "Security analysis for CVE-2026-82905 sdcb chats MCP fetch-tools server-side request forgery."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain", "data-and-privacy"]
---

# sdcb chats MCP Fetch-Tools SSRF

## Current Understanding

The [August 31 topic collector source](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json) records [CVE-2026-82905](https://nvd.nist.gov/vuln/detail/CVE-2026-82905) for sdcb chats up to 1.12.0. Broad sdcb chats product coverage belongs upstream; this page owns the local MCP tool-discovery SSRF boundary.

NVD, the [VulDB record](https://vuldb.com/vuln/397285), and the referenced public [proof of concept](https://github.com/yaowenxiao721/Poc/blob/main/sdcb-chats/chats-poc-1.md) describe SSRF in `McpController.cs` for the `fetch-tools` endpoint. The issue is security-relevant because tool metadata fetching can move attacker-chosen network responses into MCP discovery and model-visible tool context.

## Security Impact

- Threat: remote callers can use MCP tool-discovery fetches to request internal or otherwise restricted URLs.
- Affected boundary: sdcb chats through 1.12.0, `fetch-tools` endpoint in `src/BE/web/Controllers/Users/Mcps/McpController.cs`.
- Exploit or incident status: public CVE, VulDB, and PoC evidence; vendor remediation is not identified in the raw source.
- Mitigation state: block private, loopback, link-local, metadata, and redirect destinations; require authentication and authorization before remote MCP tool metadata fetches.
- Confidence: medium-high for SSRF identity and affected component from NVD and PoC references; medium for remediation because a fixed release is not captured.
- Residual risk: even read-only tool discovery can become sensitive data movement when internal service responses are embedded in model context.

## Control Implications

- Apply egress allow-lists and DNS/IP re-resolution checks to MCP discovery fetches.
- Treat fetched tool metadata as untrusted content and avoid sending internal fetch errors or bodies directly into model context.
- Capture SSRF tests for IPv4, IPv6, redirects, DNS rebinding, and cloud metadata endpoints.

## Authoritative Sources

- [August 31 topic collector source](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json)
- [NVD CVE-2026-82905](https://nvd.nist.gov/vuln/detail/CVE-2026-82905)
- [Public proof of concept](https://github.com/yaowenxiao721/Poc/blob/main/sdcb-chats/chats-poc-1.md)
- [VulDB CVE-2026-82905](https://vuldb.com/cve/CVE-2026-82905)
- [VulDB vulnerability record](https://vuldb.com/vuln/397285)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [mcp-fetch IPv6 SSRF](mcp-fetch-ipv6-ssrf.md)
- [MCP data movement exposure controls](../data-and-privacy/mcp-data-movement-exposure-controls.md)

## Open Questions

- Is the sdcb chats `fetch-tools` endpoint reachable without authentication in typical deployments?

## Maintenance Notes

- Created on 2026-08-31 from the [August 31 topic collector](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json) as an MCP tool-discovery SSRF leaf.
