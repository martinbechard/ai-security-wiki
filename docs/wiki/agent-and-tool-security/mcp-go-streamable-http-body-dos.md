---
type: "Topic"
title: "mcp-go StreamableHTTP Body DoS"
description: "Security analysis for CVE-2026-108859 mcp-go unbounded StreamableHTTP POST body memory exhaustion."
tags: ["agent-and-tool-security"]
---

# mcp-go StreamableHTTP Body DoS

## Current Understanding

The [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json) records [CVE-2026-108859](https://nvd.nist.gov/vuln/detail/CVE-2026-108859) for mcp-go through 1.2.1. Broad mcp-go and MCP transport coverage belongs upstream; this page owns the local unauthenticated request-size control boundary.

The CVE evidence says mcp-go reads arbitrarily large StreamableHTTP POST bodies into memory before validation. An unauthenticated request can therefore exhaust memory before the server reaches MCP message validation, authentication, or tool policy.

## Security Impact

- Threat: unauthenticated MCP HTTP clients can exhaust memory through oversized POST bodies.
- Affected boundary: mcp-go through 1.2.1, StreamableHTTP server, POST request body handling, and pre-validation memory allocation.
- Exploit or incident status: public NVD and CVE Services records; no confirmed exploitation incident is recorded locally.
- Mitigation state: enforce body-size limits before reads and confirm the fixed upstream release before naming remediation as complete.
- Confidence: high for affected range and unauthenticated memory exhaustion from CVE evidence.
- Residual risk: MCP servers exposed for agent tooling need transport-level limits before authorization and tool validation.

## Authoritative Sources

- [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json)
- [NVD CVE-2026-108859](https://nvd.nist.gov/vuln/detail/CVE-2026-108859)
- [CVE-2026-108859 record](https://cveawg.mitre.org/api/cve/CVE-2026-108859)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [mcp-go DNS rebinding host validation](mcp-go-dns-rebinding-host-validation.md)
- [Spring AI MCP Streamable HTTP session DoS](spring-ai-mcp-streamable-http-session-dos.md)
- Upstream AI wiki owns broad MCP transport and SDK context.

## Open Questions

- Which mcp-go release first enforces safe pre-validation body-size limits for StreamableHTTP?

## Maintenance Notes

- Created on 2026-10-12 from the [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json).
