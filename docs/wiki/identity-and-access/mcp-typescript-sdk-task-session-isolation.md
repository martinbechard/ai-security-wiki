---
type: "Topic"
title: "MCP TypeScript SDK Task Session Isolation"
description: "Security analysis for CVE-2026-111767 cross-session access to experimental MCP TypeScript SDK tasks."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# MCP TypeScript SDK Task Session Isolation

## Current Understanding

The [October 21 topic collector source](../../../raw/processed/2026-10-21/ai-security-wiki-topic-news-collector-2026-10-21T193103-0400.json) records [CVE-2026-111767](https://nvd.nist.gov/vuln/detail/CVE-2026-111767) / [GHSA-22jm-h49p-29qw](https://github.com/advisories/GHSA-22jm-h49p-29qw). Broad MCP SDK coverage belongs upstream; this leaf owns the session-isolation failure in the experimental task store, not the separate [OAuth credential-confusion](mcp-typescript-sdk-oauth-credential-confusion.md) boundary.

## Security Impact

- Threat: clients sharing an `InMemoryTaskStore` can list, read, or cancel another session's delegated tasks.
- Affected boundary: `@modelcontextprotocol/sdk` 1.24.0 through 1.31.0 when an HTTP server passes `taskStore` to `McpServer` or `Server`; 2.x is not affected.
- Exploit or incident status: public GitHub advisory and NVD record; no local exploitation incident is recorded.
- Mitigation state: upgrade to 1.32.0 or later; stop using deprecated experimental tasks, remove `taskStore`, or use one store per session as applicable.
- Confidence: high because the maintainer advisory identifies the shared-store condition and fixed release.
- Residual risk: application-owned task persistence must bind every read and cancellation to a principal and session, not just upgrade the package.

## Authoritative Sources

- [October 21 topic collector source](../../../raw/processed/2026-10-21/ai-security-wiki-topic-news-collector-2026-10-21T193103-0400.json)
- [GitHub advisory GHSA-22jm-h49p-29qw](https://github.com/advisories/GHSA-22jm-h49p-29qw)
- [NVD CVE-2026-111767](https://nvd.nist.gov/vuln/detail/CVE-2026-111767)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MCP TypeScript server cross-client message delivery](../data-and-privacy/mcp-typescript-server-cross-client-message-delivery.md)
- [MCP TypeScript SDK bearer-token audience validation](mcp-typescript-sdk-bearer-token-audience-validation.md)

## Open Questions

- Which local MCP HTTP services enabled the experimental task API or share task state across sessions?

## Maintenance Notes

- Created on 2026-10-21 from the October 21 topic collector as a session-ownership leaf.
