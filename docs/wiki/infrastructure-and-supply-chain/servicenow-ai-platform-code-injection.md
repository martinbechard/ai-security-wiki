---
type: "Topic"
title: "ServiceNow AI platform code injection"
description: "Security analysis for CVE-2026-18885 ServiceNow AI platform code injection and hosted instance remediation."
tags: ["infrastructure-and-supply-chain", "identity-and-access"]
---

# ServiceNow AI platform code injection

## Current Understanding

The [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) records [CVE-2026-18885](https://nvd.nist.gov/vuln/detail/CVE-2026-18885) as a ServiceNow AI platform code injection vulnerability. Broad [ServiceNow platform coverage](../../../upstream-ai-wiki/topic-index.md) belongs upstream; this page owns the local enterprise AI platform code-execution and instance-data boundary.

## Security Impact

- Threat: an unauthenticated user, in some circumstances, can execute arbitrary code and access or modify instance data beyond intended scope.
- Affected boundary: ServiceNow AI platform hosted instances, with partner and self-hosted update paths referenced by the advisory.
- Exploit or incident status: public NVD and ServiceNow support advisory evidence; the [August 29 watcher](../../../raw/processed/2026-08-29/ai-security-wiki-leaf-update-watch-20260829T000405Z.json) records ServiceNow's statement that no known malicious exploitation was reported in checked primary sources.
- Mitigation state: hosted instances are recorded as remediated; partner and self-hosted paths should follow the [ServiceNow advisory update instructions](https://support.servicenow.com/kb?id=kb_article_view&sysparm_article=KB3152242).
- Confidence: high for advisory existence and affected boundary; medium for remediation detail because the public source does not expose all fixed instance/update guidance.
- Residual risk: AI platform extension and control-plane code paths can turn unauthenticated reachability into enterprise workflow data compromise.

## Authoritative Sources

- [August 29 leaf update watch source](../../../raw/processed/2026-08-29/ai-security-wiki-leaf-update-watch-20260829T000405Z.json)
- [August 28 topic collector source](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json)
- [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json)
- [NVD CVE-2026-18885](https://nvd.nist.gov/vuln/detail/CVE-2026-18885)
- [CVE-2026-18885 CVE record](https://www.cve.org/CVERecord?id=CVE-2026-18885)
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

- Which ServiceNow hosted, partner, and self-hosted update levels fully remediate CVE-2026-18885?

## Maintenance Notes

- Updated on 2026-08-29 with [August 29 watcher](../../../raw/processed/2026-08-29/ai-security-wiki-leaf-update-watch-20260829T000405Z.json) provenance for the same durable advisory boundary.
- Updated on 2026-08-29 with [August 28 topic collector](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json) provenance while preserving the existing leaf boundary and avoiding duplicate digest grouping.
- Created on 2026-08-28 from the [August 27 topic collector](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) after splitting the ServiceNow AI platform advisory family by vulnerability type; next check exact update levels and exploitation status.
