---
type: "Topic"
title: "Flowise public-chatflow MCP token disclosure"
description: "Security analysis for CVE-2026-130796, where a public Flowise chatflow can expose an MCP bearer token."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# Flowise public-chatflow MCP token disclosure

## Current Understanding

The [November 19 topic collector source](../../../raw/processed/2026-11-19/ai-security-wiki-topic-news-collector-2026-11-19T003503Z.json) records CVE-2026-130796 for Flowise 3.1.3 through 3.1.4. Broad Flowise product context belongs upstream; this leaf owns the public-chatflow authorization boundary and delegated MCP credential exposure.

The source states that the public-chatflow representation can disclose the delegated bearer token needed to invoke its configured MCP flow. This crosses the intended API-key boundary and can consume the owner's model quota. No fixed version is established; [Flowise lifecycle information](https://flowiseai.com/sunset) is context, not evidence of a supported remediation.

## Security Impact

- Threat: an unauthenticated caller can reuse a disclosed delegated MCP bearer token to invoke a public flow.
- Affected boundary: Flowise 3.1.3 through 3.1.4 public chatflows with an MCP-server configuration, where an unauthenticated caller knows the public chatflow identifier.
- Exploit or incident status: public NVD/CNA-sourced vulnerability record; no confirmed exploitation or local incident is recorded.
- Mitigation state: restrict public chatflows, rotate exposed MCP bearer tokens, review invocation logs and model-quota use, and establish a supported patched distribution before relying on a version-based fix.
- Confidence: high for the reported affected range and request paths; medium for remediation availability because NVD records no fixed version.
- Residual risk: public identifiers and previously exposed tokens may remain usable until credentials are rotated and service-side authorization is rechecked.

## Authoritative Sources

- [November 19 topic collector source](../../../raw/processed/2026-11-19/ai-security-wiki-topic-news-collector-2026-11-19T003503Z.json)
- [CVE-2026-130796 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-130796)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/flowise-3.1.3-through-3.1.4-mcp-server-token-disclosure-via-public-chatflow-endpoint)
- [Flowise public-chatflow controller reference](https://github.com/FlowiseAI/Flowise/blob/a65f81bb43ef66d3ce734bf0dff4223ae8041c95/packages/server/src/controllers/chatflows/index.ts#L229-L256)

## Related Code

- Upstream code: [Flowise public-chatflow controller reference](https://github.com/FlowiseAI/Flowise/blob/a65f81bb43ef66d3ce734bf0dff4223ae8041c95/packages/server/src/controllers/chatflows/index.ts#L229-L256).

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [Flowise chatflow and agentflow deletion authorization](flowise-chatflow-agentflow-deletion-authorization.md)
- [agent and tool security](../agent-and-tool-security/index.md)

## Open Questions

- Which supported Flowise distribution, if any, remediates CVE-2026-130796?

## Maintenance Notes

- Created on 2026-11-19 from the November 19 topic collector. Recheck remediation availability and rotate credentials if a public chatflow may have exposed a token.
