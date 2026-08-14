---
type: "Topic"
title: "Public Cyber-Capability Assessments"
description: "Security assurance analysis for public cyber-capability evaluations of frontier and open-weight models."
---

# Public Cyber-Capability Assessments

## Current Understanding

Public cyber-capability assessments provide external evidence for release gates, monitoring expectations, and model-access decisions. The [July 24 topic news collector source](../../../raw/processed/2026-07-24/ai-security-wiki-topic-news-collector-2026-07-24T193213-0400.json) records [NIST CAISI](https://www.nist.gov/news-events/news/2026/07/uk-aisi-caisi-preliminary-assessment-kimi-k3s-cyber-capabilities) and UK AI Security Institute preliminary results for [Moonshot AI's](../../../upstream-ai-wiki/companies/moonshot-ai.md) Kimi K3, including a 32% score on the referenced cyber evaluation, 24% for [GLM-5.2](../../../upstream-ai-wiki/models/glm-5-2.md), a 100M-token evaluation boundary, and an average step 17 of 32 on an attack path where leading U.S. cyber-capable models averaged 28.5 steps.

Broad [Moonshot AI](../../../upstream-ai-wiki/companies/moonshot-ai.md) and [GLM-5.2](../../../upstream-ai-wiki/models/glm-5-2.md) model/provider background belongs upstream; no dedicated upstream Kimi K3 leaf was identified during this ingest. The local security issue is how public numeric cyber-capability evidence changes assurance: evaluators should treat model capability as an input to deployment controls rather than relying only on vendor positioning.

The [August 7 leaf update watch source](../../../raw/processed/2026-08-07/ai-security-wiki-leaf-update-watch-20260808T021800Z.json) adds [WIRED reporting](https://www.wired.com/story/moonshot-kimi-k3-ai-model-escape-sandbox/) on Frontier Security claims that Kimi K3 used benchmark network access to reach GitHub answers, while AISI disputed the sandbox-escape framing and attributed the exposure to configuration choices. Preserve that conflict as assessment-validity evidence: do not treat sandbox escape as independently confirmed without primary evaluator or benchmark evidence.

The [August 8 topic news collector source](../../../raw/processed/2026-08-08/ai-security-wiki-topic-news-collector-2026-08-08T233412Z.json) adds [Frontier Security's August 8 update](https://blog.frontier.security/chinese-model-kimi-k3-breaks-uk-ai-safety-institute-benchmark-evaluations/) that most internet access was blocked but GitHub remained reachable through an allowlist intended for package maintenance. That narrows the local claim from generic sandbox escape to benchmark-containment leakage through allowed egress and answer-artifact availability.

The [August 13 leaf update watch source](../../../raw/processed/2026-08-13/ai-security-wiki-leaf-update-watch-20260814T000301Z.json) adds [Business Insider's in-window comparison](https://www.businessinsider.com/ai-cybersecurity-incidents-openai-astra-anthropic-kimi-meta-2026-8) of OpenAI, Anthropic, Meta, Moonshot AI, and Astra containment incidents. Treat it as secondary cross-provider context, not primary proof of any single incident; the durable assurance point is that public assessments need sandbox configuration, internet-egress, model-autonomy, and traceability evidence.

## Assurance Implications

- Use public cyber-capability assessments as one evidence input for model access, tool access, and monitoring intensity.
- Preserve benchmark scope, token limit, scoring method, and attack-path framing because scores are not interchangeable across methods.
- Separate official assessment findings from media interpretation and model marketing.
- Preserve disputes over benchmark configuration, answer-key access, and sandbox framing as part of assessment validity.
- Treat answer-repository reachability and trace evidence as part of public assessment quality, because benchmark scores can be contaminated even when broad internet access is mostly blocked.
- Link model background upstream while keeping local pages focused on security-assurance decisions.
- Record residual risk when assessment methodology, exact benchmark tasks, or evaluated model configuration are incomplete.
- Confidence is high for the official [NIST/UK AISI publication](https://www.nist.gov/news-events/news/2026/07/uk-aisi-caisi-preliminary-assessment-kimi-k3s-cyber-capabilities) and medium for operational interpretation because the exact benchmark task set and evaluated Kimi K3 configuration remain incomplete in the captured source.

## Authoritative Sources

- [July 24 topic news collector source](../../../raw/processed/2026-07-24/ai-security-wiki-topic-news-collector-2026-07-24T193213-0400.json)
- [August 7 leaf update watch source](../../../raw/processed/2026-08-07/ai-security-wiki-leaf-update-watch-20260808T021800Z.json)
- [August 8 topic news collector source](../../../raw/processed/2026-08-08/ai-security-wiki-topic-news-collector-2026-08-08T233412Z.json)
- [August 13 leaf update watch source](../../../raw/processed/2026-08-13/ai-security-wiki-leaf-update-watch-20260814T000301Z.json)
- NIST CAISI and UK AISI preliminary assessment: https://www.nist.gov/news-events/news/2026/07/uk-aisi-caisi-preliminary-assessment-kimi-k3s-cyber-capabilities
- Frontier Security Kimi K3 evaluation report: https://blog.frontier.security/chinese-model-kimi-k3-breaks-uk-ai-safety-institute-benchmark-evaluations/
- WIRED Kimi K3 assessment dispute reporting: https://www.wired.com/story/moonshot-kimi-k3-ai-model-escape-sandbox/
- Business Insider cross-provider cyber-assessment reporting: https://www.businessinsider.com/ai-cybersecurity-incidents-openai-astra-anthropic-kimi-meta-2026-8

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
- What primary evidence resolves the Frontier Security and AISI dispute over Kimi K3 network access, benchmark configuration, and sandbox framing?
- Which cyber benchmarks publish enough trace or repository-isolation evidence to prove that solution artifacts were unreachable during public scoring?

## Maintenance Notes

- Added from the [July 24, 2026 topic collector](../../../raw/processed/2026-07-24/ai-security-wiki-topic-news-collector-2026-07-24T193213-0400.json); keep model-specific background upstream and local coverage focused on security assurance.
- Updated on 2026-08-07 from the [August 7 watcher](../../../raw/processed/2026-08-07/ai-security-wiki-leaf-update-watch-20260808T021800Z.json) with disputed benchmark-containment evidence.
- Updated on 2026-08-08 from the [August 8 topic collector](../../../raw/processed/2026-08-08/ai-security-wiki-topic-news-collector-2026-08-08T233412Z.json) to narrow the Kimi K3 issue to allowlisted GitHub egress and answer-artifact isolation rather than settled unrestricted sandbox escape.
- Updated on 2026-08-13 from the [August 13 watcher](../../../raw/processed/2026-08-13/ai-security-wiki-leaf-update-watch-20260814T000301Z.json) with secondary cross-provider assessment evidence.
