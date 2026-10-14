---
type: "Topic"
title: "MCP Context Forge Global Prompts Stored XSS"
description: "Security analysis for CVE-2026-53711, where MCP Context Forge Admin UI stores global prompts without sufficient output encoding."
tags: ["model-and-prompt-security", "agent-and-tool-security"]
---

# MCP Context Forge Global Prompts Stored XSS

## Current Understanding

The [October 13 topic collector source](../../../raw/processed/2026-10-13/ai-security-wiki-topic-news-collector-2026-10-13T232603Z.json) records [CVE-2026-53711](https://nvd.nist.gov/vuln/detail/CVE-2026-53711) for MCP Context Forge Admin UI 0.2.0 through 0.3.1. Broad MCP Context Forge product context belongs upstream; this page owns the shared prompt-management and admin UI rendering boundary.

The CVE evidence says Global Prompts are stored without sufficient output encoding, allowing authenticated stored XSS when another user views a saved prompt. The local security concern is prompt-governance content becoming active browser code inside an MCP administration surface.

## Security Impact

- Threat: authenticated prompt authors can persist script that executes in another administrator's browser.
- Affected boundary: MCP Context Forge Admin UI 0.2.0 through 0.3.1, Global Prompts storage, and prompt rendering.
- Exploit or incident status: public CVE record; no confirmed exploitation incident is recorded locally.
- Mitigation state: fixed version was not confirmed in the collector evidence; output encoding and content security policy should protect prompt-management views.
- Confidence: high for affected range and stored-XSS shape from NVD/CVE evidence; medium for remediation state.
- Residual risk: shared prompt libraries are governance assets and can become cross-user execution channels if treated as trusted text.

## Control Implications

- Encode prompt text at every HTML render point, including previews and administration lists.
- Treat prompt-management roles as security-sensitive because saved prompts can affect other users and agents.
- Regression-test prompt fields with HTML, script, Markdown, and template-like payloads.

## Authoritative Sources

- [October 13 topic collector source](../../../raw/processed/2026-10-13/ai-security-wiki-topic-news-collector-2026-10-13T232603Z.json)
- [NVD CVE-2026-53711](https://nvd.nist.gov/vuln/detail/CVE-2026-53711)
- [CVE Services CVE-2026-53711](https://cveawg.mitre.org/api/cve/CVE-2026-53711)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [MCP Context Forge default JWT secret](../identity-and-access/mcp-context-forge-default-jwt-secret.md)

## Open Questions

- Which MCP Context Forge Admin UI release remediates CVE-2026-53711, and does it encode all Global Prompt render paths?

## Maintenance Notes

- Created on 2026-10-14 from the October 13 topic collector after splitting prompt UI rendering from gateway JWT secret handling.
