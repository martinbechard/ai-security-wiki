---
type: "Topic"
title: "AI Provider Override Trust Boundaries"
description: "Security controls for client-selected AI provider, base URL, and model endpoint overrides."
---

# AI Provider Override Trust Boundaries

## Current Understanding

AI provider override trust boundaries govern whether clients may choose model providers, base URLs, headers, or other provider-routing values. [next-ai-draw-io provider disclosure](next-ai-draw-io-provider-disclosure.md) shows the risk: a client-selected provider exemption can route prompts, conversation content, and diagram data to an attacker-controlled endpoint.

Provider routing should be server-authorized. A client header can request a configured option, but it should not define which security exemptions apply or where sensitive prompt payloads are sent.

## Control Implications

- Keep provider allowlists and exemption rules in server-side configuration.
- Reject arbitrary external base URLs unless the caller supplies a scoped credential and the destination is explicitly allowed.
- Do not let client-selected provider names disable SSRF or credential-protection guards.
- Treat system prompts, user messages, tool schemas, and working documents as sensitive data when routed to provider endpoints.
- Log provider, base URL class, credential source, and data class for model calls involving overrides.

## Authoritative Sources

- [next-ai-draw-io provider disclosure](next-ai-draw-io-provider-disclosure.md)
- [July 22 topic news collector source](../../../raw/processed/2026-07-22/ai-security-wiki-topic-news-collector-2026-07-22T193242-0400.json)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [agent network egress controls](../agent-and-tool-security/agent-network-egress-controls.md)
- [identity and access](../identity-and-access/index.md)

## Open Questions

- Which provider override fields should be allowed in public AI applications versus administrative-only configuration?

## Maintenance Notes

- Created as a reusable control leaf during July 22, 2026 raw-source ingest.
