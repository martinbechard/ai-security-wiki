---
type: "Topic"
title: "Cross-Vendor MCP SSRF Protocol Pivoting"
description: "Security analysis for October 2026 reporting on recurring MCP server-side request forgery across multiple organizations."
tags: ["agent-and-tool-security"]
---

# Cross-Vendor MCP SSRF Protocol Pivoting

## Current Understanding

The [October 6 topic collector source](../../../raw/processed/2026-10-06/ai-security-wiki-topic-news-collector-2026-10-06T233203Z.json) records secondary reporting on an October update from Syed Anas Mohiuddin about recurring MCP server-side request forgery. Broad MCP, organization, and product context belongs upstream; this page owns the local protocol-pivoting and final-destination validation pattern for security analysis.

The reports say Google, JPMorgan Chase, Weaviate, France's DINUM, and Tangerang City confirmed and fixed the same class of MCP SSRF pattern: MCP servers built outbound requests from URLs, paths, or endpoints selected through agent or tool input without validating the final resolved destination, redirect target, or metadata-service reachability. The source also warns that unresolved U.S. federal MCP findings remained triage-only; this page does not treat those unresolved findings as confirmed vulnerabilities.

## Security Impact

- Threat: model-originated or cross-agent delegated URL-like values can pivot through trusted MCP servers into loopback, private-network, link-local, or cloud metadata targets.
- Affected boundary: MCP servers and agent handoff chains that transform tool input into server-side network requests, including redirect and DNS resolution paths.
- Exploit or incident status: secondary October reporting describes confirmed fixes at five organizations; primary researcher evidence was not directly captured in the source.
- Mitigation state: validate final destinations after parsing, DNS resolution, and redirects; deny metadata and private ranges by default; and keep triage-only reports out of durable confirmed-vulnerability claims.
- Confidence: medium because multiple in-window reports agree, but primary researcher material still needs capture.
- Residual risk: protocol labels and trusted MCP paths can hide ordinary SSRF unless the egress control follows the final network destination rather than the named tool.

## Authoritative Sources

- [October 6 topic collector source](../../../raw/processed/2026-10-06/ai-security-wiki-topic-news-collector-2026-10-06T233203Z.json)
- [The Next Web report](https://thenextweb.com/news/mcp-flaw-ssrf-google-jpmorgan-dinum-protocol-pivoting)
- [New Horizon report](https://new-horizon.tech/blog/2026-10-06-same-mcp-server-flaw-confirmed-at-google-jpmorgan-weaviate-t)
- [TechsCurrent report](https://techscurrent.com/2026/10/mcp-protocol-pivoting-ai-agent-security-trust-gap/)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent network egress controls](agent-network-egress-controls.md)
- [MCP Server Fetch SSRF](mcp-server-fetch-ssrf.md)
- [MCP Atlassian SSRF validation bypasses](mcp-atlassian-ssrf-validation-bypasses.md)

## Open Questions

- Where is the primary "Protocol Pivoting, four months later" researcher update, and which individual fixes does it directly document?

## Maintenance Notes

- Created on 2026-10-07 from the [October 6 topic collector source](../../../raw/processed/2026-10-06/ai-security-wiki-topic-news-collector-2026-10-06T233203Z.json) as a pattern leaf with explicit caveats about secondary sourcing and unconfirmed federal findings.
