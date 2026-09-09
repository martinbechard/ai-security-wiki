---
type: "Topic"
title: "Open WebUI fetch and RAG SSRF"
description: "Security analysis for Open WebUI 0.11.0 SSRF advisories in URL, RAG, image, OAuth, and web-loader fetch paths."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Open WebUI fetch and RAG SSRF

## Current Understanding

The [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json) records NVD in-window updates for Open WebUI SSRF issues fixed in 0.11.0. Broad Open WebUI product context belongs upstream; this page owns fetch and retrieval paths that accept untrusted or model-influenced URLs.

The durable boundary covers DNS-rebinding and IPv6-transition SSRF in URL, RAG, image, and OAuth fetch paths plus Playwright web-loader sub-resource validation gaps. The control is final-destination validation for every redirect, sub-resource, DNS result, and address-normalized request that can place fetched content into assistant context.

## Security Impact

- Threat: untrusted URLs can steer assistant fetch or RAG ingestion into loopback, private-network, metadata, or other unintended destinations.
- Affected boundary: Open WebUI versions before 0.11.0; URL/RAG/image/OAuth fetch and Playwright web-loader paths.
- Exploit or incident status: public NVD/CVE/GitHub advisory evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: upgrade to Open WebUI 0.11.0 or later and validate final destinations after redirects, DNS resolution, IPv6 normalization, and sub-resource discovery.
- Confidence: high for NVD in-window update timing and affected boundary from the collector; medium for individual CVE exploit status.
- Residual risk: RAG and browser-loading pipelines remain SSRF-prone when they validate the first URL but not the actual destination fetched.

## Authoritative Sources

- [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json)
- [Open WebUI v0.11.0 release](https://github.com/open-webui/open-webui/releases/tag/v0.11.0)
- [CVE-2026-54020 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-54020)
- [CVE-2026-70479 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-70479)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent network egress controls](agent-network-egress-controls.md)
- [mcp-fetch IPv6 SSRF](mcp-fetch-ipv6-ssrf.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-08 from the September 8 topic collector after verifier correction split the Open WebUI release wave into focused security-boundary leaves.
