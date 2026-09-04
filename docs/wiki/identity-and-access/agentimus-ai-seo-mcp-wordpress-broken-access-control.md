---
type: "Topic"
title: "Agentimus AI SEO MCP WordPress Broken Access Control"
description: "Security analysis for CVE-2026-84779 broken access control in the Agentimus AI SEO, llms.txt, and MCP for AI Agents WordPress plugin."
tags: ["identity-and-access", "agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Agentimus AI SEO MCP WordPress Broken Access Control

## Current Understanding

The [September 3 topic collector source](../../../raw/processed/2026-09-03/ai-security-wiki-topic-news-collector-2026-09-03T233104Z.json) records [CVE-2026-84779](https://nvd.nist.gov/vuln/detail/CVE-2026-84779) for Agentimus - AI SEO, llms.txt & MCP for AI Agents WordPress plugin versions through 1.51.0. Broad WordPress plugin catalog context belongs upstream; this page owns the local security boundary where subscriber-level or otherwise low-privilege CMS roles can cross AI/MCP plugin authorization controls.

[NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-84779), the [direct CVE record](https://cveawg.mitre.org/api/cve/CVE-2026-84779), and the [Patchstack advisory](https://patchstack.com/database/wordpress/plugin/agentimus/vulnerability/wordpress-agentimus-ai-seo-llms-txt-mcp-for-ai-agents-plugin-1-51-0-broken-access-control-vulnerability?_s_id=cve) classify the issue as missing authorization or broken access control. The CVE record marks version 1.51.1 as unaffected.

## Security Impact

- Threat: low-privilege WordPress users can reach AI/MCP plugin functionality beyond their intended role.
- Affected boundary: Agentimus WordPress plugin through 1.51.0, WordPress subscriber or low-privilege roles, AI SEO and MCP functionality, and plugin authorization checks.
- Exploit or incident status: public NVD/CVE and Patchstack advisory records; no local exploitation evidence is recorded.
- Mitigation state: update to 1.51.1 or later and review which plugin endpoints are reachable by subscriber-level users.
- Confidence: high for CVE metadata and fixed version; medium for exact endpoint exposure until Patchstack technical details are reviewed.
- Residual risk: public CMS plugins that add MCP surfaces can turn ordinary content roles into delegated tool authority unless each endpoint enforces capability checks.

## Control Implications

- Require WordPress capability checks on every AI/MCP plugin endpoint, including AJAX and REST routes.
- Treat AI-agent and MCP plugin functions as privileged actions even when packaged as SEO or content tooling.
- Audit subscriber-accessible plugin routes after enabling AI automation plugins.

## Authoritative Sources

- [September 3 topic collector source](../../../raw/processed/2026-09-03/ai-security-wiki-topic-news-collector-2026-09-03T233104Z.json)
- [NVD CVE-2026-84779](https://nvd.nist.gov/vuln/detail/CVE-2026-84779)
- [CVE-2026-84779 direct CVE record](https://cveawg.mitre.org/api/cve/CVE-2026-84779)
- [Patchstack Agentimus advisory](https://patchstack.com/database/wordpress/plugin/agentimus/vulnerability/wordpress-agentimus-ai-seo-llms-txt-mcp-for-ai-agents-plugin-1-51-0-broken-access-control-vulnerability?_s_id=cve)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MCP tool-level IAM authorization](mcp-tool-level-iam-authorization.md)
- [WordPress AI plugin advisory deferrals](../infrastructure-and-supply-chain/wordpress-ai-plugin-advisory-deferrals.md)

## Open Questions

- Which Agentimus endpoints or capabilities are exposed to subscriber-level users in affected deployments?

## Maintenance Notes

- Created on 2026-09-03 from the [September 3 topic collector](../../../raw/processed/2026-09-03/ai-security-wiki-topic-news-collector-2026-09-03T233104Z.json) as a WordPress AI/MCP authorization leaf.
