---
type: "Topic"
title: "UTCP Remote HTTP Manual Loopback SSRF"
description: "Security analysis for CVE-2026-101058 loopback URL acceptance in remote UTCP manuals."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# UTCP Remote HTTP Manual Loopback SSRF

## Current Understanding

The [September 27 topic collector source](../../../raw/processed/2026-09-27/ai-security-wiki-topic-news-collector-2026-09-27T233044Z.json) records [CVE-2026-101058](https://nvd.nist.gov/vuln/detail/CVE-2026-101058) for `python-utcp` package `utcp-http` before 1.1.12. Broad UTCP protocol coverage belongs upstream; this page owns the local remote manual discovery, loopback URL, and tool-response boundary.

NVD, the [GitHub advisory](https://github.com/universal-tool-calling-protocol/python-utcp/security/advisories/GHSA-8vxx-v7r9-948g), and [VulnCheck](https://www.vulncheck.com/advisories/python-utcp-before-1.1.12-ssrf-via-remote-http-manual) describe remote, non-loopback UTCP manuals declaring loopback tool URLs. Because `ensure_secure_url` permits loopback HTTP for local development and native manuals bypassed the OpenAPI converter's loopback check, a victim who registers an attacker-served manual can be made to call services bound to `127.0.0.1` on the victim host and return response bodies through `http`, `sse`, or `streamable_http` tools.

Affected boundary: `python-utcp` package `utcp-http` before 1.1.12.

Exploit or incident status: public advisory disclosure; local sources do not record confirmed active exploitation.

Mitigation state: upgrade `utcp-http` to 1.1.12 or later, which rejects manuals fetched from non-loopback origins that declare loopback tool URLs using the final post-redirect discovery URL.

Confidence: high for affected and fixed versions from NVD plus linked advisory evidence.

Residual risk: remote tool manuals need provenance-sensitive URL policy; loopback exceptions that are safe for local development can become SSRF when imported from remote manuals.

## Authoritative Sources

- [September 27 topic collector source](../../../raw/processed/2026-09-27/ai-security-wiki-topic-news-collector-2026-09-27T233044Z.json)
- [NVD CVE-2026-101058](https://nvd.nist.gov/vuln/detail/CVE-2026-101058)
- [GitHub advisory GHSA-8vxx-v7r9-948g](https://github.com/universal-tool-calling-protocol/python-utcp/security/advisories/GHSA-8vxx-v7r9-948g)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/python-utcp-before-1.1.12-ssrf-via-remote-http-manual)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [UTCP MCP server URL validation](utcp-mcp-server-url-validation.md)
- [agent network egress controls](agent-network-egress-controls.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-27 from the September 27 collector and NVD enrichment as a focused remote-manual loopback SSRF leaf.
