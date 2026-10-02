---
type: "Topic"
title: "Laravel AI SDK File URL SSRF"
description: "Security analysis for GHSA-6qhr-3g93-pxhw SSRF through client-supplied file URLs in Laravel AI SDK adapters."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Laravel AI SDK File URL SSRF

## Current Understanding

The [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json) records [GHSA-6qhr-3g93-pxhw](https://github.com/laravel/ai/security/advisories/GHSA-6qhr-3g93-pxhw) for SSRF in `laravel/ai` 1.0.0. Broad Laravel AI SDK development usage belongs upstream in ai-dev-wiki if needed; this page owns the local chat-file ingestion and server-side fetch boundary.

The advisory says the Vercel AI SDK and AG-UI adapters accepted URL file parts from clients and fetched them server-side without destination validation. Version 1.0.1 adds URL validation, private-address blocking, redirect-hop validation, and DNS-rebinding guards.

## Security Impact

- Threat: untrusted chat file parts can make the server fetch localhost, private networks, or metadata services and surface fetched content back through the AI workflow.
- Affected boundary: `laravel/ai` >= 1.0.0 and < 1.0.1; applications exposing Vercel AI SDK or AG-UI adapters to untrusted clients.
- Exploit or incident status: public GitHub Security Advisory; no confirmed exploitation is recorded in the source.
- Mitigation state: update to `laravel/ai` 1.0.1 or later; disable URL file fetching or enforce private-range, redirect, and DNS-rebinding validation for every hop.
- Confidence: high because the primary advisory gives affected and patched versions, CVSS, CWE, and workaround detail.
- Residual risk: model attachment handling is also network egress; validation must happen at dial time, after redirects, and after DNS resolution.

## Authoritative Sources

- [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json)
- [GitHub advisory GHSA-6qhr-3g93-pxhw](https://github.com/laravel/ai/security/advisories/GHSA-6qhr-3g93-pxhw)
- [Laravel News advisory roundup](https://laravel-news.com/laravel-ai-mcp-security-advisories)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent network egress controls](agent-network-egress-controls.md)
- [fast-mcp-telegram file URL SSRF](fast-mcp-telegram-file-url-ssrf.md)
- Upstream AI development wiki owns general framework integration practice.

## Open Questions

- No open topic questions are recorded.

## Maintenance Notes

- Created on 2026-10-02 from the [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json).
