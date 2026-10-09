---
type: "Topic"
title: "Splunk MCP Custom API Tool Token Forwarding"
description: "Security analysis for CVE-2026-76286 SSRF and Splunk token exposure through custom API tools in Splunk MCP Server."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# Splunk MCP Custom API Tool Token Forwarding

## Current Understanding

The [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json) records Splunk SVD-2026-1004 and [CVE-2026-76286](https://cveawg.mitre.org/api/cve/CVE-2026-76286) for Splunk MCP Server custom API tools. Broad Splunk product context belongs upstream; this page owns the local MCP custom-tool SSRF and token-forwarding boundary.

Splunk says a user with `mcp_tool_admin` can configure a custom API tool that sends requests to an attacker-controlled URL. A separate user with `mcp_tool_execute` who runs that tool can then expose their Splunk platform authentication token to the configured URL. Splunk MCP Server 1.2 is affected below fixed version 1.2.1.

## Security Impact

- Threat: one role configures a malicious custom API destination and another role later forwards their Splunk token when executing the tool.
- Affected boundary: Splunk MCP Server 1.2 before 1.2.1, custom API tools, `mcp_tool_admin`, `mcp_tool_execute`, outbound URL configuration, and Splunk authentication token forwarding.
- Exploit or incident status: vendor security advisory and public CVE record; no confirmed exploitation incident is recorded locally.
- Mitigation state: upgrade to Splunk MCP Server 1.2.1 or later, restrict custom API destinations, and avoid forwarding platform tokens to arbitrary tool-defined hosts.
- Confidence: high for vendor advisory facts; medium for operational mitigation details because the direct SVD page was not fully accessible during collection.
- Residual risk: MCP tool administration and execution must be separated with destination allow-lists because tool configuration can create delayed exfiltration paths for later users.

## Authoritative Sources

- [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json)
- [CVE-2026-76286 record](https://cveawg.mitre.org/api/cve/CVE-2026-76286)
- [Splunk SVD-2026-1004 advisory](https://advisory.splunk.com/advisories/SVD-2026-1004)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP data movement exposure controls](../data-and-privacy/mcp-data-movement-exposure-controls.md)
- [agent network egress controls](agent-network-egress-controls.md)
- Upstream AI wiki owns broad [Splunk MCP Server coverage](../../../upstream-ai-wiki/mcp-servers/splunk-mcp-server.md).

## Open Questions

- Does Splunk MCP Server 1.2.1 block arbitrary destinations, suppress auth-token forwarding, or require both controls?

## Maintenance Notes

- Created on 2026-10-09 from the [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json), preserving the two-role admin-versus-executor condition.
