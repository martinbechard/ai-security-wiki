---
type: "Topic"
title: "fast-mcp-telegram File URL SSRF"
description: "Security analysis for CVE-2026-55096 exfiltrating SSRF in fast-mcp-telegram file URL downloads."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# fast-mcp-telegram File URL SSRF

## Current Understanding

The [September 28 topic collector source](../../../raw/processed/2026-09-28/ai-security-wiki-topic-news-collector-2026-09-28T233057Z.json) records [CVE-2026-55096](https://cveawg.mitre.org/api/cve/CVE-2026-55096) for fast-mcp-telegram versions before 30.1, with the GitHub release reference using tag 0.30.1. Broad Telegram integration and MCP server catalog background belongs upstream; this page owns the local server-side fetch and exfiltration boundary.

The source says the server accepted HTTP(S) file URLs for `send_message` and `send_message_to_phone`. Its URL-security check denied literal hostnames but did not resolve DNS before `httpx` fetched the target, so a hostname resolving to loopback, private, link-local, or metadata IP space could pass validation. Because the fetched body was returned as a Telegram attachment, the SSRF was exfiltrating rather than blind.

## Security Impact

- Threat: MCP messaging tools can become network egress and data-exfiltration bridges when file inputs trigger server-side fetches.
- Affected boundary: fast-mcp-telegram before 30.1 / release tag 0.30.1; HTTP(S) file URL downloads in Telegram send tools.
- Exploit or incident status: public CVE, NVD, GitHub advisory, patch, and release references; no confirmed active exploitation is recorded in the source.
- Mitigation state: update to the fixed release and validate final DNS resolution, redirects, private ranges, and dial-time destinations for every fetched file URL.
- Confidence: high on advisory identity and affected behavior; medium on version spelling until package and release numbering are reconciled.
- Residual risk: DNS validation that is separate from the actual outbound connection can still fail under rebinding, redirects, proxies, or IPv6 transition forms.

## Authoritative Sources

- [September 28 topic collector source](../../../raw/processed/2026-09-28/ai-security-wiki-topic-news-collector-2026-09-28T233057Z.json)
- [CVE-2026-55096 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-55096)
- [GitHub advisory GHSA-xr72-j7vj-vp7g](https://github.com/leshchenko1979/fast-mcp-telegram/security/advisories/GHSA-xr72-j7vj-vp7g)
- [Patch commit e6b3032](https://github.com/leshchenko1979/fast-mcp-telegram/commit/e6b3032cfc906e14f5b84f2c2b8ec378eb457e57)
- [Release 0.30.1](https://github.com/leshchenko1979/fast-mcp-telegram/releases/tag/0.30.1)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent network egress controls](agent-network-egress-controls.md)
- [mcp-fetch IPv6 SSRF](mcp-fetch-ipv6-ssrf.md)
- Upstream AI wiki owns broad MCP server and Telegram integration coverage if needed.

## Open Questions

- Does the fixed package publish as 30.1, 0.30.1, or both across package and repository release metadata?

## Maintenance Notes

- Created on 2026-09-29 from the [September 28 topic collector source](../../../raw/processed/2026-09-28/ai-security-wiki-topic-news-collector-2026-09-28T233057Z.json) after routing broad MCP server catalog context upstream.
