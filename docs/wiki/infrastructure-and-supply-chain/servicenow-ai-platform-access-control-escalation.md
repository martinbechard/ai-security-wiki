---
type: "Topic"
title: "ServiceNow AI platform access-control escalation"
description: "Security analysis for CVE-2026-18886 ServiceNow AI platform improper access control and privilege escalation."
tags: ["infrastructure-and-supply-chain", "identity-and-access"]
---

# ServiceNow AI platform access-control escalation

## Current Understanding

The [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) records [CVE-2026-18886](https://nvd.nist.gov/vuln/detail/CVE-2026-18886) as a ServiceNow AI platform improper access-control vulnerability. Broad [ServiceNow platform coverage](../../../upstream-ai-wiki/topic-index.md) belongs upstream; this page owns the local AI platform data-changing authorization and privilege-escalation boundary.

## Security Impact

- Threat: an unauthenticated user, in some circumstances, can create or modify instance data beyond intended scope and escalate privileges.
- Affected boundary: ServiceNow AI platform hosted instances, with partner and self-hosted update paths referenced by the advisory.
- Exploit or incident status: public NVD and ServiceNow support advisory evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: hosted instances are recorded as remediated; partner and self-hosted paths should follow the [ServiceNow advisory update instructions](https://support.servicenow.com/kb?id=kb_article_view&sysparm_article=KB3152242).
- Confidence: high for advisory existence and affected boundary; medium for remediation detail because the public source does not expose all fixed instance/update guidance.
- Residual risk: AI workflow platforms need final authorization on data-changing actions, especially where unauthenticated flows can reach platform internals.

## Authoritative Sources

- [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json)
- [NVD CVE-2026-18886](https://nvd.nist.gov/vuln/detail/CVE-2026-18886)
- [CVE-2026-18886 CVE record](https://www.cve.org/CVERecord?id=CVE-2026-18886)
- [ServiceNow support advisory](https://support.servicenow.com/kb?id=kb_article_view&sysparm_article=KB3152242)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [identity and access](../identity-and-access/index.md)

## Open Questions

- Which ServiceNow hosted, partner, and self-hosted update levels fully remediate CVE-2026-18886, and has ServiceNow reported exploitation status?

## Maintenance Notes

- Created on 2026-08-28 from the [August 27 topic collector](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) after splitting the ServiceNow AI platform advisory family by vulnerability type; next check exact update levels and exploitation status.
