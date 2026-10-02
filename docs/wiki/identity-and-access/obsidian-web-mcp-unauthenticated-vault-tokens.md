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

The [October 1 leaf update watch source](../../../raw/processed/2026-10-01/ai-security-wiki-leaf-update-watch-20261002T000344Z.json) adds CVE Services metadata with a visible 2026-09-24 update and GHSA-hwhg-mrjc-8g43 alias context. That watcher evidence corroborates the existing September 30 leaf instead of creating a duplicate digest item.

## Security Impact

- Threat: unauthenticated remote callers can obtain vault-scoped tokens and act as the vault owner.
- Affected boundary: Obsidian Web MCP before 0.2.0, OAuth authorization codes, tokens, login, consent, client authentication, and vault read/write/search/list/move/delete operations.
- Exploit or incident status: public NVD record; no local exploitation incident is recorded.
- Mitigation state: upgrade to 0.2.0 or later, rotate static vault tokens after exposure, and require login, consent, and client authentication before token issuance.
- Confidence: high for authentication failure and fixed version from NVD; medium for exact implementation details until primary advisory evidence is reconciled.
- Residual risk: vault-backed MCP tools need explicit user consent and token binding because vault contents often include prompts, credentials, operational notes, and private project context.

## Authoritative Sources

- [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json)
- [October 1 leaf update watch source](../../../raw/processed/2026-10-01/ai-security-wiki-leaf-update-watch-20261002T000344Z.json)
- [NVD CVE-2026-54618](https://nvd.nist.gov/vuln/detail/CVE-2026-54618)
- [CVE-2026-54618 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-54618)

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

- Updated on 2026-10-02 with October 1 watcher metadata for the CVE Services update timestamp, GHSA alias, and reachable-tunnel vault tool boundary; no duplicate digest item was added.
- Created on 2026-10-01 from the [September 30 topic collector source](../../../raw/processed/2026-09-30/ai-security-wiki-topic-news-collector-2026-09-30T233235Z.json).
