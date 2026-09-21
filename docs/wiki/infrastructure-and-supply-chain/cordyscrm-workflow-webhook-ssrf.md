---
type: "Topic"
title: "CordysCRM Workflow Webhook SSRF"
description: "Security analysis for CVE-2026-76900 CordysCRM approval-flow webhook SSRF."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# CordysCRM Workflow Webhook SSRF

## Current Understanding

The [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json) adds disclosed vulnerability evidence dated 2026-09-18T19:56:53.620Z: CVE Services published a CordysCRM 1.7.3 workflow webhook SSRF affecting stored approval-node webhook configuration, with fix references in PR, commit, and release v1.7.4.

The [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) records [CVE-2026-76900](https://cveawg.mitre.org/api/cve/CVE-2026-76900) for webhook SSRF through CordysCRM approval flow configuration. This page owns the workflow outbound-request boundary.

The direct CVE Services record confirms in-window publication. The September 20 watcher maps the affected boundary to CordysCRM 1.7.3 and records the [GHSA](https://github.com/1Panel-dev/CordysCRM/security/advisories/GHSA-fg6q-pfj7-fghw), [pull request 2966](https://github.com/1Panel-dev/CordysCRM/pull/2966), [commit e0ae23e](https://github.com/1Panel-dev/CordysCRM/commit/e0ae23ebf16faa062204d90a689fe33496541ada), and [v1.7.4 release](https://github.com/1Panel-dev/CordysCRM/releases/tag/v1.7.4) as fix evidence.

## Security Impact

- Threat: workflow webhook configuration can steer server-side requests to internal or attacker-controlled destinations.
- Affected boundary: CordysCRM 1.7.3 approval-flow webhook configuration and stored approval-node webhook targets.
- Exploit or incident status: public CVE publication; no local exploitation incident is recorded.
- Mitigation state: upgrade to CordysCRM v1.7.4 or later, enforce outbound URL allowlists, block private and metadata address ranges after DNS and redirects, and audit historical webhook targets.
- Confidence: medium-high for CVE publication and SSRF class; medium for route-level detail until the patch is mapped.
- Residual risk: workflow automation makes user-configured URLs action surfaces, so webhook egress controls need the same coverage as agent URL-read tools.

## Authoritative Sources

- [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json)
- [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json)
- [CVE-2026-76900 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-76900)
- [GitHub advisory GHSA-fg6q-pfj7-fghw](https://github.com/1Panel-dev/CordysCRM/security/advisories/GHSA-fg6q-pfj7-fghw)
- [CordysCRM pull request 2966](https://github.com/1Panel-dev/CordysCRM/pull/2966)
- [CordysCRM commit e0ae23e](https://github.com/1Panel-dev/CordysCRM/commit/e0ae23ebf16faa062204d90a689fe33496541ada)
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

- Which exact approval-flow route and URL-validation branches changed in pull request 2966 and commit e0ae23e?

## Maintenance Notes

- Updated on 2026-09-20 from the [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json) with in-window disclosed vulnerability evidence while preserving local security-boundary scope.
- Created on 2026-09-19 from the [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) after verifier correction split the CordysCRM injection cluster.
