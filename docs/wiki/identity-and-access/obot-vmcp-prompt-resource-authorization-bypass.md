---
type: "Topic"
title: "Obot vMCP Prompt Resource Authorization Bypass"
description: "Security analysis for CVE-2026-105139 Obot vMCP profile prompts and resources reachable outside granted components."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# Obot vMCP Prompt Resource Authorization Bypass

## Current Understanding

The [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json) records [CVE-2026-105139](https://cveawg.mitre.org/api/cve/CVE-2026-105139) for Obot vMCP profile prompt and resource authorization. Broad Obot product context belongs upstream; this page owns the local vMCP profile access-control boundary.

The CVE title says Obot 0.26.0 before 0.26.2 allows authorization bypass via vMCP profile prompts and resources. The collector records that vMCP profiles enforced access for tools but not prompts and resources, so authenticated users matching a profile could reach ungranted component context.

## Security Impact

- Threat: a user authorized for one vMCP profile can read prompts or resources for components outside the intended grant.
- Affected boundary: Obot 0.26.0 before 0.26.2, vMCP profiles, component grants, prompts, resources, and tool-only enforcement drift.
- Exploit or incident status: public CVE Services record and GitHub advisory; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to Obot 0.26.2 or later and apply the same component-grant checks to tools, prompts, and resources.
- Confidence: high for affected range and fixed version; medium for prompt/resource sensitivity until deployment-specific components are inspected.
- Residual risk: MCP authorization checks must be capability-family complete because prompt and resource endpoints can carry as much authority as tools.

## Authoritative Sources

- [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json)
- [CVE-2026-105139 record](https://cveawg.mitre.org/api/cve/CVE-2026-105139)
- [GHSA-xhpw-65qw-wj6m](https://github.com/obot-platform/obot/security/advisories/GHSA-xhpw-65qw-wj6m)
- [Obot 0.26.2 release](https://github.com/obot-platform/obot/releases/tag/v0.26.2)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [Obot MCP catalog credential exposure](../data-and-privacy/obot-mcp-catalog-credential-exposure.md)
- [Obot composite MCP route authorization bypass](obot-composite-mcp-route-authorization-bypass.md)
- Upstream AI wiki owns broad [Obot product coverage](../../../upstream-ai-wiki/mcp-servers/obot-mcp-enterprise-roadmap.md).

## Open Questions

- Which Obot tests prove vMCP profile authorization is identical for tool, prompt, and resource access?

## Maintenance Notes

- Created on 2026-10-09 from the [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json) as a vMCP prompt/resource authorization leaf.
