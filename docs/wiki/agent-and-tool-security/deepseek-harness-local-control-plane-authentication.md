---
type: "Topic"
title: "DeepSeek Harness Local Control-Plane Authentication"
description: "Security analysis for CVE-2026-82033 unauthenticated HTTP and WebSocket agent-control access."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# DeepSeek Harness Local Control-Plane Authentication

## Current Understanding

The [November 5 collector source](../../../raw/processed/2026-11-05/ai-security-wiki-topic-news-collector-2026-11-05T003237Z.json) records [CVE-2026-82033](https://github.com/advisories/GHSA-h3m7-c9pq-7995) for DeepSeek Harness before 0.1.2-alpha.2. Broad product and harness workflow context remains upstream; this page owns the local control-plane authentication, approval binding, and credential-use boundary.

The advisory says an unauthenticated local HTTP and WebSocket RPC control plane permits another OS user to invoke agent sessions and observe event streams. It further reports that approval responses can be forged from identifiers broadcast on that stream. The referenced [0.1.2-alpha.2 release](https://github.com/deepseek-ai/deepseek-harness/releases/tag/dsh-v0.1.2-alpha.2) is a pre-release whose notes do not explicitly describe these authentication changes.

## Security Impact

- Threat: a separate local process can invoke prompts that reach Bash or filesystem tools using the victim's configured credentials.
- Affected boundary: DeepSeek Harness before 0.1.2-alpha.2; web-profile HTTP/WebSocket RPC, event mux, and tool-approval responses.
- Exploit or incident status: public advisory; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to the referenced release or a later supported release, require authenticated local control and telemetry channels, and bind approvals to an authenticated session and requester.
- Confidence: high for the advisory's missing-authentication and approval-binding report; medium for exact remediation because release notes are not explicit.
- Residual risk: loopback services remain cross-user authority boundaries unless authentication, origin restrictions, and non-broadcast approval secrets are enforced together.

## Authoritative Sources

- [November 5 collector source](../../../raw/processed/2026-11-05/ai-security-wiki-topic-news-collector-2026-11-05T003237Z.json)
- [GitHub advisory GHSA-h3m7-c9pq-7995](https://github.com/advisories/GHSA-h3m7-c9pq-7995)
- [DeepSeek Harness 0.1.2-alpha.2 release](https://github.com/deepseek-ai/deepseek-harness/releases/tag/dsh-v0.1.2-alpha.2)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [OpenHands agent sandbox unauthenticated RCE](openhands-agent-sandbox-unauthenticated-rce.md)
- [Pydantic AI local web chat origin bypass](pydantic-ai-local-web-chat-origin-bypass.md)

## Open Questions

- Which supported release, if any, documents the authentication and approval-binding remediation outside the pre-release reference?

## Maintenance Notes

- Created on 2026-11-05 from the November 5 collector after upstream routing retained this agent-authority boundary locally.
