---
type: "Topic"
title: "MountDev AI MCP Connector WordPress Authorization Bypass"
description: "Security analysis for CVE-2026-85306 missing authorization in MountDev AI MCP Connector for WordPress."
tags: ["identity-and-access", "agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# MountDev AI MCP Connector WordPress Authorization Bypass

## Current Understanding

The [September 3 topic collector source](../../../raw/processed/2026-09-03/ai-security-wiki-topic-news-collector-2026-09-03T233104Z.json) records [CVE-2026-85306](https://nvd.nist.gov/vuln/detail/CVE-2026-85306) for MountDev AI MCP Connector for WordPress versions through 1.6.5. Broad WordPress and plugin ecosystem coverage belongs upstream; this page owns the local security boundary where an MCP connector can expose delegated WordPress or content authority without sufficient authorization.

[NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-85306), the [direct CVE record](https://cveawg.mitre.org/api/cve/CVE-2026-85306), and the [Patchstack advisory](https://patchstack.com/database/wordpress/plugin/mountdev-ai-mcp-connector/vulnerability/wordpress-mountdev-ai-mcp-connector-for-wordpress-plugin-1-6-5-broken-access-control-vulnerability?_s_id=cve) classify the issue as missing authorization. The CVE record marks version 1.6.6 as unaffected.

## Security Impact

- Threat: unauthorized WordPress users can invoke MCP connector functionality beyond their role.
- Affected boundary: MountDev AI MCP Connector for WordPress through 1.6.5, WordPress role/capability enforcement, and MCP-exposed site actions.
- Exploit or incident status: public NVD/CVE and Patchstack advisory records; no local exploitation evidence is recorded.
- Mitigation state: update to 1.6.6 or later and audit all connector routes for explicit capability checks.
- Confidence: high for CVE metadata and fixed version; medium for exact action exposure until endpoint detail is confirmed.
- Residual risk: MCP connectors make CMS permissions part of an agent tool boundary, so missing authorization can expose both content operations and downstream tools.

## Control Implications

- Require per-tool and per-route WordPress capability checks before exposing MCP actions.
- Keep MCP connector tokens and route registration tied to the least-privileged site role that needs the action.
- Test unauthenticated, subscriber, contributor, and editor roles against each exposed connector route.

## Authoritative Sources

- [September 3 topic collector source](../../../raw/processed/2026-09-03/ai-security-wiki-topic-news-collector-2026-09-03T233104Z.json)
- [NVD CVE-2026-85306](https://nvd.nist.gov/vuln/detail/CVE-2026-85306)
- [CVE-2026-85306 direct CVE record](https://cveawg.mitre.org/api/cve/CVE-2026-85306)
- [Patchstack MountDev AI MCP Connector advisory](https://patchstack.com/database/wordpress/plugin/mountdev-ai-mcp-connector/vulnerability/wordpress-mountdev-ai-mcp-connector-for-wordpress-plugin-1-6-5-broken-access-control-vulnerability?_s_id=cve)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MCP tool-level IAM authorization](mcp-tool-level-iam-authorization.md)
- [Agentimus AI SEO MCP WordPress broken access control](agentimus-ai-seo-mcp-wordpress-broken-access-control.md)
- [WordPress AI plugin advisory deferrals](../infrastructure-and-supply-chain/wordpress-ai-plugin-advisory-deferrals.md)

## Open Questions

- Which MountDev connector routes or MCP actions are reachable without the intended WordPress capability in affected versions?

## Maintenance Notes

- Created on 2026-09-03 from the [September 3 topic collector](../../../raw/processed/2026-09-03/ai-security-wiki-topic-news-collector-2026-09-03T233104Z.json) as a WordPress MCP connector authorization leaf.
