---
type: "Topic"
title: "GitLab MCP Scoped Token Authorization Bypass"
description: "Security analysis for CVE-2026-92874, where GitLab MCP-scoped tokens could perform actions beyond intended scope."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# GitLab MCP Scoped Token Authorization Bypass

## Current Understanding

The [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) records [CVE-2026-92874](https://cveawg.mitre.org/api/cve/CVE-2026-92874) for GitLab CE/EE MCP-scoped tokens. Broad GitLab product and repository-workflow context belongs upstream; this page owns the local MCP token action-authorization boundary.

The CVE source says an authenticated user with an MCP-scoped token could perform actions beyond the intended scope of that token because of improper authorization checks. This is distinct from [GitLab MCP search state user context race](gitlab-mcp-search-state-user-context-race.md), which concerns search-result context leakage.

## Security Impact

- Threat: an authenticated MCP-scoped token can perform actions beyond its delegated least-privilege scope.
- Affected boundary: GitLab CE/EE 18.3 before 19.2.7, 19.3 before 19.3.3, and 19.4 before 19.4.1; MCP-scoped token authorization checks.
- Exploit or incident status: public CVE, NVD, and GitLab patch-release evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: upgrade to 19.2.7, 19.3.3, 19.4.1, or later on the maintained branch.
- Confidence: high for affected ranges and improper-authorization class; medium for exact action list until GitLab issue detail is visible.
- Residual risk: MCP tokens need final action authorization at execution time, not only during token issuance.

## Authoritative Sources

- [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json)
- [CVE-2026-92874 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-92874)
- [NVD CVE-2026-92874](https://nvd.nist.gov/vuln/detail/CVE-2026-92874)
- [GitLab 19.4.1 patch release](https://docs.gitlab.com/releases/patches/patch-release-gitlab-19-4-1-released/)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [GitLab MCP search state user context race](gitlab-mcp-search-state-user-context-race.md)
- [MCP tool-level IAM authorization](mcp-tool-level-iam-authorization.md)

## Open Questions

- Which MCP actions could CVE-2026-92874 perform outside the token's intended scope?

## Maintenance Notes

- Created on 2026-09-25 from the [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) after splitting token-scope authorization from search-state isolation.
