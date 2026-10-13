---
type: "Topic"
title: "VideoWhisper Site Manager Authorization Bypass"
description: "Security analysis for CVE-2026-107430, missing authorization in the WordPress VideoWhisper Site Manager for ChatGPT, Claude, Codex plugin."
tags: ["identity-and-access"]
---

# VideoWhisper Site Manager Authorization Bypass

## Current Understanding

The [October 12 topic collector source](../../../raw/processed/2026-10-12/ai-security-wiki-topic-news-collector-2026-10-12T233447Z.json) records [CVE-2026-107430](https://nvd.nist.gov/vuln/detail/CVE-2026-107430) for the WordPress VideoWhisper Site Manager for ChatGPT, Claude, Codex plugin through 1.2.10. Broad WordPress plugin and assistant-integration catalog context belongs upstream; this page owns the local authorization boundary.

The NVD-backed source maps the package as `videowhisper-site-manager` and records 1.2.11 as unaffected. The security issue is missing authorization on AI site-management capability, with exact role and action scope still sparse in local evidence.

## Security Impact

- Threat: a lower-privileged WordPress user may reach AI-site management actions beyond their role.
- Affected boundary: VideoWhisper Site Manager for ChatGPT, Claude, Codex through 1.2.10; WordPress plugin authorization checks for site-management functions.
- Exploit or incident status: public CVE, Patchstack reference, and AI Sec Watch evidence; no exploitation incident is recorded locally.
- Mitigation state: update to 1.2.11 or later and enforce capability checks on every AI site-management action.
- Confidence: high for affected and fixed versions from NVD-backed source evidence; exact role/action exploitability remains lower confidence pending Patchstack detail.
- Residual risk: WordPress AI assistant plugins can expose administrative or provider-connected actions through ordinary plugin route drift.

## Control Implications

- Check WordPress capabilities at the server-side route or action handler, not only in admin UI visibility.
- Treat AI assistant management plugins as privileged integration surfaces because they can couple content, credentials, and automation.
- Record low-privilege role requirements when primary advisory detail is available.

## Authoritative Sources

- [October 12 topic collector source](../../../raw/processed/2026-10-12/ai-security-wiki-topic-news-collector-2026-10-12T233447Z.json)
- [NVD CVE-2026-107430](https://nvd.nist.gov/vuln/detail/CVE-2026-107430)
- [Patchstack VideoWhisper advisory](https://patchstack.com/database/wordpress/plugin/videowhisper-site-manager/vulnerability/wordpress-videowhisper-site-manager-for-chatgpt-claude-codex-plugin-1-2-10-broken-access-control-vulnerability?_s_id=cve)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MCP Server for WordPress workflow configuration authorization](mcp-server-for-wordpress-workflow-configuration-authorization.md)
- [WordPress AI Engine unauthenticated IDOR](wordpress-ai-engine-unauthenticated-idor.md)

## Open Questions

- Which WordPress role and site-management actions are sufficient to exploit CVE-2026-107430 before VideoWhisper Site Manager 1.2.11?

## Maintenance Notes

- Created on 2026-10-13 from the October 12 topic collector as a WordPress AI assistant plugin authorization leaf.
