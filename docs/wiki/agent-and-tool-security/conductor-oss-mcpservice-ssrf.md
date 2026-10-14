---
type: "Topic"
title: "Conductor OSS MCPService SSRF"
description: "Security analysis for CVE-2026-109402, where Conductor OSS MCPService server selection can trigger server-side requests."
tags: ["agent-and-tool-security"]
---

# Conductor OSS MCPService SSRF

## Current Understanding

The [October 13 topic collector source](../../../raw/processed/2026-10-13/ai-security-wiki-topic-news-collector-2026-10-13T232603Z.json) records [CVE-2026-109402](https://nvd.nist.gov/vuln/detail/CVE-2026-109402) for conductor-oss conductor 3.22.0. Broad Conductor OSS platform context belongs upstream; this page owns the MCP server-selection and SSRF boundary.

The CVE evidence says `MCPService.listTools` accepts a manipulable `mcpServer` argument that can make the MCP Service initiate attacker-chosen server-side requests. The public record says exploit code is available.

## Security Impact

- Threat: tool-discovery metadata calls can cross network trust boundaries through attacker-selected MCP server URLs.
- Affected boundary: conductor-oss conductor 3.22.0, `ai/src/main/java/org/conductoross/conductor/ai/mcp/MCPService.java`, and `listTools` server-selection behavior.
- Exploit or incident status: public CVE with exploit availability noted; no confirmed exploitation incident is recorded locally.
- Mitigation state: vendor response and patch status were not confirmed in the collector evidence.
- Confidence: medium-high for issue shape and exploit status from NVD/CVE evidence; medium for remediation state.
- Residual risk: MCP discovery and list-tools operations are often treated as reads, but URL selection remains an egress-control decision.

## Control Implications

- Validate and pin MCP server destinations before list-tools or discovery requests.
- Apply SSRF controls to metadata and discovery paths, not only tool execution.
- Audit orchestration platforms for user-controllable MCP server identifiers crossing into network clients.

## Authoritative Sources

- [October 13 topic collector source](../../../raw/processed/2026-10-13/ai-security-wiki-topic-news-collector-2026-10-13T232603Z.json)
- [NVD CVE-2026-109402](https://nvd.nist.gov/vuln/detail/CVE-2026-109402)
- [CVE Services CVE-2026-109402](https://cveawg.mitre.org/api/cve/CVE-2026-109402)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [cross-vendor MCP SSRF protocol pivoting](cross-vendor-mcp-ssrf-protocol-pivoting.md)

## Open Questions

- Which Conductor OSS release or commit remediates CVE-2026-109402, and does it constrain `mcpServer` before every discovery request?

## Maintenance Notes

- Created on 2026-10-14 from the October 13 topic collector as a list-tools SSRF leaf.
