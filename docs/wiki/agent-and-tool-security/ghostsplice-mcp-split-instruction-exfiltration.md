---
type: "Topic"
title: "GhostSplice MCP Split Instruction Exfiltration"
description: "Security analysis for malicious MCP servers that split instructions across trusted agent channels."
tags: ["agent-and-tool-security", "model-and-prompt-security", "data-and-privacy"]
---

# GhostSplice MCP Split Instruction Exfiltration

## Current Understanding

GhostSplice is a demonstrated MCP prompt-injection technique where a malicious or compromised MCP server places separately innocuous instruction fragments in tool descriptions, tool results, and sampling channels. The [August 11 topic news collector source](../../../raw/processed/2026-08-11/ai-security-wiki-topic-news-collector-2026-08-11T233115Z.json) records [The Hacker News reporting](https://thehackernews.com/2026/08/malicious-mcp-servers-can-split.html) and the [ASSET Research Group disclosure](https://asset-group.github.io/disclosures/ghostsplice/) as supporting technical evidence.

Broad MCP protocol and server-catalog context belongs upstream in the [MCP security best practices](../../../upstream-ai-wiki/techniques/mcp-security-best-practices.md) and MCP protocol leaves. The local security boundary is narrower: an agent may recombine trusted-looking MCP metadata and results into a malicious objective, then exfiltrate SSH keys, `.env` files, source code, or customer data reachable to the agent. The collected evidence describes controlled tests with fake credentials and no CVE identifier or confirmed in-the-wild incident.

## Security Impact

- Threat: malicious MCP servers can smuggle an exfiltration objective across multiple trusted agent channels instead of relying on one obvious hostile instruction.
- Affected boundary: MCP-connected coding agents, MCP tool metadata, tool results, sampling channels, filesystem read access, secret stores, and outbound destinations.
- Exploit or incident status: controlled proof of concept; no confirmed exploitation in the collected source.
- Mitigation state: require MCP server allowlisting, metadata review, prompt-injection filtering across tool descriptions and results, secret-scope denial, and egress monitoring.
- Confidence: high for the in-window secondary report and local security relevance; medium for exact primary publication date because the disclosure page exposed only July 2026 in the collected source.
- Residual risk: protocol-level channel separation does not prove model-level intent separation when the same agent consumes all fragments.

## Control Implications

- Treat MCP server metadata, tool results, and sampling output as untrusted input even when the server itself is approved.
- Deny agent access to SSH keys, environment files, customer data, and source trees unless the task explicitly requires that data class.
- Apply egress controls to coding-agent sessions so a successful prompt injection cannot silently deliver sensitive files to attacker infrastructure.
- Log tool metadata, tool results, sampling events, destination URLs, and file-read attempts together so split-channel instruction chains are reconstructable.
- Review newly added MCP servers as supply-chain components, not only as API connectors.

## Authoritative Sources

- [August 11 topic news collector source](../../../raw/processed/2026-08-11/ai-security-wiki-topic-news-collector-2026-08-11T233115Z.json)
- The Hacker News GhostSplice report: https://thehackernews.com/2026/08/malicious-mcp-servers-can-split.html
- ASSET Research Group GhostSplice disclosure: https://asset-group.github.io/disclosures/ghostsplice/

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [coding agent command approval boundaries](coding-agent-command-approval-boundaries.md)
- [agent network egress controls](agent-network-egress-controls.md)
- [MCP data movement exposure controls](../data-and-privacy/mcp-data-movement-exposure-controls.md)
- Upstream AI wiki owns broad [MCP security best practices](../../../upstream-ai-wiki/techniques/mcp-security-best-practices.md), protocol, and server-catalog context.

## Open Questions

- Which MCP clients or coding agents have published specific GhostSplice mitigations?
- Will ASSET, MCP maintainers, or affected vendors publish coordinated advisories or CVE identifiers?

## Maintenance Notes

- Created on 2026-08-11 from the [August 11 topic collector](../../../raw/processed/2026-08-11/ai-security-wiki-topic-news-collector-2026-08-11T233115Z.json) after routing broad MCP and coding-agent adoption context upstream.
