---
type: "Topic"
title: "MaxKB Tool Dispatch Grant Bypass"
description: "Security analysis for CVE-2026-77516 per-tool authorization bypass in MaxKB agent and workflow dispatch."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# MaxKB Tool Dispatch Grant Bypass

## Current Understanding

The [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json) records [CVE-2026-77516](https://cveawg.mitre.org/api/cve/CVE-2026-77516) for MaxKB 2.0.0 through 2.9.2. Broad MaxKB product context belongs upstream; this page owns the per-tool grant boundary in agent and workflow dispatch.

A lowest-role workspace member who is denied access to a tool by `WorkspaceUserResourcePermission` can still bind the tool identifier through `tool_ids`, `skill_tool_ids`, or `mcp_tool_ids` and execute it through the agent or workflow dispatch path. The dispatch path does not reapply the per-tool grant enforced by dedicated tool routes, and tool execution can decrypt server-side `init_params`, exposing credentials carried by the denied tool. No fixed version was available in the captured CVE record.

## Security Impact

- Threat: workflow references can launder denied tools into delegated agent execution.
- Affected boundary: MaxKB 2.0.0 through 2.9.2; agent and workflow dispatch paths for tool identifiers.
- Exploit or incident status: public GitHub security advisory; no local exploitation evidence is recorded.
- Mitigation state: no fixed version identified in the captured record; enforce per-tool grants at dispatch time and rotate credentials stored in denied tools.
- Confidence: high for advisory existence and affected range; mitigation confidence is lower until a fixed release is identified.
- Residual risk: UI route authorization is insufficient when workflows and agents dereference tool IDs later.

## Authoritative Sources

- [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json)
- [CVE-2026-77516 JSON](https://cveawg.mitre.org/api/cve/CVE-2026-77516)
- [GitHub advisory GHSA-383v-fx78-pphm](https://github.com/1Panel-dev/MaxKB/security/advisories/GHSA-383v-fx78-pphm)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [MaxKB MCP tool import remote code execution](../agent-and-tool-security/maxkb-mcp-tool-import-rce.md)

## Open Questions

- Which MaxKB release fixes CVE-2026-77516?

## Maintenance Notes

- Created on 2026-09-21 from the [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json).
