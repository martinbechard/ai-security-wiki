---
type: "Topic"
title: "Headroom LLM Proxy Upstream SSRF"
description: "Security analysis for CVE-2026-77775 Headroom LLM proxy client-supplied upstream base URL SSRF."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# Headroom LLM Proxy Upstream SSRF

## Current Understanding

The [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) records CVE-2026-77775 for Headroom's LLM proxy. Broad proxy and OpenAI-compatible API implementation practice belongs upstream or ai-dev-wiki; this page owns the local network-routing boundary.

The [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-77775), [CVE record](https://www.cve.org/CVERecord?id=CVE-2026-77775), and [VulnCheck advisory](https://www.vulncheck.com/advisories/headroom-proxy-sends-upstream-requests-to-a-client-supplied-base-url-without-address-validation) describe an `x-headroom-base-url` header that lets clients choose OpenAI-compatible or passthrough upstream destinations without rejecting loopback, link-local, RFC 1918, or metadata addresses.

## Security Impact

- Threat: a client-controlled model-proxy base URL can redirect proxy traffic to internal network or metadata endpoints.
- Affected boundary: Headroom LLM proxy upstream base URL selection; public sources identify affected versions before 0.36.1, but primary version confirmation is still needed.
- Exploit or incident status: public CVE and VulnCheck advisory evidence; no local exploitation evidence is recorded.
- Mitigation state: reject private or metadata upstream destinations, bind upstream destinations to server-side configuration, and verify fixed version from a primary source.
- Confidence: high for the SSRF boundary; medium for affected-version details because primary release evidence is not captured.
- Residual risk: LLM proxies centralize model credentials and prompt traffic, so SSRF can expose internal control planes or cloud metadata even when model APIs appear external-only.

## Authoritative Sources

- [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json)
- [August 23 leaf update watch source](../../../raw/processed/2026-08-23/ai-security-wiki-leaf-update-watch-20260824T000259Z.json)
- [NVD CVE-2026-77775](https://nvd.nist.gov/vuln/detail/CVE-2026-77775)
- [CVE record CVE-2026-77775](https://www.cve.org/CVERecord?id=CVE-2026-77775)
- [VulnCheck CVE-2026-77775 advisory](https://www.vulncheck.com/advisories/headroom-proxy-sends-upstream-requests-to-a-client-supplied-base-url-without-address-validation)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent network egress controls](../agent-and-tool-security/agent-network-egress-controls.md)
- [MCP data movement exposure controls](../data-and-privacy/mcp-data-movement-exposure-controls.md)

## Open Questions

- Which primary Headroom advisory or release note confirms the exact affected and fixed versions for CVE-2026-77775?

## Maintenance Notes

- Created on 2026-08-22 from the [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) as the upstream-routing member of the Headroom advisory set.
