---
type: "Topic"
title: "Mem0 Session-Scope Cross-Tenant Disclosure"
description: "Security analysis for CVE-2026-116575 delimiter collisions in Mem0 agent-memory session scopes."
tags: ["data-and-privacy", "identity-and-access"]
---

# Mem0 Session-Scope Cross-Tenant Disclosure

## Current Understanding

The October 26 collector and [CVE-2026-116575](https://www.cve.org/CVERecord?id=CVE-2026-116575) record unescaped `&` and `=` delimiters in Mem0 Python and TypeScript session-scope construction. Broad Mem0 context belongs upstream; this page owns the agent-memory tenancy and privacy boundary.

## Security Impact

- Threat: controlled `user_id`, `agent_id`, or `run_id` values can collide across tenant tuples, disclosing, evicting, or interleaving recent memory messages.
- Affected boundary: Mem0 Python SDK before 2.0.18 and TypeScript SDK before 3.1.6; memory writes and REST `POST /memories`.
- Exploit or incident status: public advisory; no local incident evidence is recorded.
- Mitigation state: upgrade to [Python 2.0.18](https://github.com/mem0ai/mem0/releases/tag/v2.0.18) and [TypeScript 3.1.6](https://github.com/mem0ai/mem0/releases/tag/ts-v3.1.6); encode identifiers and treat scope serialization as an authorization control.
- Confidence: high after maintainer advisory and releases were reconciled.
- Residual risk: other scope keys can collide if tenant identifiers are concatenated rather than encoded as structured fields.

## Authoritative Sources

- [October 26 collector source](../../../raw/processed/2026-10-26/ai-security-wiki-topic-news-collector-2026-10-26T233009Z.json)
- [CVE-2026-116575 record](https://www.cve.org/CVERecord?id=CVE-2026-116575)
- [Mem0 advisory](https://github.com/mem0ai/mem0/security/advisories/GHSA-5324-3w58-qpp2)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [identity and access](../identity-and-access/index.md)

## Open Questions

- Do hosted Mem0 deployments share the affected SDK session-scope construction path?

## Maintenance Notes

- Created on 2026-10-26 after reconciling the NVD-first collection record with the maintainer advisory and releases.
