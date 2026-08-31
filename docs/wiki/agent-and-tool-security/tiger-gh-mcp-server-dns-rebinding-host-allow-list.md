---
type: "Topic"
title: "tiger-gh-mcp-server DNS Rebinding Host Allow-List"
description: "Security analysis for CVE-2026-81100 tiger-gh-mcp-server browser-drivable GitHub MCP endpoint exposure."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# tiger-gh-mcp-server DNS Rebinding Host Allow-List

## Current Understanding

The [August 30 topic collector source](../../../raw/processed/2026-08-30/ai-security-wiki-topic-news-collector-2026-08-30T233055Z.json) records [CVE-2026-81100](https://nvd.nist.gov/vuln/detail/CVE-2026-81100) for tiger-gh-mcp-server. Broad tiger-gh-mcp-server, Timescale, GitHub, and MCP server catalog context belongs upstream; this page owns the local browser-to-GitHub-tool authority boundary.

NVD and the [VulnCheck advisory](https://www.vulncheck.com/advisories/timescale-tiger-gh-mcp-server-dns-rebinding-via-disabled-host-header-allow-list) say the MCP HTTP transport started without the SDK DNS-rebinding Host allow-list. A browser page could reach the locally exposed GitHub MCP endpoint through an attacker-controlled hostname and invoke available GitHub tools. The [fix pull request](https://github.com/timescale/tiger-gh-mcp-server/pull/36) passes the protection option alongside a dependency update.

## Security Impact

- Threat: untrusted browser content can reach local GitHub-scoped MCP authority through DNS rebinding.
- Affected boundary: tiger-gh-mcp-server MCP HTTP transport before the host-allow-list fix; no release bracket was published in the source.
- Exploit or incident status: public vulnerability database and advisory evidence; no local exploitation incident is recorded.
- Mitigation state: apply the host-allow-list fix or a release containing it, require Host and Origin validation, bind sessions to authenticated local clients, and scope GitHub credentials narrowly.
- Confidence: high for the vulnerability and fix intent from NVD, VulnCheck, and the pull request; medium for exact affected release boundaries because the collector did not capture a release range.
- Residual risk: GitHub-capable MCP tools can mutate repositories, issues, and pull requests, so local transport exposure can become a source-control integrity issue.

## Control Implications

- Inventory local MCP servers by tool authority, not just listening address.
- Require explicit browser-origin denial tests for MCP tools that carry repository write permissions.
- Keep GitHub token scope and audit trails separate for local agent tooling.

## Authoritative Sources

- [August 30 topic collector source](../../../raw/processed/2026-08-30/ai-security-wiki-topic-news-collector-2026-08-30T233055Z.json)
- [NVD CVE-2026-81100](https://nvd.nist.gov/vuln/detail/CVE-2026-81100)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/timescale-tiger-gh-mcp-server-dns-rebinding-via-disabled-host-header-allow-list)
- [tiger-gh-mcp-server fix pull request](https://github.com/timescale/tiger-gh-mcp-server/pull/36)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [pg-aiguide MCP DNS rebinding Host allow-list](pg-aiguide-mcp-dns-rebinding-host-allow-list.md)
- [coding agent command approval boundaries](coding-agent-command-approval-boundaries.md)

## Open Questions

- Which tiger-gh-mcp-server releases include the host-allow-list fix?

## Maintenance Notes

- Created on 2026-08-30 from the [August 30 topic collector](../../../raw/processed/2026-08-30/ai-security-wiki-topic-news-collector-2026-08-30T233055Z.json) as a GitHub-authority MCP DNS-rebinding leaf.
