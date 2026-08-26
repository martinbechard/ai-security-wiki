---
type: "Topic"
title: "Chainlit MCP Setup Command And SSRF"
description: "Security analysis for Chainlit MCP setup advisories CVE-2026-45018 and CVE-2026-45019."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Chainlit MCP Setup Command And SSRF

## Current Understanding

The [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) records a Chainlit MCP advisory pair fixed in the [2.12.0 release](https://github.com/Chainlit/chainlit/releases/tag/2.12.0). Broad Chainlit framework context belongs upstream; this page owns the local MCP setup endpoint boundary for conversational AI applications.

[CVE-2026-45018](https://nvd.nist.gov/vuln/detail/CVE-2026-45018) describes unauthenticated `POST /mcp` access when MCP was enabled, with stdio transport accepting user-controlled `fullCommand` and unchecked arguments that can execute commands such as `npx -c`. [CVE-2026-45019](https://nvd.nist.gov/vuln/detail/CVE-2026-45019) covers the same unauthenticated setup surface for SSE and Streamable HTTP transports, accepting arbitrary URLs and headers and enabling blind SSRF to internal or metadata services. The shared issue is that connector setup crossed from user-facing app traffic into server-side process and network authority.

## Security Impact

- Threat: an unauthenticated web request can turn a Chainlit application into a command-execution or SSRF pivot through MCP setup.
- Affected boundary: Chainlit 2.4.0rc0 through before 2.12.0 when MCP is enabled; CVE-2026-45018 and CVE-2026-45019.
- Exploit or incident status: public vulnerability advisories; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: upgrade to 2.12.0 or later, authenticate MCP setup, constrain stdio commands, and restrict SSE/Streamable HTTP URLs and headers.
- Confidence: high for advisory identity, affected range, and fix release from NVD/GitHub evidence.
- Residual risk: AI app frameworks that let users configure connectors need explicit separation between chat traffic and privileged server-side connector creation.

## Control Implications

- Require authentication and authorization before any MCP connection setup endpoint accepts transport configuration.
- Use command templates and URL allowlists for connector creation; never accept arbitrary `fullCommand`, headers, or endpoint URLs from ordinary users.
- Log MCP setup actor, transport type, command template, URL, headers policy decision, and downstream connection target.

## Authoritative Sources

- [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json)
- [NVD CVE-2026-45018](https://nvd.nist.gov/vuln/detail/CVE-2026-45018)
- [NVD CVE-2026-45019](https://nvd.nist.gov/vuln/detail/CVE-2026-45019)
- [Chainlit MCP security advisory document](https://github.com/Chainlit/chainlit/blob/2.12.0/docs/security-advisory-2026-mcp.md)
- [Chainlit 2.12.0 release](https://github.com/Chainlit/chainlit/releases/tag/2.12.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [mcp-shell command policy bypasses](mcp-shell-command-policy-bypasses.md)
- [agent network egress controls](agent-network-egress-controls.md)
- [CKAN MCP Server SSRF filter bypass](ckan-mcp-server-ssrf-filter-bypass.md)

## Open Questions

- Which Chainlit deployment patterns expose `POST /mcp` to untrusted users by default when MCP is enabled?

## Maintenance Notes

- Created on 2026-08-26 from the [August 25 late topic collector](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) as a closely coupled MCP setup command/SSRF advisory family.
