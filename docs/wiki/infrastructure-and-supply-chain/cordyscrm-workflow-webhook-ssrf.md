---
type: "Topic"
title: "CordysCRM Workflow Webhook SSRF"
description: "Security analysis for CVE-2026-76900 CordysCRM approval-flow webhook SSRF."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# CordysCRM Workflow Webhook SSRF

## Current Understanding

The [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) records [CVE-2026-76900](https://cveawg.mitre.org/api/cve/CVE-2026-76900) for webhook SSRF through CordysCRM approval flow configuration. This page owns the workflow outbound-request boundary.

The direct CVE Services record confirms in-window publication. The collector maps the finding to approval-flow configuration and same-day CordysCRM release evidence; exact patch mechanics need upstream reconciliation.

## Security Impact

- Threat: workflow webhook configuration can steer server-side requests to internal or attacker-controlled destinations.
- Affected boundary: CordysCRM approval-flow webhook configuration; affected version needs upstream patch reconciliation.
- Exploit or incident status: public CVE publication; no local exploitation incident is recorded.
- Mitigation state: upgrade to the fixed CordysCRM release, enforce outbound URL allowlists, block private and metadata address ranges after DNS and redirects, and audit historical webhook targets.
- Confidence: medium-high for CVE publication and SSRF class; medium for route-level detail until the patch is mapped.
- Residual risk: workflow automation makes user-configured URLs action surfaces, so webhook egress controls need the same coverage as agent URL-read tools.

## Authoritative Sources

- [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json)
- [CVE-2026-76900 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-76900)
- [CordysCRM 1.7.4 release](https://github.com/1Panel-dev/CordysCRM/releases/tag/v1.7.4)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [CordysCRM AI CRM injection and SSRF](cordyscrm-ai-crm-injection-and-ssrf.md)
- [agent network egress controls](../agent-and-tool-security/agent-network-egress-controls.md)

## Open Questions

- Which CordysCRM patch maps CVE-2026-76900 to the affected approval-flow webhook route and fixed version?

## Maintenance Notes

- Created on 2026-09-19 from the [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) after verifier correction split the CordysCRM injection cluster.
