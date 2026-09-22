---
type: "Topic"
title: "MaxKB Expired MCP Application Key"
description: "Security analysis for CVE-2026-77519 expired application API keys accepted by MaxKB /chat/api/mcp."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# MaxKB Expired MCP Application Key

## Current Understanding

The [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json) records [CVE-2026-77519](https://cveawg.mitre.org/api/cve/CVE-2026-77519) for MaxKB 2.10.2-lts and earlier. Broad MaxKB product context belongs upstream; this page owns the MCP chat API key expiry boundary.

The `/chat/api/mcp` authentication path looks up an `ApplicationApiKey` using only its secret and active status, without enforcing the `is_permanent` and `expire_time` checks used by the standard chat API. A previously valid non-permanent key that remains active after expiration can initialize the MCP endpoint, list published application tool metadata, invoke `tools/call`, and create durable application chat state even though `/chat/api/open` rejects the same key. No fixed version was available in the captured record.

## Security Impact

- Threat: expired application keys can retain MCP tool-call authority after the standard chat API rejects them.
- Affected boundary: MaxKB 2.10.2-lts and earlier; `/chat/api/mcp` application API key validation.
- Exploit or incident status: public GitHub advisory; no local exploitation evidence is recorded.
- Mitigation state: no fixed version identified; disable stale active keys, enforce expiry on every application-key path, and audit MCP chat records created by expired tokens.
- Confidence: high for advisory existence and affected range; fixed-version confidence is unavailable.
- Residual risk: parallel MCP endpoints must share the same credential lifecycle rules as standard chat endpoints.

## Authoritative Sources

- [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json)
- [CVE-2026-77519 JSON](https://cveawg.mitre.org/api/cve/CVE-2026-77519)
- [GitHub advisory GHSA-r6g6-69fh-c39q](https://github.com/1Panel-dev/MaxKB/security/advisories/GHSA-r6g6-69fh-c39q)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MaxKB tool dispatch grant bypass](maxkb-tool-dispatch-grant-bypass.md)

## Open Questions

- Which MaxKB release fixes CVE-2026-77519?

## Maintenance Notes

- Created on 2026-09-21 from the [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json).
