---
type: "Topic"
title: "mcp-searxng Unbounded URL Fetch"
description: "Security analysis for CVE-2026-58483 missing content-length enforcement in mcp-searxng URL reads."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# mcp-searxng Unbounded URL Fetch

## Current Understanding

The [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json) records [CVE-2026-58483](https://nvd.nist.gov/vuln/detail/CVE-2026-58483) as part of an updated mcp-searxng URL-reader cluster. Broad SearXNG and MCP server catalog context belongs upstream; this page owns the local availability boundary where model-selected URL reads can consume unbounded server resources.

Existing [mcp-searxng web_url_read SSRF](mcp-searxng-web-url-read-ssrf.md) coverage owns CVE-2026-58485, CVE-2026-54688, and CVE-2026-54689. This page keeps CVE-2026-58483 content-size enforcement separate because the security impact is availability and ingestion control rather than internal-network access.

## Security Impact

- Threat: attacker-controlled or prompt-injected URLs can force the MCP server to fetch content without effective size bounds.
- Affected boundary: mcp-searxng before 1.7.1, URL-reading tools, content-length enforcement, memory, CPU, and response ingestion.
- Exploit or incident status: public NVD update; no local exploitation incident is recorded.
- Mitigation state: upgrade to mcp-searxng 1.7.1 or later, enforce response size and time limits, and stop reads when headers or streaming bodies exceed configured caps.
- Confidence: medium-high for the missing content-length control and 1.7.1 fix from NVD cluster evidence; medium for primary-advisory wording until the upstream advisory or release notes are reconciled.
- Residual risk: URL-reading MCP tools need both network-destination policy and resource limits because the model can select expensive URLs even when SSRF controls pass.

## Authoritative Sources

- [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json)
- [NVD CVE-2026-58483](https://nvd.nist.gov/vuln/detail/CVE-2026-58483)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [mcp-searxng web_url_read SSRF](mcp-searxng-web-url-read-ssrf.md)
- Upstream AI wiki owns broad mcp-searxng and SearXNG context.

## Open Questions

- Which primary mcp-searxng advisory or release note describes the CVE-2026-58483 content-length enforcement fix in 1.7.1?

## Maintenance Notes

- Created on 2026-10-01 from the [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json) after splitting the availability issue from existing SSRF coverage.
