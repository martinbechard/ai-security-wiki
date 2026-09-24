---
type: "Topic"
title: "Kimi Code MCP Configuration Loader Command Injection"
description: "Security analysis for CVE-2026-95660, where Kimi Code MCP configuration loading can reach OS command injection."
tags: ["agent-and-tool-security"]
---

# Kimi Code MCP Configuration Loader Command Injection

## Current Understanding

The [September 23 topic collector source](../../../raw/processed/2026-09-23/ai-security-wiki-topic-news-collector-2026-09-23T233151Z.json) records [CVE-2026-95660](https://cveawg.mitre.org/api/cve/CVE-2026-95660) for Moonshot AI [Kimi Code](../../../upstream-ai-wiki/developer-tools/kimi-code.md) 0.1 through 0.31.0. Broad [Moonshot AI](../../../upstream-ai-wiki/companies/moonshot-ai.md) and Kimi Code product context belongs upstream; this page owns the local MCP configuration trust boundary.

The issue is distinct from [Kimi Code FetchURL SSRF](kimi-code-fetchurl-ssrf.md). The CVE source says the MCP Configuration Loader can execute OS commands through untrusted workspace `.mcp.json` auto-spawn behavior and a secondary PATH planting vector around helper binaries. The collector records public exploit status but does not reproduce exploit steps; this leaf keeps the operational detail at the control-boundary level.

## Security Impact

- Threat: untrusted workspace configuration can cross from project data into local command execution before or around tool trust prompts.
- Affected boundary: Moonshot AI Kimi Code 0.1 through 0.31.0, MCP Configuration Loader, `.mcp.json`, and helper binary resolution.
- Exploit or incident status: public CVE/NVD/VulDB records and public exploit note; exploit steps are intentionally not reproduced here.
- Mitigation state: upgrade to 0.31.1 or later; resolve helper binaries to trusted absolute paths and require explicit review before spawning MCP servers from workspace configuration.
- Confidence: moderate-high from CVE, NVD, VulDB, and fixed release references; lower for exact exploit mechanics until primary patch details are reviewed.
- Residual risk: coding agents need configuration provenance controls because repository-local MCP settings can carry tool-launch authority.

## Authoritative Sources

- [September 23 topic collector source](../../../raw/processed/2026-09-23/ai-security-wiki-topic-news-collector-2026-09-23T233151Z.json)
- [CVE-2026-95660 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-95660)
- [NVD CVE-2026-95660](https://nvd.nist.gov/vuln/detail/CVE-2026-95660)
- [VulDB CVE-2026-95660](https://vuldb.com/cve/CVE-2026-95660)
- [Kimi Code 0.31.1 release](https://github.com/MoonshotAI/kimi-code/releases/tag/%40moonshot-ai%2Fkimi-code%400.31.1)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Kimi Code FetchURL SSRF](kimi-code-fetchurl-ssrf.md)
- [coding agent command approval boundaries](coding-agent-command-approval-boundaries.md)
- Upstream AI development wiki owns general [human-agent approval boundary](../../../upstream-ai-dev-wiki/adoption-and-operating-model/human-agent-approval-boundaries.md) practice.

## Open Questions

- Which patch commits or release notes precisely document the `.mcp.json` auto-spawn and PATH planting fixes in Kimi Code 0.31.1?

## Maintenance Notes

- Created on 2026-09-24 from the [September 23 topic collector source](../../../raw/processed/2026-09-23/ai-security-wiki-topic-news-collector-2026-09-23T233151Z.json); keep future updates focused on MCP configuration authority, not broad Kimi Code product behavior.
