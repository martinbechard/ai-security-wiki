---
type: "Topic"
title: "MCP Server For WordPress REST Nonce Bypass"
description: "Security analysis for CVE-2026-96524, where MCP Server for WordPress REST nonce verification could be bypassed."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# MCP Server For WordPress REST Nonce Bypass

## Current Understanding

The [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) records CVE-2026-96524 for MCP Server for WordPress before 1.8.2. Broad WordPress plugin context belongs upstream; this page owns the local REST nonce and cookie-authenticated administrator-action boundary.

## Security Impact

- Threat: attacker-induced cookie-authenticated REST requests can bypass nonce verification and trigger administrator actions, including administrator account creation.
- Affected boundary: MCP Server for WordPress before 1.8.2, REST nonce verification, cookie-authenticated requests, and administrator actions.
- Exploit or incident status: disclosed CVE; no confirmed exploitation is recorded in the collector.
- Mitigation state: upgrade to 1.8.2 or later and verify nonce checks on every state-changing REST route.
- Confidence: medium from NVD-backed collector evidence; maintainer or WordPress security-advisory detail should be reconciled.
- Residual risk: MCP plugin routes inherit browser and CMS CSRF risk when nonce enforcement is inconsistent.

## Authoritative Sources

- [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json)
- [NVD CVE-2026-96524](https://nvd.nist.gov/vuln/detail/CVE-2026-96524)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [WordPress AI Engine unauthenticated IDOR](wordpress-ai-engine-unauthenticated-idor.md)

## Open Questions

- Which MCP Server for WordPress REST routes were missing nonce verification before 1.8.2?

## Maintenance Notes

- Created on 2026-09-27 from the [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) after verifier correction split the WordPress MCP advisory family.
