---
type: "Topic"
title: "CordysCRM AI CRM Authorization Cluster"
description: "Security analysis for CordysCRM MCP, SSE, record-read, and attachment-preview authorization CVEs."
tags: ["identity-and-access", "data-and-privacy", "agent-and-tool-security"]
---

# CordysCRM AI CRM Authorization Cluster

## Current Understanding

The [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) records a same-day CordysCRM authorization and data-exposure cluster. Broad CordysCRM product coverage belongs upstream if needed; this page owns the local AI-enabled CRM identity, workflow-event, MCP metadata, and cross-organization data boundaries.

The cluster is split into focused leaves because each boundary can change independently:

- [CordysCRM MCP form config metadata exposure](cordyscrm-mcp-form-config-metadata-exposure.md) owns CVE-2026-63646, where anonymous `/mcp/**` routing exposes `GET /mcp/form/config/{formKey}` metadata before 1.7.2.
- [CordysCRM SSE workflow event authorization](cordyscrm-sse-workflow-event-authorization.md) owns CVE-2026-63647, where anonymous SSE routes trust caller-controlled `userId` before 1.7.2.
- [CordysCRM record read authorization bypass](cordyscrm-record-read-authorization-bypass.md) owns CVE-2026-76901, where lead and account record reads are unscoped across organizations.
- [CordysCRM attachment preview authorization bypass](cordyscrm-attachment-preview-authorization-bypass.md) owns CVE-2026-76902, where attachment preview downloads are anonymous across organizations.

## Security Impact

- Threat: unauthenticated or improperly scoped AI CRM endpoints can expose form schema, workflow events, approval context, lead/account records, and attachments; linked leaves own issue-specific detail.
- Affected boundary: CordysCRM before 1.7.2 and before 1.7.4 depending on CVE; linked leaves own exact route boundaries.
- Exploit or incident status: public CVE records and upstream release references; no local exploitation incident is recorded.
- Mitigation state: upgrade to the fixed CordysCRM release for each CVE, remove anonymous access for MCP and SSE control paths, derive event-stream identity from authenticated principals, and enforce organization/object scoping for reads and attachment previews.
- Confidence: high for CVE publication after direct CVE Services re-fetch; medium for complete affected-version mapping because the cluster spans multiple fixed releases.
- Residual risk: AI CRM and MCP endpoints expose both metadata and workflow context, so authorization tests must cover agent-facing schema routes and event callbacks, not only classic CRUD endpoints.

## Authoritative Sources

- [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json)
- [CVE-2026-63646 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-63646)
- [CVE-2026-63647 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-63647)
- [CVE-2026-76901 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-76901)
- [CVE-2026-76902 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-76902)
- [CordysCRM 1.7.2 release](https://github.com/1Panel-dev/CordysCRM/releases/tag/v1.7.2)
- [CordysCRM 1.7.4 release](https://github.com/1Panel-dev/CordysCRM/releases/tag/v1.7.4)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [data and privacy](../data-and-privacy/index.md)
- [MCP tool-level IAM authorization](mcp-tool-level-iam-authorization.md)
- [CordysCRM MCP form config metadata exposure](cordyscrm-mcp-form-config-metadata-exposure.md)
- [CordysCRM SSE workflow event authorization](cordyscrm-sse-workflow-event-authorization.md)
- [CordysCRM record read authorization bypass](cordyscrm-record-read-authorization-bypass.md)
- [CordysCRM attachment preview authorization bypass](cordyscrm-attachment-preview-authorization-bypass.md)

## Open Questions

- Which CordysCRM release notes map each authorization CVE to the exact fixed controller or route?

## Maintenance Notes

- Created on 2026-09-19 from the [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json).
- Converted to a router on 2026-09-19 after verifier correction split the bundled authorization issues into focused leaves.
