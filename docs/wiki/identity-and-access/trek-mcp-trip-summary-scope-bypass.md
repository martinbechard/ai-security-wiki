---
type: "Topic"
title: "TREK MCP Trip Summary Scope Bypass"
description: "Security analysis for CVE-2026-77321, where TREK get_trip_summary did not require trips:read for scoped OAuth MCP tokens."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# TREK MCP Trip Summary Scope Bypass

## Current Understanding

The [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) records [CVE-2026-77321](https://cveawg.mitre.org/api/cve/CVE-2026-77321) for TREK before 3.3.0. Broad TREK product context belongs upstream if needed; this page owns the local delegated MCP OAuth scope boundary.

The `get_trip_summary` tool was registered for scoped OAuth MCP tokens without requiring `trips:read`. A token granted an unrelated capability could receive trip metadata, member email addresses, itinerary days, and accommodations for trips accessible to the token's user. Cross-user trip authorization remained enforced, but consented least privilege was bypassed.

## Security Impact

- Threat: an MCP client with unrelated delegated scope can read trip summaries and member contact data.
- Affected boundary: TREK before 3.3.0, `get_trip_summary`, `trips:read`, MCP OAuth scoped tokens, trip metadata, member emails, itinerary days, and accommodations.
- Exploit or incident status: public CVE, NVD, GitHub Security Advisory, and fixed release evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: upgrade to TREK 3.3.0 or later and enforce MCP tool scopes at execution time.
- Confidence: high for affected version and missing scope check; medium for which deployments expose scoped MCP clients.
- Residual risk: MCP tools need per-tool delegated scope checks even when object ownership checks remain intact.

## Authoritative Sources

- [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json)
- [CVE-2026-77321 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-77321)
- [NVD CVE-2026-77321](https://nvd.nist.gov/vuln/detail/CVE-2026-77321)
- [GHSA-qvw8-w937-vcmq](https://github.com/liketrek/TREK/security/advisories/GHSA-qvw8-w937-vcmq)
- [TREK v3.3.0 release](https://github.com/liketrek/TREK/releases/tag/v3.3.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [TREK LLM base URL SSRF](../agent-and-tool-security/trek-llm-base-url-ssrf.md)
- [MCP tool-level IAM authorization](mcp-tool-level-iam-authorization.md)

## Open Questions

- Which TREK OAuth scopes besides `trips:read` could call `get_trip_summary` before 3.3.0?

## Maintenance Notes

- Created on 2026-09-25 from the [September 24 topic collector source](../../../raw/processed/2026-09-24/ai-security-wiki-topic-news-collector-2026-09-24T233211Z.json) after splitting TREK MCP scope enforcement from LLM endpoint SSRF.
