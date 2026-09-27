---
type: "Topic"
title: "GitLab Duo Workflow Token Governance Bypass"
description: "Security analysis for CVE-2026-92529, where GitLab Duo Workflow Service token governance could be bypassed."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# GitLab Duo Workflow Token Governance Bypass

## Current Understanding

The [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) records CVE-2026-92529 for GitLab CE/EE patch releases 19.4.1, 19.3.3, and 19.2.7. Broad GitLab and Duo Workflow product context belongs upstream; this page owns the local AI workflow token-governance boundary.

The collector records that Duo Workflow Service token governance could be bypassed by a developer-role user in namespaces they did not control. Locally this is an identity and access issue because AI workflow service tokens need namespace ownership checks in addition to ordinary developer permissions.

## Security Impact

- Threat: a developer-role user can bypass Duo Workflow Service token governance in namespaces they do not control.
- Affected boundary: GitLab CE/EE ranges before 19.2.7, 19.3.3, and 19.4.1, depending on the CVE record; Duo Workflow Service tokens and namespace governance.
- Exploit or incident status: vendor patch release corroborated by NVD; no confirmed exploitation is recorded in the collector.
- Mitigation state: upgrade to 19.2.7, 19.3.3, 19.4.1, or later and audit Duo Workflow service-token use across namespaces.
- Confidence: high from vendor patch-release and NVD-backed collector evidence.
- Residual risk: workflow service tokens can bridge user, namespace, and automation authority, so governance checks need to bind all three.

## Authoritative Sources

- [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json)
- [GitLab 19.4.1 patch release](https://docs.gitlab.com/releases/patches/patch-release-gitlab-19-4-1-released/)
- [NVD CVE-2026-92529](https://nvd.nist.gov/vuln/detail/CVE-2026-92529)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [GitLab MCP scoped token authorization bypass](gitlab-mcp-scoped-token-authorization-bypass.md)

## Open Questions

- Which Duo Workflow token governance checks were missing for developer-role users before the patched releases?

## Maintenance Notes

- Created on 2026-09-27 from the [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) after verifier correction identified CVE-2026-92529 as a missing local durable leaf.
