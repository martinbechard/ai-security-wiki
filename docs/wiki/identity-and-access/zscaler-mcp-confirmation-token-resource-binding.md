---
type: "Topic"
title: "Zscaler MCP Confirmation Token Resource Binding"
description: "Security analysis for CVE-2026-59563 confirmation-token replay across Zscaler MCP Server resources."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# Zscaler MCP Confirmation Token Resource Binding

## Current Understanding

The [September 28 topic collector source](../../../raw/processed/2026-09-28/ai-security-wiki-topic-news-collector-2026-09-28T233057Z.json) records [CVE-2026-59563](https://cveawg.mitre.org/api/cve/CVE-2026-59563) for zscaler-mcp-server 0.7.0 and 0.7.1. Broad Zscaler and MCP server catalog background belongs upstream; this page owns the local delegated-action confirmation-token boundary.

The source says Zscaler MCP Server confirmation tokens were HMAC protected but not bound to the target resource identifier. An MCP client or agent could replay a token generated for one resource against another resource of the same type, converting approval for one target into authority over a different target.

## Security Impact

- Threat: delegated-action confirmation can be replayed across resources when the signed token omits the resource identity.
- Affected boundary: zscaler-mcp-server 0.7.0 and 0.7.1; MCP resource confirmation tokens.
- Exploit or incident status: public CVE and NVD records; no confirmed active exploitation is recorded in the source.
- Mitigation state: update to 0.7.2 or later and bind confirmation tokens to the specific resource or action target.
- Confidence: high from CVE Program and NVD timestamps; medium on patch mechanics until the referenced pull request is reviewed in detail.
- Residual risk: any MCP action confirmation scheme remains sensitive when the token signs only user, action type, or time but not the concrete resource and server boundary.

## Authoritative Sources

- [September 28 topic collector source](../../../raw/processed/2026-09-28/ai-security-wiki-topic-news-collector-2026-09-28T233057Z.json)
- [CVE-2026-59563 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-59563)
- [NVD CVE-2026-59563 query evidence](https://services.nvd.nist.gov/rest/json/cves/2.0?pubStartDate=2026-09-27T23:30:16.000Z&pubEndDate=2026-09-28T23:30:57.000Z&keywordSearch=MCP)
- [zscaler-mcp-server pull request 41](https://github.com/zscaler/zscaler-mcp-server/pull/41)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [MCP client OAuth redirect URI handling](mcp-client-oauth-redirect-uri-handling.md)
- Upstream AI wiki owns broad Zscaler and MCP server entity coverage if needed.

## Open Questions

- Which exact token fields changed in zscaler-mcp-server 0.7.2 to bind confirmation to the resource target?

## Maintenance Notes

- Created on 2026-09-29 from the [September 28 topic collector source](../../../raw/processed/2026-09-28/ai-security-wiki-topic-news-collector-2026-09-28T233057Z.json) after routing broad product context upstream.
