---
type: "Topic"
title: "mcp-remote SSE Token Origin Disclosure"
description: "Security analysis for CVE-2026-52001, where mcp-remote SSE transport token-origin handling could disclose sensitive information."
tags: ["data-and-privacy", "agent-and-tool-security"]
---

# mcp-remote SSE Token Origin Disclosure

## Current Understanding

The [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) records [CVE-2026-52001](https://cveawg.mitre.org/api/cve/CVE-2026-52001) for mcp-remote 0.1.18 through 0.1.38. Broad mcp-remote package cataloging belongs upstream; this page owns the local SSE transport token-origin disclosure boundary.

The CVE source identifies sensitive information exposure through the SSE transport `eventSourceInit` fetch wrapper in `src/lib/utils.ts`. This belongs in data/privacy because the control is where token or origin data can leak during streaming transport setup.

## Security Impact

- Threat: SSE transport setup can expose sensitive token-origin data to the wrong remote endpoint or context.
- Affected boundary: mcp-remote 0.1.18 through 0.1.38; SSE transport `eventSourceInit` fetch wrapper.
- Exploit or incident status: public CVE/NVD records and public mcp-remote OAuth security write-up; no local incident evidence is recorded.
- Mitigation state: upgrade beyond the affected range and bind SSE token use to the intended server origin.
- Confidence: high for affected range and disclosure class; medium for exact leaked fields until patch detail is reviewed.
- Residual risk: streaming MCP transports must preserve token-origin binding across reconnects, wrappers, and server-supplied metadata.

## Authoritative Sources

- [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json)
- [CVE-2026-52001 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-52001)
- [NVD CVE-2026-52001](https://nvd.nist.gov/vuln/detail/CVE-2026-52001)
- [mcp-remote OAuth security write-up](https://github.com/playb0t/mcp-remote-oauth-security#readme)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [MCP data movement exposure controls](mcp-data-movement-exposure-controls.md)

## Open Questions

- Which token or origin values can CVE-2026-52001 expose during SSE setup?

## Maintenance Notes

- Created on 2026-09-25 from the [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) as the mcp-remote SSE token-origin disclosure leaf.
