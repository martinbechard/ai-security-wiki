---
type: "Topic"
title: "mcp-gitlab Dynamic API URL PAT Exfiltration"
description: "Security analysis for CVE-2026-61559 mcp-gitlab dynamic API URL host control leaking GitLab Private-Token."
tags: ["agent-and-tool-security", "identity-and-access", "data-and-privacy"]
---

# mcp-gitlab Dynamic API URL PAT Exfiltration

## Current Understanding

The [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) records [CVE-2026-61559](https://cveawg.mitre.org/api/cve/CVE-2026-61559) for `@zereight/mcp-gitlab` before 2.1.27 when `ENABLE_DYNAMIC_API_URL=true`. This page owns the local dynamic endpoint and credential-forwarding boundary.

The CVE says `@zereight/mcp-gitlab` reads caller-supplied `X-GitLab-API-URL` without a host allowlist. A caller who reaches the HTTP transport can redirect credentialed GitLab API calls to an attacker-controlled host and receive the victim's `Private-Token`.

## Security Impact

- Threat: a tool caller can redirect credentialed GitLab API traffic and exfiltrate a GitLab personal access token.
- Affected boundary: `@zereight/mcp-gitlab` before 2.1.27, `ENABLE_DYNAMIC_API_URL=true`, `X-GitLab-API-URL`, HTTP transport reachability, and GitLab `Private-Token` forwarding.
- Exploit or incident status: public CVE and upstream patch references; no local exploitation incident is recorded.
- Mitigation state: upgrade to 2.1.27 or later, disable untrusted dynamic API URL selection, allowlist GitLab API hosts, and rotate exposed PATs.
- Confidence: high for CVE publication after direct CVE Services re-fetch; medium for deployment prevalence because dynamic API URL support is configuration-dependent.
- Residual risk: MCP server dynamic endpoint features must not let tool callers redirect credentialed API traffic.

## Authoritative Sources

- [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json)
- [CVE-2026-61559 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-61559)
- [mcp-gitlab patch commit](https://github.com/zereight/gitlab-mcp/commit/6ffb4cc70706fd05b1ab80901676bc2998b6db6d)
- [mcp-gitlab pull request 625](https://github.com/zereight/gitlab-mcp/pull/625)
- [mcp-gitlab 2.1.27 release](https://github.com/zereight/gitlab-mcp/releases/tag/v2.1.27)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [mcp-gitlab transport exposure and PAT theft](mcp-gitlab-transport-exposure-and-pat-theft.md)
- [development agent credential isolation](../identity-and-access/development-agent-credential-isolation.md)

## Open Questions

- Which deployments enable `ENABLE_DYNAMIC_API_URL=true`, and do they restrict GitLab API hosts to an approved allowlist?

## Maintenance Notes

- Created on 2026-09-19 from the [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) after verifier correction split the mcp-gitlab transport-hardening router.
