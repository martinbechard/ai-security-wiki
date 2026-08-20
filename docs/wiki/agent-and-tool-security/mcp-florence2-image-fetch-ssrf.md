---
type: "Topic"
title: "mcp-florence2 Image Fetch SSRF"
description: "Security analysis for CVE-2026-19984 SSRF in the mcp-florence2 image retrieval tool."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# mcp-florence2 Image Fetch SSRF

## Current Understanding

The [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) records CVE-2026-19984 for `jkawamoto/mcp-florence2`. Broad MCP server catalog context belongs upstream; this page owns the local multimodal MCP image-fetch egress boundary.

[NVD CVE-2026-19984](https://nvd.nist.gov/vuln/detail/CVE-2026-19984) describes SSRF through manipulation of the `src` argument to `get_images` in `src/mcp_florence2/__init__.py`, affecting mcp-florence2 up to 0.3.13. The record says exploitation can be initiated remotely, exploit details are public, and HTTP(S) requests should be routed through an SSRF-safe proxy where SSRF protection is required.

## Security Impact

- Threat: model- or user-supplied image URLs can steer an MCP image tool toward internal services or metadata endpoints.
- Affected boundary: mcp-florence2 up to 0.3.13, especially deployments that let agents fetch arbitrary image sources.
- Exploit or incident status: public CVE with public exploit detail noted by the collector.
- Mitigation state: SSRF-safe proxying and outbound allow/deny controls are required where the vulnerable versions remain reachable.
- Confidence: high for CVE facts and affected version from the collector's NVD evidence.
- Residual risk: multimodal MCP tools can make network egress look like ordinary image retrieval unless clients log resolved destinations.

## Authoritative Sources

- [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json)
- [NVD CVE-2026-19984](https://nvd.nist.gov/vuln/detail/CVE-2026-19984)
- [mcp-florence2 issue 59](https://github.com/jkawamoto/mcp-florence2/issues/59)
- [VulDB CVE page](https://vuldb.com/vuln/391184)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent network egress controls](agent-network-egress-controls.md)
- [mcp-webresearch browser SSRF](mcp-webresearch-browser-ssrf.md)

## Open Questions

- Which fixed version or maintainer patch should replace proxy-only mitigation guidance?

## Maintenance Notes

- Created on 2026-08-19 from the [August 18 topic collector](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) as a granular MCP SSRF leaf.
