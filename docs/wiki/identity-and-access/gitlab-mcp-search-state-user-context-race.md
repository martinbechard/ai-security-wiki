---
type: "Topic"
title: "GitLab MCP Search State User Context Race"
description: "Security analysis for CVE-2026-92628, where GitLab MCP search shared state could return results under the wrong user context."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# GitLab MCP Search State User Context Race

## Current Understanding

The [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) records [CVE-2026-92628](https://cveawg.mitre.org/api/cve/CVE-2026-92628) for GitLab CE/EE MCP search. Broad GitLab product and repository-workflow context belongs upstream; this page owns the local per-user MCP search-state isolation boundary.

The CVE source says a race condition in MCP search shared-state handling could return search results under an incorrect user context. This is distinct from [GitLab MCP scoped token authorization bypass](gitlab-mcp-scoped-token-authorization-bypass.md), which concerns token action scope rather than search-result context isolation.

## Security Impact

- Threat: repository search results can be disclosed to the wrong MCP user context.
- Affected boundary: GitLab CE/EE 18.6 before 19.2.7, 19.3 before 19.3.3, and 19.4 before 19.4.1; MCP search shared state.
- Exploit or incident status: public CVE, NVD, and GitLab patch-release evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: upgrade to 19.2.7, 19.3.3, 19.4.1, or later on the maintained branch.
- Confidence: high for affected ranges and race-condition class; medium for exact trigger conditions until GitLab issue detail is visible.
- Residual risk: MCP tools need per-request user-context isolation for cached or shared search state.

## Authoritative Sources

- [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json)
- [CVE-2026-92628 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-92628)
- [NVD CVE-2026-92628](https://nvd.nist.gov/vuln/detail/CVE-2026-92628)
- [GitLab 19.4.1 patch release](https://docs.gitlab.com/releases/patches/patch-release-gitlab-19-4-1-released/)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [GitLab MCP scoped token authorization bypass](gitlab-mcp-scoped-token-authorization-bypass.md)
- [agent and tool security](../agent-and-tool-security/index.md)

## Open Questions

- Which GitLab MCP search component held shared state across user contexts?

## Maintenance Notes

- Created on 2026-09-25 from the [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) after splitting GitLab MCP search isolation from token-scope authorization.
