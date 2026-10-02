---
type: "Topic"
title: "ByteCoreStack MCP Connector Privilege Escalation"
description: "Security analysis for CVE-2026-19807 and CVE-2026-103068 privilege escalation in ByteCoreStack MCP Connector for AI Tools."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# ByteCoreStack MCP Connector Privilege Escalation

## Current Understanding

The [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json) records [CVE-2026-19807](https://cveawg.mitre.org/api/cve/CVE-2026-19807) and [CVE-2026-103068](https://cveawg.mitre.org/api/cve/CVE-2026-103068) for ByteCoreStack MCP Connector for AI Tools in WordPress. Broad WordPress plugin context belongs upstream if needed; this page owns the local MCP tool privilege-escalation boundary.

The source describes privilege escalation affecting versions up to 1.2.3 and up to 1.2.2, including an `execute_tool` / `wp_update_user_meta` path that can grant elevated privileges. The two CVE records are closely coupled but preserve separate affected-version notes until primary advisory detail resolves whether they cover distinct code paths.

## Security Impact

- Threat: delegated MCP tool execution can mutate WordPress user metadata and elevate privileges.
- Affected boundary: ByteCoreStack MCP Connector for AI Tools <= 1.2.3 for CVE-2026-19807 and <= 1.2.2 for CVE-2026-103068.
- Exploit or incident status: public CVE records; no confirmed exploitation is recorded in the source.
- Mitigation state: update beyond the affected plugin versions and restrict MCP tools that can write user metadata or roles.
- Confidence: medium-high for CVE identity and privilege-escalation class; medium for whether the two records represent distinct implementation bugs.
- Residual risk: WordPress MCP connectors need capability checks at tool dispatch and at the underlying WordPress mutation API because AI-tool callers may not map cleanly to WordPress roles.

## Authoritative Sources

- [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json)
- [CVE-2026-19807 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-19807)
- [CVE-2026-103068 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-103068)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [MCP Server for WordPress REST nonce bypass](mcp-server-for-wordpress-rest-nonce-bypass.md)
- [MCP Server for WordPress workflow configuration authorization](mcp-server-for-wordpress-workflow-configuration-authorization.md)

## Open Questions

- Do CVE-2026-19807 and CVE-2026-103068 describe distinct tool paths or duplicate/overlapping privilege-escalation records?

## Maintenance Notes

- Created on 2026-10-02 from the [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json).
