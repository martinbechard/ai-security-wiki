---
type: "Topic"
title: "Open WebUI terminal execution boundaries"
description: "Security analysis for Open WebUI 0.11.0 terminal preview origin script execution and terminal WebSocket approval-boundary loss."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Open WebUI terminal execution boundaries

## Current Understanding

The [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json) records NVD in-window updates for Open WebUI terminal vulnerabilities fixed in 0.11.0. Broad Open WebUI product context belongs upstream; this page owns the terminal boundary where assistant UI state, preview rendering, and WebSocket execution controls can cross into command execution authority.

The records describe terminal preview origin script execution and terminal WebSocket approval-boundary loss. The durable control is that terminal preview content and terminal command channels need explicit origin, session, authorization, and approval binding before any script or command reaches the host.

## Security Impact

- Threat: rendered terminal preview content or WebSocket session confusion can cross from assistant UI into host execution.
- Affected boundary: Open WebUI versions before 0.11.0; terminal preview and terminal WebSocket paths.
- Exploit or incident status: public NVD/CVE/GitHub advisory evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade to Open WebUI 0.11.0 or later and enforce per-session terminal authorization, content isolation, and approval checks.
- Confidence: high for NVD update timing and fixed-version signal; medium for exact exploit prerequisites.
- Residual risk: AI workspaces with embedded terminals need execution-edge checks independent of chat, preview, or websocket connection state.

## Authoritative Sources

- [September 8 topic collector source](../../../raw/processed/2026-09-08/ai-security-wiki-topic-news-collector-2026-09-08T233200Z.json)
- [Open WebUI v0.11.0 release](https://github.com/open-webui/open-webui/releases/tag/v0.11.0)
- [CVE-2026-70483 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-70483)
- [CVE-2026-70484 NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-70484)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [local agent execution and processing boundaries](local-agent-execution-and-processing-boundaries.md)
- [coding agent command approval boundaries](coding-agent-command-approval-boundaries.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-08 from the September 8 topic collector after verifier correction split the Open WebUI release wave into focused security-boundary leaves.
