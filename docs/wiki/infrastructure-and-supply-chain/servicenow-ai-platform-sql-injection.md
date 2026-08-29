---
type: "Topic"
title: "ServiceNow AI platform SQL injection"
description: "Security analysis for CVE-2026-74820 ServiceNow AI platform SQL injection and instance data exposure."
tags: ["infrastructure-and-supply-chain", "data-and-privacy"]
---

# ServiceNow AI platform SQL injection

## Current Understanding

The [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) records [CVE-2026-74820](https://nvd.nist.gov/vuln/detail/CVE-2026-74820) as a ServiceNow AI platform SQL injection vulnerability. Broad [ServiceNow platform coverage](../../../upstream-ai-wiki/topic-index.md) belongs upstream; this page owns the local AI platform database confidentiality and integrity boundary.

## Security Impact

- Threat: an unauthenticated user, in some circumstances, can execute SQL against the instance database and access or modify unintended instance data.
- Affected boundary: ServiceNow AI platform hosted instances, with partner and self-hosted update paths referenced by the advisory.
- Exploit or incident status: public NVD and ServiceNow support advisory evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: hosted instances are recorded as remediated; partner and self-hosted paths should follow the [ServiceNow advisory update instructions](https://support.servicenow.com/kb?id=kb_article_view&sysparm_article=KB3152242).
- Confidence: high for advisory existence and affected boundary; medium for remediation detail because the public source does not expose all fixed instance/update guidance.
- Residual risk: enterprise AI platforms often sit near sensitive workflow records, so SQL injection creates direct confidentiality and integrity risk for AI-enabled data.

## Authoritative Sources

- [August 28 topic collector source](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json)
- [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json)
- [NVD CVE-2026-74820](https://nvd.nist.gov/vuln/detail/CVE-2026-74820)
- [CVE-2026-74820 CVE record](https://www.cve.org/CVERecord?id=CVE-2026-74820)
- [ServiceNow support advisory](https://support.servicenow.com/kb?id=kb_article_view&sysparm_article=KB3152242)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [data and privacy](../data-and-privacy/index.md)

## Open Questions

- Which ServiceNow hosted, partner, and self-hosted update levels fully remediate CVE-2026-74820, and has ServiceNow reported exploitation status?

## Maintenance Notes

- Updated on 2026-08-29 with [August 28 topic collector](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json) provenance while preserving the existing leaf boundary and avoiding duplicate digest grouping.
- Created on 2026-08-28 from the [August 27 topic collector](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) after splitting the ServiceNow AI platform advisory family by vulnerability type; next check exact update levels and exploitation status.
