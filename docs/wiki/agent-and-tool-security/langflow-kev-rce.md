---
type: "Topic"
title: "Langflow KEV Remote Code Execution"
description: "Security analysis for CVE-2026-0770, an actively exploited Langflow unauthenticated remote code execution vulnerability."
---

# Langflow KEV Remote Code Execution

## Current Understanding

The [July 23 topic news collector source](../../../raw/processed/2026-07-23/ai-security-wiki-topic-news-collector-2026-07-23T193409-0400.json) records [CISA's July 21, 2026 addition](https://www.cisa.gov/news-events/alerts/2026/07/21/cisa-adds-four-known-exploited-vulnerabilities-catalog) of CVE-2026-0770 to the Known Exploited Vulnerabilities catalog. [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-0770) describes the Langflow flaw as unauthenticated remote code execution through `exec_globals` handling in the `validate` endpoint, with CISA metadata marking active exploitation, automatable exploitation, and total technical impact.

Broad Langflow product and AI workflow-builder background belongs upstream. This page owns the local AI orchestration security lens: Langflow-style platforms often hold model credentials, data connectors, tool definitions, and runtime authority, so an exposed RCE becomes an agent infrastructure incident boundary rather than only an application-server patch item.

## Security Impact

- Threat: unauthenticated remote code execution against an AI workflow and agent-building platform.
- Affected boundary: Langflow affected installations, including Langflow 1.4.2 per the raw source's NVD CPE note; `validate` endpoint handling of `exec_globals`; credentials, connectors, and tool runtimes reachable from the deployed service.
- Exploit or incident status: CISA KEV active exploitation; required action deadline recorded by the raw source as 2026-07-24.
- Mitigation state: patch or remove exposed affected Langflow services, treat internet-facing agent workflow platforms as KEV-gated release and operations surfaces, and rotate credentials if compromise is suspected.
- Confidence: high for CISA/NVD metadata carried by the raw source; medium for deployment-specific affected ranges because local installations were not enumerated.
- Residual risk: downstream forks, containers, and embedded Langflow deployments may remain exposed if they are not covered by normal KEV inventory.

## Authoritative Sources

- [July 23 topic news collector source](../../../raw/processed/2026-07-23/ai-security-wiki-topic-news-collector-2026-07-23T193409-0400.json)
- CISA alert: https://www.cisa.gov/news-events/alerts/2026/07/21/cisa-adds-four-known-exploited-vulnerabilities-catalog
- CISA KEV catalog lookup: https://www.cisa.gov/known-exploited-vulnerabilities-catalog?field_cve=CVE-2026-0770
- NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-0770

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [infrastructure and supply chain](../infrastructure-and-supply-chain/index.md)
- [identity and access](../identity-and-access/index.md)
- [incident response](../incident-response/index.md)
- Upstream AI wiki owns broad Langflow product context.

## Open Questions

- Which Langflow release or vendor advisory should be treated as the authoritative fixed-version source for CVE-2026-0770?

## Maintenance Notes

- Added from the July 23, 2026 raw collector artifact; track KEV due-date and exploitation status separately from general Langflow framework coverage.
