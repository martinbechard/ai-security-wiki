---
type: "Topic"
title: "MCP Atlassian OAuth Token File Exposure"
description: "Security analysis for CVE-2026-77250 mcp-atlassian OAuth fallback token files with group-readable permissions."
tags: ["identity-and-access", "data-and-privacy"]
---

# MCP Atlassian OAuth Token File Exposure

## Current Understanding

The [September 22 topic collector source](../../../raw/processed/2026-09-22/ai-security-wiki-topic-news-collector-2026-09-22T233219Z.json) records [CVE-2026-77250](https://cveawg.mitre.org/api/cve/CVE-2026-77250) for mcp-atlassian versions before 0.22.0. Broad Atlassian and MCP server background belongs upstream; this page owns the local OAuth credential-at-rest boundary.

The issue is that OAuth fallback token storage writes plaintext access and refresh tokens with group-readable permissions. Host users in the readable group can obtain delegated Jira or Confluence OAuth credentials even if they are not authorized MCP callers.

## Security Impact

- Threat: local host users or compromised processes in the readable group can recover OAuth access and refresh tokens from fallback token files.
- Affected boundary: mcp-atlassian versions before 0.22.0, OAuth fallback token storage, filesystem permissions, host user/group membership, and Jira/Confluence delegated credentials.
- Exploit or incident status: public CVE cluster with shared v0.22.0 remediation evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade to 0.22.0 or later, store OAuth tokens with least-privilege file permissions, and rotate tokens from affected hosts.
- Confidence: high for advisory existence and affected release boundary; medium for exposure impact because local user/group membership and host isolation vary.
- Residual risk: MCP OAuth token files are delegated SaaS authority and need credential inventory, rotation, and file-permission monitoring.

## Authoritative Sources

- [September 22 topic collector source](../../../raw/processed/2026-09-22/ai-security-wiki-topic-news-collector-2026-09-22T233219Z.json)
- [CVE-2026-77250 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-77250)
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
- [data and privacy](../data-and-privacy/index.md)
- [MCP Atlassian HTTP auth bypass](mcp-atlassian-http-auth-bypass.md)

## Open Questions

- Which fallback token path and host user/group model applies to typical mcp-atlassian deployments?

## Maintenance Notes

- Created on 2026-09-23 from the [September 22 topic collector source](../../../raw/processed/2026-09-22/ai-security-wiki-topic-news-collector-2026-09-22T233219Z.json) after verifier correction split OAuth token-file exposure from HTTP transport authentication.
