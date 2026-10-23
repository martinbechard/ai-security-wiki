---
type: "Topic"
title: "Agent Zero Web UI Stored XSS"
description: "Security analysis for CVE-2026-97635 untrusted agent-chat and upload content executing in an authenticated console."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# Agent Zero Web UI Stored XSS

## Current Understanding

The [October 22 topic collector source](../../../raw/processed/2026-10-22/ai-security-wiki-topic-news-collector-2026-10-22T232635Z.json) records [CVE-2026-97635](https://cveawg.mitre.org/api/cve/CVE-2026-97635) for Agent Zero Web UI before 1.15. Broad Agent Zero context belongs upstream; this leaf owns the privileged agent-console content-rendering boundary.

## Security Impact

- Threat: stored chat-message or file-upload content can execute injected JavaScript in an authenticated Agent Zero session.
- Affected boundary: Agent Zero Web UI before 1.15; user-supplied chat-message and file-upload content to an authenticated agent-console browser context.
- Exploit or incident status: public CVE disclosure and CISA CSAF reference; no exploitation incident is recorded locally.
- Mitigation state: upgrade to 1.15 or later and retain output encoding and content-isolation controls for untrusted agent inputs and tool artifacts.
- Confidence: high for the affected version and stored-XSS mechanism; remediation-specific session invalidation or CSP behavior is not established by the collected evidence.
- Residual risk: as a control inference, any untrusted artifact displayed beside privileged controls can convert content execution into session-level authority; this source specifically establishes chat-message and upload content.

## Authoritative Sources

- [October 22 topic collector source](../../../raw/processed/2026-10-22/ai-security-wiki-topic-news-collector-2026-10-22T232635Z.json)
- [CVE-2026-97635](https://cveawg.mitre.org/api/cve/CVE-2026-97635)
- [Agent Zero v1.15 release](https://github.com/agent0ai/agent-zero/releases/tag/v1.15)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [EdgeEver MCP-Token Stored XSS](edgeever-mcp-token-stored-xss.md)

## Open Questions

- Does Agent Zero v1.15 add a content-security policy or invalidate active sessions in addition to sanitizing stored content?

## Maintenance Notes

- Created on 2026-10-22 from the October 22 topic collector; keep console rendering distinct from broad Agent Zero product coverage.
