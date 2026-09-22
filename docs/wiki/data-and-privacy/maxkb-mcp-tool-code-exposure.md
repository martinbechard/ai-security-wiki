---
type: "Topic"
title: "MaxKB MCP Tool Code Exposure"
description: "Security analysis for CVE-2026-77518 MCP tool configuration disclosure and reuse in MaxKB."
tags: ["data-and-privacy", "identity-and-access", "agent-and-tool-security"]
---

# MaxKB MCP Tool Code Exposure

## Current Understanding

The [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json) records [CVE-2026-77518](https://cveawg.mitre.org/api/cve/CVE-2026-77518) for MaxKB 2.10.2-lts and earlier. Broad MaxKB product context belongs upstream; this page owns MCP tool configuration disclosure and foreign-tool reuse.

A normal workspace user who knows another user's active MCP `tool_id` in the same workspace can retrieve the hidden tool through the tool-detail route because the route does not apply the per-resource authorization used by the list route. The response includes `Tool.code`, which may contain MCP server configuration and headers. The attacker can also place the foreign `mcp_tool_id` in an attacker-owned workflow MCP node so workflow debug uses the owner's MCP configuration without verifying permission to use that tool. No fixed version was available in the captured record.

## Security Impact

- Threat: known MCP tool IDs can expose server configuration and let workflows invoke another user's MCP configuration.
- Affected boundary: MaxKB 2.10.2-lts and earlier; MCP tool detail route and workflow MCP node execution.
- Exploit or incident status: public GitHub advisory; no local exploitation evidence is recorded.
- Mitigation state: no fixed version identified; re-check per-resource authorization on detail and execution routes, rotate exposed MCP headers, and audit workflows referencing foreign tool IDs.
- Confidence: high for advisory existence and affected range; fixed-version confidence is unavailable.
- Residual risk: MCP server configuration often carries headers, URLs, and credentials that should be treated as sensitive data.

## Authoritative Sources

- [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json)
- [CVE-2026-77518 JSON](https://cveawg.mitre.org/api/cve/CVE-2026-77518)
- [GitHub advisory GHSA-x65c-w438-c58f](https://github.com/1Panel-dev/MaxKB/security/advisories/GHSA-x65c-w438-c58f)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [identity and access](../identity-and-access/index.md)
- [MaxKB tool dispatch grant bypass](../identity-and-access/maxkb-tool-dispatch-grant-bypass.md)

## Open Questions

- Which MaxKB release fixes CVE-2026-77518?

## Maintenance Notes

- Created on 2026-09-21 from the [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json).
