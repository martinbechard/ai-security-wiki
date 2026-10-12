---
type: "Topic"
title: "Wanwu AppKey and MCP Server Authorization"
description: "Security analysis for CVE-2026-108854, CVE-2026-108855, and CVE-2026-108856 Wanwu AppKey and MCP server authorization flaws."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# Wanwu AppKey and MCP Server Authorization

## Current Understanding

The [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json) records Wanwu and UnicomAI Wanwu AppKey authorization flaws. Broad Wanwu product context belongs upstream; this page owns credential lifecycle and MCP server ownership boundaries.

The source records three related CVEs:

- [CVE-2026-108854](https://nvd.nist.gov/vuln/detail/CVE-2026-108854): Wanwu before 0.6.3 lets authenticated users revoke other users' AppKeys through app key paths.
- [CVE-2026-108855](https://nvd.nist.gov/vuln/detail/CVE-2026-108855): UnicomAI Wanwu through 0.6.5 lets authenticated users revoke other users' AppKeys through unpublish paths.
- [CVE-2026-108856](https://nvd.nist.gov/vuln/detail/CVE-2026-108856): UnicomAI Wanwu through 0.6.5 lets authenticated users mint AppKeys bound to other users' MCP servers, opening sessions and invoking tools using the victim's upstream authentication.

## Security Impact

- Threat: authenticated users can disrupt or impersonate other users' agent credentials and MCP server access.
- Affected boundary: Wanwu before 0.6.3, UnicomAI Wanwu through 0.6.5, AppKey revocation, unpublish paths, MCP server AppKey creation, and upstream MCP authentication.
- Exploit or incident status: public NVD and CVE Services records; no confirmed exploitation incident is recorded locally.
- Mitigation state: bind AppKey lifecycle actions to owner and tenant, prevent key creation for another user's MCP server, and rotate exposed or attacker-minted AppKeys.
- Confidence: high for described authorization boundaries from NVD evidence.
- Residual risk: MCP AppKeys carry delegated tool authority and need the same tenant binding as application records.

## Authoritative Sources

- [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json)
- [NVD CVE-2026-108854](https://nvd.nist.gov/vuln/detail/CVE-2026-108854)
- [CVE-2026-108854 record](https://cveawg.mitre.org/api/cve/CVE-2026-108854)
- [NVD CVE-2026-108855](https://nvd.nist.gov/vuln/detail/CVE-2026-108855)
- [CVE-2026-108855 record](https://cveawg.mitre.org/api/cve/CVE-2026-108855)
- [NVD CVE-2026-108856](https://nvd.nist.gov/vuln/detail/CVE-2026-108856)
- [CVE-2026-108856 record](https://cveawg.mitre.org/api/cve/CVE-2026-108856)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [Wanwu Agent App Cross-Tenant Authorization](wanwu-agent-app-cross-tenant-authorization.md)
- [Payload plugin-mcp API key account takeover](payload-plugin-mcp-api-key-account-takeover.md)
- [Dify MCP server status tenant ownership](dify-mcp-server-status-tenant-ownership.md)

## Open Questions

- Are the Wanwu 0.6.3 and UnicomAI Wanwu 0.6.5 version boundaries divergent because of forks or release-channel lag?

## Maintenance Notes

- Created on 2026-10-12 from the [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json) as the closely coupled AppKey and MCP server credential boundary.
