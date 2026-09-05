---
type: "Topic"
title: "OGX MCP Server URL SSRF"
description: "Security analysis for CVE-2026-85666 SSRF through MCP server_url on an OpenAI-compatible responses endpoint."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# OGX MCP Server URL SSRF

## Current Understanding

The [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json) records CVE-2026-85666 for OGX 1.3.1, formerly Llama Stack. Broad OGX and Llama Stack framework coverage belongs upstream; this page owns the MCP URL-fetch and private-network SSRF boundary.

[CVE-2026-85666](https://cveawg.mitre.org/api/cve/CVE-2026-85666) and [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-85666) describe an unauthenticated path through `POST /v1/responses` where caller-supplied MCP tool definitions include `server_url`. The server fetches that URL without the private-destination guard used for other URL inputs, allowing access to internal or metadata endpoints.

## Security Impact

- Threat: tool-definition URL fetches bypass final-destination SSRF controls.
- Affected boundary: OGX 1.3.1 OpenAI-compatible responses endpoint and MCP server URL handling.
- Exploit or incident status: public CVE; no local incident evidence is recorded.
- Mitigation state: apply one private-address, redirect, and DNS-rebinding policy to every URL-fetch path, including tool definitions.
- Confidence: high for the unauthenticated SSRF boundary from direct CVE evidence.
- Residual risk: OpenAI-compatible APIs can inherit multiple URL-ingress paths, so fixing visible prompt or media fetches does not prove MCP transport URLs are covered.

## Authoritative Sources

- [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json)
- [CVE-2026-85666](https://cveawg.mitre.org/api/cve/CVE-2026-85666)
- [NVD CVE-2026-85666](https://nvd.nist.gov/vuln/detail/CVE-2026-85666)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent network egress controls](agent-network-egress-controls.md)

## Open Questions

- Which OGX release applies private-destination checks to MCP `server_url` fetches?

## Maintenance Notes

- Created on 2026-09-04 from the [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json).
