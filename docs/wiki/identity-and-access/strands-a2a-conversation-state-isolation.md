---
type: "Topic"
title: "Strands A2A Conversation-State Isolation"
description: "Security analysis for CVE-2026-115419 cross-tenant A2A conversation access and persistent instruction injection."
tags: ["identity-and-access", "agent-and-tool-security", "model-and-prompt-security"]
---

# Strands A2A Conversation-State Isolation

## Current Understanding

The [October 22 topic collector source](../../../raw/processed/2026-10-22/ai-security-wiki-topic-news-collector-2026-10-22T232635Z.json) records [CVE-2026-115419](https://cveawg.mitre.org/api/cve/CVE-2026-115419) / [GHSA-4v6f-7vjh-6x4m](https://github.com/strands-agents/harness-sdk/security/advisories/GHSA-4v6f-7vjh-6x4m). Broad [Amazon Strands Agents SDK context](../../../upstream-ai-wiki/agentic-frameworks/strands-agents.md) belongs upstream; this leaf owns A2A conversation-state ownership, distinct from the existing Strands nested-tool consent boundary.

## Security Impact

- Threat: an authenticated remote user can select another tenant's `context_id`, read its conversation history, and persist instructions that influence later callers.
- Affected boundary: `strands-agents` Python before 1.43.0 and `@strands-agents/sdk` TypeScript before 1.5.0; A2A context identifier to authenticated caller and tenant authorization.
- Exploit or incident status: public AWS bulletin, maintainer advisory, and CVE disclosure; no exploitation incident is recorded locally.
- Mitigation state: upgrade to Python 1.43.0 or TypeScript 1.5.0 or later, and bind conversation state to the authenticated principal and tenant server-side.
- Confidence: high because the source identifies both package lines, scope, impact, and fixed versions.
- Residual risk: agent memory becomes both a confidentiality boundary and a persistent prompt-injection channel when ownership is not enforced on every state operation.

## Authoritative Sources

- [October 22 topic collector source](../../../raw/processed/2026-10-22/ai-security-wiki-topic-news-collector-2026-10-22T232635Z.json)
- [AWS security bulletin 2026-146](https://aws.amazon.com/security/security-bulletins/2026-146-aws/)
- [GHSA-4v6f-7vjh-6x4m](https://github.com/strands-agents/harness-sdk/security/advisories/GHSA-4v6f-7vjh-6x4m)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [Repeat-After-Me Tool-Call Authorization Bypass](../agent-and-tool-security/repeat-after-me-tool-call-authorization-bypass.md)

## Open Questions

- Do the fixed SDKs bind context ownership on creation, read, update, and deletion, and do they invalidate already shared context identifiers?

## Maintenance Notes

- Created on 2026-10-22 from the October 22 topic collector; preserve the distinct state-isolation and nested-tool-consent boundaries.
