---
type: "Topic"
title: "Public Cyber-Capability Assessments"
description: "Security assurance analysis for public cyber-capability evaluations of frontier and open-weight models."
---

# Public Cyber-Capability Assessments

## Current Understanding

Public cyber-capability assessments provide external evidence for release gates, monitoring expectations, and model-access decisions. The [July 24 topic news collector source](../../../raw/processed/2026-07-24/ai-security-wiki-topic-news-collector-2026-07-24T193213-0400.json) records [NIST CAISI](https://www.nist.gov/news-events/news/2026/07/uk-aisi-caisi-preliminary-assessment-kimi-k3s-cyber-capabilities) and UK AI Security Institute preliminary results for [Moonshot AI's](../../../upstream-ai-wiki/companies/moonshot-ai.md) Kimi K3, including a 32% score on the referenced cyber evaluation, 24% for [GLM-5.2](../../../upstream-ai-wiki/models/glm-5-2.md), a 100M-token evaluation boundary, and an average step 17 of 32 on an attack path where leading U.S. cyber-capable models averaged 28.5 steps.

Broad [Moonshot AI](../../../upstream-ai-wiki/companies/moonshot-ai.md) and [GLM-5.2](../../../upstream-ai-wiki/models/glm-5-2.md) model/provider background belongs upstream; no dedicated upstream Kimi K3 leaf was identified during this ingest. The local security issue is how public numeric cyber-capability evidence changes assurance: evaluators should treat model capability as an input to deployment controls rather than relying only on vendor positioning.

## Assurance Implications

- Use public cyber-capability assessments as one evidence input for model access, tool access, and monitoring intensity.
- Preserve benchmark scope, token limit, scoring method, and attack-path framing because scores are not interchangeable across methods.
- Separate official assessment findings from media interpretation and model marketing.
- Link model background upstream while keeping local pages focused on security-assurance decisions.
- Record residual risk when assessment methodology, exact benchmark tasks, or evaluated model configuration are incomplete.
- Confidence is high for the official [NIST/UK AISI publication](https://www.nist.gov/news-events/news/2026/07/uk-aisi-caisi-preliminary-assessment-kimi-k3s-cyber-capabilities) and medium for operational interpretation because the exact benchmark task set and evaluated Kimi K3 configuration remain incomplete in the captured source.

## Authoritative Sources

- [July 24 topic news collector source](../../../raw/processed/2026-07-24/ai-security-wiki-topic-news-collector-2026-07-24T193213-0400.json)
- NIST CAISI and UK AISI preliminary assessment: https://www.nist.gov/news-events/news/2026/07/uk-aisi-caisi-preliminary-assessment-kimi-k3s-cyber-capabilities

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [testing and assurance](index.md)
- [cyber-evaluation containment](cyber-evaluation-containment.md)
- [governance and compliance](../governance-and-compliance/index.md)
- [threats and attacks](../threats-and-attacks/index.md)
- Upstream AI wiki owns broad model and provider context.

## Open Questions

- What exact benchmark name, task set, and methodology should be cited for the Kimi K3 preliminary assessment?

## Maintenance Notes

- Added from the [July 24, 2026 topic collector](../../../raw/processed/2026-07-24/ai-security-wiki-topic-news-collector-2026-07-24T193213-0400.json); keep model-specific background upstream and local coverage focused on security assurance.
