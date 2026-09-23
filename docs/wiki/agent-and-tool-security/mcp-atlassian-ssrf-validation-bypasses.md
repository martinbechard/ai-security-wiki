---
type: "Topic"
title: "MCP Atlassian SSRF Validation Bypasses"
description: "Security analysis for the September 2026 mcp-atlassian SSRF and DNS-rebinding advisory family."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# MCP Atlassian SSRF Validation Bypasses

## Current Understanding

The [September 22 topic collector source](../../../raw/processed/2026-09-22/ai-security-wiki-topic-news-collector-2026-09-22T233219Z.json) records a same-release `sooperset/mcp-atlassian` advisory family before 0.22.0. Broad Atlassian, Jira, Confluence, and MCP server catalog context belongs upstream; this page owns the local SSRF validation and DNS-rebinding boundary.

The SSRF subset includes [CVE-2026-77242](https://cveawg.mitre.org/api/cve/CVE-2026-77242), [CVE-2026-77261](https://cveawg.mitre.org/api/cve/CVE-2026-77261), [CVE-2026-77265](https://cveawg.mitre.org/api/cve/CVE-2026-77265), and [CVE-2026-77267](https://cveawg.mitre.org/api/cve/CVE-2026-77267). The collector records incomplete IP pinning after validation, missing redirect protection in basic-auth and OAuth branches, DNS-rebinding exposure in header-based authentication flow, and header-supplied Jira/Confluence URLs bypassing SSRF validation.

## Security Impact

- Threat: agent-supplied or client-supplied Atlassian URL inputs can reach loopback, private, metadata, or otherwise blocked destinations despite SSRF controls.
- Affected boundary: mcp-atlassian versions before 0.22.0, Jira and Confluence URL fetch paths, redirects, DNS resolution, authentication branches, and header-supplied base URLs.
- Exploit or incident status: public CVE cluster with shared pull request, commit, and v0.22.0 release evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: upgrade to 0.22.0 or later, pin validated IPs to the actual connection, validate redirects in all auth branches, and remove caller-controlled URL authority where possible.
- Confidence: high for advisory existence and fixed release boundary; medium for which CVEs map to each deployment mode.
- Residual risk: MCP servers connected to Jira and Confluence need network egress policy outside application-layer URL validation because agents can supply tool parameters from untrusted workspace content.

## Authoritative Sources

- [September 22 topic collector source](../../../raw/processed/2026-09-22/ai-security-wiki-topic-news-collector-2026-09-22T233219Z.json)
- [CVE-2026-77242 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-77242)
- [CVE-2026-77261 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-77261)
- [CVE-2026-77265 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-77265)
- [CVE-2026-77267 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-77267)
- [mcp-atlassian PR 1448](https://github.com/sooperset/mcp-atlassian/pull/1448)
- [mcp-atlassian v0.22.0 release](https://github.com/sooperset/mcp-atlassian/releases/tag/v0.22.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent network egress controls](agent-network-egress-controls.md)
- [MCP Atlassian attachment file read](mcp-atlassian-confluence-attachment-file-read.md)

## Open Questions

- Which authentication branch and header combinations remain reachable in deployments that upgraded only part of the mcp-atlassian stack?

## Maintenance Notes

- Created on 2026-09-23 from the [September 22 topic collector source](../../../raw/processed/2026-09-22/ai-security-wiki-topic-news-collector-2026-09-22T233219Z.json) by splitting the MCP Atlassian advisory cluster into an SSRF-focused leaf.
