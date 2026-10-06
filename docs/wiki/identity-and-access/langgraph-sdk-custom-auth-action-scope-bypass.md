---
type: "Topic"
title: "LangGraph SDK Custom Auth Action Scope Bypass"
description: "Security analysis for GHSA-fvww-7h3r-vfhp / CVE-2026-104873 action scoping bypasses in langgraph-sdk custom authorization decorators."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# LangGraph SDK Custom Auth Action Scope Bypass

## Current Understanding

The [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) records [GHSA-fvww-7h3r-vfhp](https://github.com/langchain-ai/langgraph/security/advisories/GHSA-fvww-7h3r-vfhp) / [CVE-2026-104873](https://nvd.nist.gov/vuln/detail/CVE-2026-104873) for `langgraph-sdk` 0.1.45 through 0.4.3. Broad LangGraph and LangChain ecosystem context belongs upstream; this page owns the deployed-agent resource authorization boundary.

The advisory says resource-scoped authorization decorators can ignore the `actions=` selector and register a handler for every action on resources such as threads, assistants, or crons. If the selected handler does not enforce action or ownership checks itself, fallback authorization may not run and an authenticated user can perform an action the application intended to deny.

## Security Impact

- Threat: application custom authorization can silently broaden from selected actions to all actions on agent resources.
- Affected boundary: Python `langgraph-sdk` 0.1.45 through 0.4.3; deployments using `actions=` on affected resource-scoped decorators.
- Exploit or incident status: reviewed GitHub advisory and NVD record; no local exploitation incident is recorded.
- Mitigation state: update to `langgraph-sdk` 0.4.4 or later and review custom auth handlers for explicit action and ownership checks.
- Confidence: high for package, affected range, and patched version from the GitHub advisory.
- Residual risk: deployed agent resources such as threads, assistants, and scheduled runs often carry user data and tool authority, so action-scoping bugs can become cross-user authorization failures.

## Authoritative Sources

- [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json)
- [LangGraph advisory GHSA-fvww-7h3r-vfhp](https://github.com/langchain-ai/langgraph/security/advisories/GHSA-fvww-7h3r-vfhp)
- [GitHub advisory GHSA-fvww-7h3r-vfhp](https://github.com/advisories/GHSA-fvww-7h3r-vfhp)
- [NVD CVE-2026-104873](https://nvd.nist.gov/vuln/detail/CVE-2026-104873)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- Upstream AI wiki owns broad [LangGraph](../../../upstream-ai-wiki/agentic-frameworks/langgraph.md) context.

## Open Questions

- Which local LangGraph deployments use resource-scoped custom authorization decorators with `actions=` and need handler review after upgrading?

## Maintenance Notes

- Created on 2026-10-06 from the [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) after routing general LangGraph implementation practice upstream.
