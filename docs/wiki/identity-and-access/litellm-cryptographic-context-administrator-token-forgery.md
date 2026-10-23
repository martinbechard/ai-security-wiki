---
type: "Topic"
title: "LiteLLM Cryptographic-Context Administrator-Token Forgery"
description: "Security analysis for CVE-2026-114612 encrypted API-key metadata forged into a LiteLLM administrator bearer credential."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# LiteLLM Cryptographic-Context Administrator-Token Forgery

## Current Understanding

The [October 22 topic collector source](../../../raw/processed/2026-10-22/ai-security-wiki-topic-news-collector-2026-10-22T232635Z.json) records [CVE-2026-114612](https://cveawg.mitre.org/api/cve/CVE-2026-114612) / [GHSA-7hp6-4w63-5g45](https://github.com/BerriAI/litellm/security/advisories/GHSA-7hp6-4w63-5g45). Broad [LiteLLM gateway context](../../../upstream-ai-wiki/developer-tools/litellm.md) belongs upstream; this leaf owns cryptographic domain separation between at-rest secret metadata and administrator session identity, distinct from the existing [LiteLLM MCP authentication bypass](../agent-and-tool-security/litellm-mcp-authentication-bypass-kev.md).

## Security Impact

- Threat: an authenticated internal user can craft API-key metadata into a forged encrypted administrator credential, replay it as a bearer token, and gain proxy-administrator access including arbitrary MCP stdio commands.
- Affected boundary: LiteLLM 1.87.0 through affected release lines; 1.87.0 through 1.90.x require `EXPERIMENTAL_UI_LOGIN`, while later affected versions are default-exploitable.
- Exploit or incident status: public maintainer advisory and CVE disclosure; no exploitation incident is recorded locally.
- Mitigation state: upgrade to 1.100.4, 1.101.3, 1.102.2, 1.103.1, or 1.104.0-rc.2 as applicable, and rotate affected secrets and tokens under maintainer guidance.
- Confidence: high for affected and fixed lines, preconditions, and escalation path from the maintainer-linked evidence.
- Residual risk: encrypting unrelated data with one cryptographic context can turn a data-at-rest primitive into an administrative identity issuer.

## Authoritative Sources

- [October 22 topic collector source](../../../raw/processed/2026-10-22/ai-security-wiki-topic-news-collector-2026-10-22T232635Z.json)
- [GHSA-7hp6-4w63-5g45](https://github.com/BerriAI/litellm/security/advisories/GHSA-7hp6-4w63-5g45)
- [LiteLLM v1.100.4 release](https://github.com/BerriAI/litellm/releases/tag/v1.100.4)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [LiteLLM MCP Authentication Bypass KEV](../agent-and-tool-security/litellm-mcp-authentication-bypass-kev.md)

## Open Questions

- Which deployed LiteLLM keys, sessions, and encrypted API-key metadata require rotation after an affected release is upgraded?

## Maintenance Notes

- Created on 2026-10-22 from the October 22 topic collector; retain separate treatment for cryptographic identity forgery and unauthenticated MCP transport access.
