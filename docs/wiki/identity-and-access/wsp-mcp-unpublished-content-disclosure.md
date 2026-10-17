---
type: "Topic"
title: "WSP MCP Unpublished Content Disclosure"
description: "Security analysis for CVE-2026-109382 missing WSP MCP post-query authorization exposing unpublished WordPress excerpts."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# WSP MCP Unpublished Content Disclosure

## Current Understanding

The [October 16 topic collector source](../../../raw/processed/2026-10-16/ai-security-wiki-topic-news-collector-2026-10-16T232823Z.json) records [CVE-2026-109382](https://cveawg.mitre.org/api/cve/CVE-2026-109382): WSP MCP AI Agents Connector for WordPress through 2.9.5 registers `wsp_get_posts` without a capability requirement. A Subscriber-or-higher caller can request `status=all` and obtain metadata and 40-word excerpts for draft, pending, and scheduled posts. Broad WordPress and WSP product context belongs upstream; this page owns the MCP query-authorization and confidential-content boundary.

## Security Impact

- Threat: a low-privilege authenticated caller retrieves confidential unpublished-content metadata and excerpts through an MCP tool.
- Affected boundary: WSP MCP AI Agents Connector through 2.9.5; `wsp_get_posts` capability, endpoint authentication, and post-status/ownership enforcement.
- Exploit or incident status: public CVE; no local exploitation incident is recorded.
- Mitigation state: require a capability at the tool boundary, enforce post visibility and ownership in the query, minimize returned fields, and upgrade when a vendor-fixed version is confirmed.
- Confidence: high for the route, role, version ceiling, and disclosed fields in the primary record; a fixed version is not established.
- Residual risk: authenticated MCP sessions can disclose data broadly when caller-controlled query scopes bypass per-record authorization.

## Control Implications

- Authorize every MCP tool independently of session creation.
- Bind status and ownership filters server-side rather than accepting unrestricted caller query scopes.
- Return only fields justified by the granted capability.

## Authoritative Sources

- [October 16 topic collector source](../../../raw/processed/2026-10-16/ai-security-wiki-topic-news-collector-2026-10-16T232823Z.json)
- [CVE-2026-109382 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-109382)
- [Wordfence advisory](https://www.wordfence.com/threat-intel/vulnerabilities/id/809eb78f-fd8e-4434-a36b-bb8e313cf264?source=cve)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [WSP MCP AI Agents Connector broken access control](wsp-mcp-ai-agents-connector-broken-access-control.md)
- [MCP tool-level IAM authorization](mcp-tool-level-iam-authorization.md)

## Open Questions

- Which release fixes CVE-2026-109382, and does it enforce post ownership as well as status filtering?

## Maintenance Notes

- Created on 2026-10-16 from CVE-2026-109382; keep it separate from CVE-2026-93529 because the affected route and disclosure scope differ.
