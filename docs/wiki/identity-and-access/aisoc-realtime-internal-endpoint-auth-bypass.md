---
type: "Topic"
title: "AiSOC Realtime Internal Endpoint Auth Bypass"
description: "Security analysis for CVE-2026-103057 authentication bypass in AiSOC realtime internal event endpoints."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# AiSOC Realtime Internal Endpoint Auth Bypass

## Current Understanding

The [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json) records [CVE-2026-103057](https://cveawg.mitre.org/api/cve/CVE-2026-103057) for AiSOC versions 5.1.0 before 12.0.0. This page owns the local realtime internal endpoint authentication and notification-spoofing boundary.

The CVE record says internal realtime endpoints `POST /internal/agent-event` and `POST /internal/push` have an authentication bypass. Attackers can post arbitrary events with spoofed tenant identifiers, broadcast malicious content over WebSocket and Redis SSE channels, or send unauthorized notifications to registered devices.

## Security Impact

- Threat: attackers can inject realtime events or push notifications into tenant-scoped channels.
- Affected boundary: AiSOC 5.1.0 before 12.0.0, `POST /internal/agent-event`, `POST /internal/push`, tenant identifiers, WebSocket, Redis SSE, and registered device notifications.
- Exploit or incident status: public CVE record; no confirmed active exploitation is recorded in the source.
- Mitigation state: update to AiSOC 12.0.0 or later and authenticate internal realtime endpoints with service identity plus tenant authorization checks.
- Confidence: high for public CVE identity and behavior; medium for deployment-specific exposure until vendor detail is captured.
- Residual risk: internal endpoints that broadcast to users or agents need authentication even when they are intended for service-to-service traffic.

## Authoritative Sources

- [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json)
- [CVE-2026-103057 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-103057)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [cloud observability MCP response controls](../agent-and-tool-security/cloud-observability-mcp-response-controls.md)

## Open Questions

- Which AiSOC advisory identifies whether the internal realtime endpoints were externally reachable in default deployments?

## Maintenance Notes

- Created on 2026-10-02 from the [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json) after splitting the AiSOC CVE cluster into item-level leaves.
