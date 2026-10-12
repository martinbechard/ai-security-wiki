---
type: "Topic"
title: "Nexting pinclaw Prompt Injection Auth Bypass"
description: "Security analysis for CVE-2026-108757 unauthenticated prompt injection into OpenClaw through Nexting pinclaw."
tags: ["agent-and-tool-security"]
---

# Nexting pinclaw Prompt Injection Auth Bypass

## Current Understanding

The [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json) records [CVE-2026-108757](https://nvd.nist.gov/vuln/detail/CVE-2026-108757) for Nexting pinclaw through 0.3.0. Broad OpenClaw and pinclaw product context belongs upstream; this page owns the local prompt-ingress authentication boundary.

The CVE evidence says `POST /pinclaw/send` skips the `authToken` check while binding port 18790 on all interfaces by default. Unauthenticated callers can inject blind prompts into a user's main OpenClaw agent session as user instructions.

## Security Impact

- Threat: unauthenticated network callers can steer a user's agent session through a prompt ingress endpoint.
- Affected boundary: Nexting pinclaw through 0.3.0, `POST /pinclaw/send`, default all-interface listener on port 18790, `authToken` enforcement, and OpenClaw user-instruction channel.
- Exploit or incident status: public NVD and CVE Services records; no confirmed exploitation incident is recorded locally.
- Mitigation state: enforce authentication on prompt ingress, bind local helper ports to loopback by default, and log agent-session prompt provenance.
- Confidence: high for affected range and endpoint behavior from CVE evidence.
- Residual risk: prompt ingress endpoints are control-plane surfaces when they write directly into the user's main agent session.

## Authoritative Sources

- [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json)
- [NVD CVE-2026-108757](https://nvd.nist.gov/vuln/detail/CVE-2026-108757)
- [CVE-2026-108757 record](https://cveawg.mitre.org/api/cve/CVE-2026-108757)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [OpenClaw agent authority and approval cluster](openclaw-agent-authority-and-approval-cluster.md)
- [Pydantic AI local web chat origin bypass](pydantic-ai-local-web-chat-origin-bypass.md)
- [MCP context injection transparency](mcp-context-injection-transparency.md)

## Open Questions

- Which pinclaw release fixes `authToken` enforcement and default bind address?

## Maintenance Notes

- Created on 2026-10-12 from the [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json).
