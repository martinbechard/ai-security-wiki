---
type: "Topic"
title: "Mindio Magic MCP Sensitive Data Exposure"
description: "Security analysis for CVE-2026-104402 sensitive-data exposure in the Mindio Magic MCP WordPress plugin."
tags: ["data-and-privacy", "agent-and-tool-security"]
---

# Mindio Magic MCP Sensitive Data Exposure

## Current Understanding

The [October 4 topic collector source](../../../raw/processed/2026-10-04/ai-security-wiki-topic-news-collector-2026-10-04T233152Z.json) records [CVE-2026-104402](https://cveawg.mitre.org/api/cve/CVE-2026-104402) for the Mindio Magic MCP WordPress plugin. Broad WordPress plugin or product background belongs upstream only if reusable entity context is needed; this page owns the local MCP sensitive-data transmission boundary.

The CVE record describes insertion of sensitive information into sent data for `mindio-magic-mcp` through 0.5.6, while marking 0.7.1 as unaffected. The collector did not capture the full Patchstack detail page, so the exact exposed data classes remain an open question until primary advisory detail is fetched.

## Security Impact

- Threat: an MCP WordPress plugin can include sensitive application or AI-tool data in outbound data.
- Affected boundary: Mindio Magic MCP / `mindio-magic-mcp` through 0.5.6; sent-data handling; MCP-to-WordPress integration.
- Exploit or incident status: public CVE with NVD and Patchstack references; no confirmed exploitation incident is recorded locally.
- Mitigation state: upgrade to a version at or beyond the unaffected 0.7.1 boundary when vendor release evidence is confirmed, and review MCP traffic/logs for sensitive prompt, tool-output, credential, or site-data leakage.
- Confidence: high for affected range and in-window publication from CVE/NVD; medium for exposed data categories until Patchstack or vendor detail is reviewed.
- Residual risk: MCP plugins often bridge assistant context, site content, and tool output, so sent-data minimization and logging review remain necessary even after a version update.

## Authoritative Sources

- [October 4 topic collector source](../../../raw/processed/2026-10-04/ai-security-wiki-topic-news-collector-2026-10-04T233152Z.json)
- [CVE-2026-104402 record](https://cveawg.mitre.org/api/cve/CVE-2026-104402)
- [NVD CVE-2026-104402](https://nvd.nist.gov/vuln/detail/CVE-2026-104402)
- [Patchstack advisory reference](https://patchstack.com/database/wordpress/plugin/mindio-magic-mcp/vulnerability/wordpress-mindio-magic-mcp-plugin-0-5-6-sensitive-data-exposure-vulnerability?_s_id=cve)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [MCP data movement exposure controls](mcp-data-movement-exposure-controls.md)

## Open Questions

- Which specific sensitive data classes does CVE-2026-104402 expose?
- Which Mindio Magic MCP release first fixes the sent-data exposure?

## Maintenance Notes

- Created on 2026-10-05 from the [October 4 topic collector source](../../../raw/processed/2026-10-04/ai-security-wiki-topic-news-collector-2026-10-04T233152Z.json) as an MCP sensitive-data exposure leaf.
