---
type: "Topic"
title: "Flowise browser-loader DNS-rebinding SSRF"
description: "Security analysis for CVE-2026-130615 DNS-rebinding SSRF in Flowise Playwright and Puppeteer loaders."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# Flowise browser-loader DNS-rebinding SSRF

## Current Understanding

The [November 19 topic collector source](../../../raw/processed/2026-11-19/ai-security-wiki-topic-news-collector-2026-11-19T003503Z.json) records CVE-2026-130615 in Flowise through 3.1.4. Broad Flowise and browser-loader context belongs upstream; this leaf owns the DNS-rebinding, internal-network, and model-context exposure boundary.

A low-privilege user who can configure a chatflow can use a DNS-rebinding domain with a Playwright or Puppeteer loader. The reported unpinned DNS validation can then let the loader reach internal services or cloud metadata endpoints and return retrieved content into the model context. No fixed version is identified in the source.

## Security Impact

- Threat: a configured browser or document loader can be redirected from a validated public hostname to internal or metadata-service addresses.
- Affected boundary: Flowise through 3.1.4; Playwright and Puppeteer loader paths configured by a low-privilege authenticated user.
- Exploit or incident status: public NVD/CNA-sourced vulnerability record; no confirmed exploitation or local incident is recorded.
- Mitigation state: isolate loader egress, resolve and pin destination addresses across redirects, block internal and cloud-metadata ranges, and restrict who can configure loaders.
- Confidence: high for the reported affected range and DNS-rebinding mechanism; medium for remediation availability because no fixed version is identified.
- Residual risk: route-local URL checks remain insufficient when browser workers have broad network reachability.

## Authoritative Sources

- [November 19 topic collector source](../../../raw/processed/2026-11-19/ai-security-wiki-topic-news-collector-2026-11-19T003503Z.json)
- [CVE-2026-130615 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-130615)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/flowise-through-3.1.4-ssrf-via-dns-rebinding-in-playwright-and-puppeteer-loaders)
- [Flowise HTTP security reference](https://github.com/FlowiseAI/Flowise/blob/a65f81bb43ef66d3ce734bf0dff4223ae8041c95/packages/components/src/httpSecurity.ts#L121-L139)

## Related Code

- Upstream code: [Flowise HTTP security reference](https://github.com/FlowiseAI/Flowise/blob/a65f81bb43ef66d3ce734bf0dff4223ae8041c95/packages/components/src/httpSecurity.ts#L121-L139).

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Flowise HTTP MCP document-loader SSRF](flowise-http-mcp-document-loader-ssrf.md)
- [agent network egress controls](agent-network-egress-controls.md)

## Open Questions

- Which supported Flowise distribution, if any, remediates CVE-2026-130615?

## Maintenance Notes

- Created on 2026-11-19 from the November 19 topic collector. Test egress policy against DNS rebinding and metadata addresses before treating a loader deployment as contained.
