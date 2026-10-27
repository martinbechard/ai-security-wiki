---
type: "Topic"
title: "Frappe Builder LLM Credit Authorization Bypass"
description: "Security analysis for CVE-2026-115718 unauthorized LLM invocation with a stored OpenRouter credential."
tags: ["identity-and-access"]
---

# Frappe Builder LLM Credit Authorization Bypass

## Current Understanding

The October 26 collector records [CVE-2026-115718](https://www.cve.org/CVERecord?id=CVE-2026-115718) in Frappe Builder 1.33.0 before 1.36.0. Broad Frappe and OpenRouter context belongs upstream; this page owns delegated LLM invocation authorization and provider-credit authority.

## Security Impact

- Threat: any authenticated non-Guest session can call `improve_prompt`, use the site owner's OpenRouter key through `resolve_api_key`, and consume paid LLM credits.
- Affected boundary: Frappe Builder 1.33.0 through before 1.36.0.
- Exploit or incident status: public advisory; no local incident evidence is recorded.
- Mitigation state: upgrade to [1.36.0](https://github.com/frappe/builder/releases/tag/v1.36.0) or later and enforce an explicit permission check before resolving provider credentials.
- Confidence: high after release and maintainer advisory reconciliation.
- Residual risk: a stored provider key can confer cost and model-access authority beyond the user permission model unless calls are bound to actor and budget.

## Authoritative Sources

- [October 26 collector source](../../../raw/processed/2026-10-26/ai-security-wiki-topic-news-collector-2026-10-26T233009Z.json)
- [CVE-2026-115718 record](https://www.cve.org/CVERecord?id=CVE-2026-115718)
- [Frappe Builder advisory](https://github.com/frappe/builder/security/advisories/GHSA-58mj-c563-p78w)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MCP tool-level IAM authorization](mcp-tool-level-iam-authorization.md)

## Open Questions

- Can the inherited provider key access sensitive model data or only incur credit charges?

## Maintenance Notes

- Created on 2026-10-26 after reconciling the NVD-first source with maintainer release evidence.
