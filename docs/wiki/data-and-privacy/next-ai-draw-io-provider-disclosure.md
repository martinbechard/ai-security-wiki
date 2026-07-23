---
type: "Topic"
title: "next-ai-draw-io Provider Disclosure"
description: "Security analysis for CVE-2026-50756, where provider override handling exposes AI prompt and conversation data."
---

# next-ai-draw-io Provider Disclosure

## Current Understanding

The [July 22 topic news collector source](../../../raw/processed/2026-07-22/ai-security-wiki-topic-news-collector-2026-07-22T193242-0400.json) records CVE-2026-50756 for next-ai-draw-io 0.4.13 and the `x-ai-provider` component. [GitHub issue 749](https://github.com/DayuanJiang/next-ai-draw-io/issues/749) describes an SSRF guard bypass where client-controlled provider and base URL headers can send the system prompt, user messages, and diagram XML to an attacker-controlled endpoint.

This page owns the data-exposure and weak-authentication lens. [AI provider override trust boundaries](ai-provider-override-trust-boundaries.md) owns the reusable provider-routing control. Broad next-ai-draw-io product context remains upstream, and the separate MCP server path traversal advisory is tracked in [next-ai-draw-io MCP server path traversal](../agent-and-tool-security/next-ai-draw-io-mcp-server-path-traversal.md).

## Security Impact

- Threat: weak authentication and provider-spoofed SSRF expose AI application prompts, user messages, and diagram content.
- Affected boundary: next-ai-draw-io 0.4.13, `x-ai-provider`, `x-ai-base-url`, and provider override handling.
- Exploit or incident status: public CVE and GitHub issue; the issue is closed, but the raw source did not identify a fixed next-ai-draw-io release.
- Mitigation state: patch state is unresolved locally; candidate controls include server-side provider configuration, same-origin or allowlisted provider base URLs, and rejecting client-selected provider exemptions.
- Confidence: medium-high for vulnerability mechanics from NVD and the linked issue; medium for remediation because package metadata checked during ingest did not identify a normalized fixed version.
- Residual risk: applications with provider-override headers can leak prompts or user data even when provider API keys are not exposed.

## Authoritative Sources

- [July 22 topic news collector source](../../../raw/processed/2026-07-22/ai-security-wiki-topic-news-collector-2026-07-22T193242-0400.json)
- NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-50756
- GitHub issue 749: https://github.com/DayuanJiang/next-ai-draw-io/issues/749

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [AI provider override trust boundaries](ai-provider-override-trust-boundaries.md)
- [identity and access](../identity-and-access/index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- Upstream AI wiki owns broad product and provider context.

## Open Questions

- Which next-ai-draw-io release, if any, fixes CVE-2026-50756?

## Maintenance Notes

- Added from the July 22, 2026 raw collector artifact, linked GitHub issue, and package metadata checks.
