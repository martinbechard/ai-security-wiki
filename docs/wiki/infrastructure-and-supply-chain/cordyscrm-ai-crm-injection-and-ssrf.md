---
type: "Topic"
title: "CordysCRM AI CRM Injection And SSRF"
description: "Security analysis for CordysCRM SQL injection and workflow webhook SSRF CVEs."
tags: ["infrastructure-and-supply-chain", "data-and-privacy"]
---

# CordysCRM AI CRM Injection And SSRF

## Current Understanding

The [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) records CordysCRM injection and server-side request risks alongside its authorization cluster. Broad CordysCRM product context belongs upstream; this page owns the local AI-enabled CRM query and workflow action boundary.

The family is split into focused leaves because the query and workflow controls can change independently:

- [CordysCRM ORDER BY SQL injection](cordyscrm-orderby-sql-injection.md) owns CVE-2026-52745, where account-pool sorting can alter SQL execution.
- [CordysCRM sort.name database function injection](cordyscrm-sort-name-database-function-injection.md) owns CVE-2026-76899, where sort-key handling can select database functions.
- [CordysCRM workflow webhook SSRF](cordyscrm-workflow-webhook-ssrf.md) owns CVE-2026-76900, where approval-flow webhook configuration can steer server-side requests.

## Security Impact

- Threat: CRM query sorting and workflow webhook configuration can become database execution or server-side request authority; linked leaves own issue-specific detail.
- Affected boundary: CordysCRM before 1.7.0, version 1.7.3, and before 1.7.4 depending on CVE; linked leaves own exact query and workflow route boundaries.
- Exploit or incident status: public CVE records and upstream release references; no local exploitation incident is recorded.
- Mitigation state: upgrade to the fixed CordysCRM release for each CVE, parameterize sort handling, restrict callable database functions, and apply SSRF allowlists and private-address blocking to workflow webhook destinations.
- Confidence: high for CVE publication after direct CVE Services re-fetch; medium for exact exploit mechanics until each upstream patch is reconciled.
- Residual risk: AI-labeled business applications mix ordinary CRM data sensitivity with agent or workflow automation, so query and webhook controls need the same release-gate coverage as agent tool egress controls.

## Authoritative Sources

- [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json)
- [CVE-2026-52745 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-52745)
- [CVE-2026-76899 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-76899)
- [CVE-2026-76900 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-76900)
- [CordysCRM 1.7.4 release](https://github.com/1Panel-dev/CordysCRM/releases/tag/v1.7.4)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent network egress controls](../agent-and-tool-security/agent-network-egress-controls.md)
- [CordysCRM AI CRM authorization cluster](../identity-and-access/cordyscrm-ai-crm-authorization-cluster.md)
- [CordysCRM ORDER BY SQL injection](cordyscrm-orderby-sql-injection.md)
- [CordysCRM sort.name database function injection](cordyscrm-sort-name-database-function-injection.md)
- [CordysCRM workflow webhook SSRF](cordyscrm-workflow-webhook-ssrf.md)

## Open Questions

- Which CordysCRM patch or release note confirms each SQL and webhook remediation boundary?

## Maintenance Notes

- Created on 2026-09-19 from the [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json).
- Converted to a router on 2026-09-19 after verifier correction split the bundled injection and SSRF issues into focused leaves.
