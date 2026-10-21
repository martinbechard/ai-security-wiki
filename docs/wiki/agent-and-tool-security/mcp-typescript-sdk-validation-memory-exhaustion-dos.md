---
type: "Topic"
title: "MCP TypeScript SDK Validation Memory-Exhaustion DoS"
description: "Security analysis for CVE-2026-111768 unbounded tool-input validation in HTTP MCP TypeScript SDK deployments."
tags: ["agent-and-tool-security"]
---

# MCP TypeScript SDK Validation Memory-Exhaustion DoS

## Current Understanding

The [October 20 topic collector source](../../../raw/processed/2026-10-20/ai-security-wiki-topic-news-collector-2026-10-20T232727Z.json) records [CVE-2026-111768](https://nvd.nist.gov/vuln/detail/CVE-2026-111768) / [GHSA-46jr-4wx8-v453](https://github.com/advisories/GHSA-46jr-4wx8-v453) for the MCP TypeScript SDK and server packages. Broad [MCP transport](../../../upstream-ai-wiki/techniques/mcp-transports.md) and SDK catalog context remains upstream; this leaf owns the HTTP tool-input availability boundary.

A single HTTP request within the default 4 MiB body limit can cause unbounded validation of array elements and object keys, exhaust memory, and abort the JavaScript process. This makes body-size limits insufficient for tools that accept arrays or records.

## Security Impact

- Threat: an HTTP client can deny service by submitting a structurally expensive but body-size-compliant tool input.
- Affected boundary: HTTP-reachable MCP servers using `@modelcontextprotocol/sdk` 1.3.0 through before 1.32.0 or `@modelcontextprotocol/server` 2.0.0 through before 2.3.0.
- Exploit or incident status: public GitHub-reviewed advisory; no local exploitation incident is recorded.
- Mitigation state: upgrade to SDK 1.32.0 or server 2.3.0 or later, set `maxToolInputElements`, and set an appropriate transport or parser request-body limit.
- Confidence: high because the primary advisory distinguishes element-count control from body-size control.
- Residual risk: authentication after parsing cannot protect availability; enforce structural input limits before expensive validation.

## Authoritative Sources

- [October 20 topic collector source](../../../raw/processed/2026-10-20/ai-security-wiki-topic-news-collector-2026-10-20T232727Z.json)
- [CVE-2026-111768](https://nvd.nist.gov/vuln/detail/CVE-2026-111768)
- [GitHub advisory GHSA-46jr-4wx8-v453](https://github.com/advisories/GHSA-46jr-4wx8-v453)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP TypeScript server cross-client message delivery](../data-and-privacy/mcp-typescript-server-cross-client-message-delivery.md)

## Open Questions

- Which locally deployed MCP tools accept compound inputs without an explicit element-count limit?

## Maintenance Notes

- Created on 2026-10-20 from the October 20 topic collector.
