---
type: "Topic"
title: "MCP Atlassian HTTP Auth Bypass"
description: "Security analysis for CVE-2026-77244 mcp-atlassian HTTP transport accepting any non-empty Atlassian opaque token."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# MCP Atlassian HTTP Auth Bypass

## Current Understanding

The [September 22 topic collector source](../../../raw/processed/2026-09-22/ai-security-wiki-topic-news-collector-2026-09-22T233219Z.json) records [CVE-2026-77244](https://cveawg.mitre.org/api/cve/CVE-2026-77244) for mcp-atlassian versions before 0.22.0. Broad Atlassian and MCP server background belongs upstream; this page owns the local HTTP transport authentication boundary.

The issue is that HTTP transport authentication accepts any non-empty Atlassian opaque token. That makes possession of a syntactically present token different from proof that the caller is authorized for the MCP server and its delegated Jira or Confluence tools.

## Security Impact

- Threat: unauthorized HTTP clients can reach MCP functionality when transport authentication treats any non-empty Atlassian opaque token as sufficient.
- Affected boundary: mcp-atlassian versions before 0.22.0, HTTP transport authentication, Atlassian opaque-token validation, and delegated Jira/Confluence tool access.
- Exploit or incident status: public CVE cluster with shared v0.22.0 remediation evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade to 0.22.0 or later and validate transport tokens against the expected authority, audience, and server-side session state before tool dispatch.
- Confidence: high for advisory existence and affected release boundary; medium for per-deployment exposure because HTTP transport reachability varies.
- Residual risk: MCP transport authentication must be enforced before tool dispatch and must not rely on token presence as authorization.

## Authoritative Sources

- [September 22 topic collector source](../../../raw/processed/2026-09-22/ai-security-wiki-topic-news-collector-2026-09-22T233219Z.json)
- [CVE-2026-77244 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-77244)
- [mcp-atlassian PR 1448](https://github.com/sooperset/mcp-atlassian/pull/1448)
- [mcp-atlassian v0.22.0 release](https://github.com/sooperset/mcp-atlassian/releases/tag/v0.22.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MCP Atlassian toolset authorization bypass](mcp-atlassian-toolset-authorization-bypass.md)
- [MCP Atlassian OAuth token-file exposure](mcp-atlassian-oauth-token-file-exposure.md)

## Open Questions

- Which HTTP transport modes exposed mcp-atlassian before 0.22.0 to clients outside the intended trust boundary?

## Maintenance Notes

- Created on 2026-09-23 from the [September 22 topic collector source](../../../raw/processed/2026-09-22/ai-security-wiki-topic-news-collector-2026-09-22T233219Z.json) after verifier correction split HTTP auth from OAuth token-file exposure.
