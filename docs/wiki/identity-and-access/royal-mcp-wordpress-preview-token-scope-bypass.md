---
type: "Topic"
title: "Royal MCP WordPress Preview-Token Scope Bypass"
description: "Security analysis for CVE-2026-111958 preview-link token reuse across Royal MCP WordPress REST API resources."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# Royal MCP WordPress Preview-Token Scope Bypass

## Current Understanding

The [October 22 topic collector source](../../../raw/processed/2026-10-22/ai-security-wiki-topic-news-collector-2026-10-22T232635Z.json) records [CVE-2026-111958](https://cveawg.mitre.org/api/cve/CVE-2026-111958) for Royal MCP before 1.5.7. Broad Royal MCP and WordPress context belongs upstream; this leaf owns the preview-token resource-binding failure at the REST-API authorization boundary.

## Security Impact

- Threat: possession of one valid preview-link token can authenticate a caller as its owner across REST API resources and, in the default configuration, enable administrator-level takeover.
- Affected boundary: Royal MCP WordPress plugin before 1.5.7; preview-link bearer-like token to exact preview, resource, and action authorization.
- Exploit or incident status: public CVE disclosure; no exploitation incident is recorded locally.
- Mitigation state: upgrade to 1.5.7 or later and invalidate or rotate exposed preview tokens; bind every token to its intended preview and authorization scope.
- Confidence: high for publication timing, affected version, and stated authorization impact; the collected record does not name a primary maintainer advisory.
- Residual risk: a token with ambiguous resource scope remains an administrative capability even when its original link was intended for preview only.

## Authoritative Sources

- [October 22 topic collector source](../../../raw/processed/2026-10-22/ai-security-wiki-topic-news-collector-2026-10-22T232635Z.json)
- [CVE-2026-111958](https://cveawg.mitre.org/api/cve/CVE-2026-111958)
- [WPScan vulnerability entry](https://wpscan.com/vulnerability/014f061c-54f3-491e-b4a0-85cfa6fb178b/)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MCP Server for WordPress REST nonce bypass](mcp-server-for-wordpress-rest-nonce-bypass.md)

## Open Questions

- Which exact Royal MCP configuration makes the token holder an administrator, and does 1.5.7 revoke existing tokens automatically?

## Maintenance Notes

- Created on 2026-10-22 from the October 22 topic collector; verify maintainer remediation behavior before narrowing the rotation guidance.
