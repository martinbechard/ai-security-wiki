---
type: "Topic"
title: "IBM ContextForge Dashboard DOM XSS"
description: "Security analysis for CVE-2026-110199 mutation-XSS in ContextForge MCP Gateway dashboard notifications."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# IBM ContextForge Dashboard DOM XSS

## Current Understanding

The [November 15 collector source](../../../raw/processed/2026-11-15/ai-security-wiki-topic-news-collector-2026-11-15T003503Z.json) records [CVE-2026-110199](https://nvd.nist.gov/vuln/detail/CVE-2026-110199): a mutation-XSS sanitizer bypass in IBM ContextForge MCP Gateway dashboard status and error notifications can execute arbitrary JavaScript in an authenticated administrator session when the administrator opens a crafted link. Broad ContextForge coverage belongs upstream; this leaf owns the administrator control-plane rendering boundary.

## Security Impact

- Threat: crafted page-URL values reach dashboard notification rendering and execute script in an administrator session.
- Affected boundary: IBM ContextForge MCP Gateway v1.0.0 through v1.0.11 dashboard status and error notifications.
- Exploit or incident status: public IBM security bulletin; no active exploitation or local incident is established.
- Mitigation state: IBM identifies v1.1.0 as the remediation release and states that no workaround is available; upgrade to v1.1.0 or later.
- Confidence: high for scope and remediation because IBM's bulletin states both.
- Residual risk: an administrator browser session can hold routing and credential-control authority, so exposed deployments should review administrator sessions after upgrading.

## Authoritative Sources

- [November 15 collector source](../../../raw/processed/2026-11-15/ai-security-wiki-topic-news-collector-2026-11-15T003503Z.json)
- [IBM security bulletin](https://www.ibm.com/support/pages/node/7296694)
- [GitHub advisory GHSA-5c6v-rx44-457j](https://github.com/advisories/GHSA-5c6v-rx44-457j)
- [NVD CVE-2026-110199](https://nvd.nist.gov/vuln/detail/CVE-2026-110199)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [IBM ContextForge bulk-import tenant overwrite](ibm-contextforge-bulk-import-tenant-overwrite.md)
- [MCP Context Forge global prompts stored XSS](../model-and-prompt-security/mcp-context-forge-global-prompts-stored-xss.md)

## Open Questions

- Does the v1.1.0 release artifact identify every dashboard notification render path covered by the sanitizer repair?

## Maintenance Notes

- Created on 2026-11-15 as a dashboard-session boundary distinct from ContextForge gateway egress, tenant isolation, and prompt-rendering findings.
