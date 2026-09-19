---
type: "Topic"
title: "CordysCRM MCP Form Config Metadata Exposure"
description: "Security analysis for CVE-2026-63646 unauthenticated CordysCRM MCP form configuration exposure."
tags: ["identity-and-access", "data-and-privacy", "agent-and-tool-security"]
---

# CordysCRM MCP Form Config Metadata Exposure

## Current Understanding

The [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) records [CVE-2026-63646](https://cveawg.mitre.org/api/cve/CVE-2026-63646) for CordysCRM before 1.7.2. Broad CordysCRM product coverage belongs upstream if needed; this page owns the local MCP schema and CRM metadata exposure boundary.

The CVE says `GET /mcp/form/config/{formKey}` is exposed without authentication because `/mcp/**` is marked anonymous and the controller lacks a permission annotation. Attackers can retrieve field names, types, required flags, defaults, options, validation rules, and binding sources for CRM forms.

## Security Impact

- Threat: unauthenticated MCP metadata reads can reveal CRM data shape and validation rules useful for later abuse.
- Affected boundary: CordysCRM before 1.7.2, `/mcp/form/config/{formKey}`, anonymous `/mcp/**` routing, and form metadata access.
- Exploit or incident status: public CVE and upstream patch references; no local exploitation incident is recorded.
- Mitigation state: upgrade to 1.7.2 or later, require authenticated principal checks on MCP form configuration routes, and audit anonymous MCP route patterns.
- Confidence: high for CVE publication and affected route after direct CVE Services re-fetch.
- Residual risk: MCP schema routes are discovery surfaces for agents and attackers, so route-level anonymous patterns need regression coverage.

## Authoritative Sources

- [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json)
- [CVE-2026-63646 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-63646)
- [CordysCRM CVE-2026-63646 patch commit](https://github.com/1Panel-dev/CordysCRM/commit/ea8d5f128b94659ce881e9d034a37c18fa86bbbc)
- [CordysCRM CVE-2026-63646 pull request](https://github.com/1Panel-dev/CordysCRM/pull/2725)
- [CordysCRM 1.7.2 release](https://github.com/1Panel-dev/CordysCRM/releases/tag/v1.7.2)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [CordysCRM AI CRM authorization cluster](cordyscrm-ai-crm-authorization-cluster.md)
- [MCP tool-level IAM authorization](mcp-tool-level-iam-authorization.md)

## Open Questions

- Which CordysCRM tests now enforce authenticated access to `/mcp/form/config/{formKey}`?

## Maintenance Notes

- Created on 2026-09-19 from the [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) after verifier correction split the CordysCRM authorization cluster.
