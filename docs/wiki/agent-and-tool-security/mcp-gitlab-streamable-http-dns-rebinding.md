---
type: "Topic"
title: "mcp-gitlab Streamable HTTP DNS Rebinding"
description: "Security analysis for CVE-2026-61568 mcp-gitlab Streamable HTTP Host and Origin validation failure."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# mcp-gitlab Streamable HTTP DNS Rebinding

## Current Understanding

The [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) records [CVE-2026-61568](https://cveawg.mitre.org/api/cve/CVE-2026-61568) for `@zereight/mcp-gitlab` before 2.1.30. This page owns the local Streamable HTTP Host/Origin and browser-to-local-listener boundary.

The CVE says the Streamable HTTP endpoint lacks effective Host or Origin validation. A malicious web page can use DNS rebinding to reach a victim's local MCP listener with attacker-controlled Host and Origin headers.

## Security Impact

- Threat: browser-origin traffic can reach a local Streamable HTTP MCP listener and issue tool requests.
- Affected boundary: `@zereight/mcp-gitlab` before 2.1.30, Streamable HTTP transport, Host validation, Origin validation, and loopback listener exposure.
- Exploit or incident status: public CVE; no local exploitation incident is recorded.
- Mitigation state: upgrade to 2.1.30 or later, bind local listeners narrowly, enforce Host and Origin allowlists, and block DNS rebinding paths.
- Confidence: high for CVE publication, affected range, and remediation target from the September 17 collector.
- Residual risk: local MCP listeners remain browser-reachable unless clients combine loopback binding, origin validation, DNS rebinding defenses, and per-tool authentication.

## Authoritative Sources

- [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json)
- [CVE-2026-61568 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-61568)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [mcp-gitlab transport exposure and PAT theft](mcp-gitlab-transport-exposure-and-pat-theft.md)
- [agent network egress controls](agent-network-egress-controls.md)

## Open Questions

- Which mcp-gitlab deployments expose Streamable HTTP listeners beyond loopback?

## Maintenance Notes

- Created on 2026-09-19 after verifier correction split the mcp-gitlab transport-hardening router into focused leaves.
