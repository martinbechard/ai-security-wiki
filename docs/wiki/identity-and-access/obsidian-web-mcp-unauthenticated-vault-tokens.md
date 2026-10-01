---
type: "Topic"
title: "Obsidian Web MCP Unauthenticated Vault Tokens"
description: "Security analysis for CVE-2026-54618 unauthenticated OAuth codes and vault access in Obsidian Web MCP."
tags: ["identity-and-access", "data-and-privacy"]
---

# Obsidian Web MCP Unauthenticated Vault Tokens

## Current Understanding

The [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json) records [CVE-2026-54618](https://nvd.nist.gov/vuln/detail/CVE-2026-54618) for Obsidian Web MCP before 0.2.0. Broad Obsidian and vault-backed workflow context belongs upstream; this page owns the local OAuth, consent, and vault mutation boundary.

The source says Obsidian Web MCP issues OAuth authorization codes and tokens without login, consent, or client authentication. A remote caller can obtain vault authority and read, write, search, list, move, or delete vault content.

## Security Impact

- Threat: unauthenticated remote callers can obtain vault-scoped tokens and act as the vault owner.
- Affected boundary: Obsidian Web MCP before 0.2.0, OAuth authorization codes, tokens, login, consent, client authentication, and vault read/write/search/list/move/delete operations.
- Exploit or incident status: public NVD record; no local exploitation incident is recorded.
- Mitigation state: upgrade to 0.2.0 or later, rotate static vault tokens after exposure, and require login, consent, and client authentication before token issuance.
- Confidence: high for authentication failure and fixed version from NVD; medium for exact implementation details until primary advisory evidence is reconciled.
- Residual risk: vault-backed MCP tools need explicit user consent and token binding because vault contents often include prompts, credentials, operational notes, and private project context.

## Authoritative Sources

- [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json)
- [NVD CVE-2026-54618](https://nvd.nist.gov/vuln/detail/CVE-2026-54618)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [data and privacy](../data-and-privacy/index.md)
- [MCPVault recursive metadata path filtering](../agent-and-tool-security/mcpvault-recursive-metadata-path-filtering.md)
- [MCPVault case canonical path filtering](../agent-and-tool-security/mcpvault-case-canonical-path-filtering.md)
- Upstream AI development wiki owns general vault-backed agent workflow context.

## Open Questions

- Which primary Obsidian Web MCP advisory or release note documents the 0.2.0 token issuance fix?

## Maintenance Notes

- Created on 2026-10-01 from the [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json).
