---
type: "Topic"
title: "GPAI Systemic-Risk Controls"
description: "Security-governance lens for GPAI model systemic-risk assessment, mitigation, and evidence."
tags: ["governance-and-compliance", "testing-and-assurance"]
---

# GPAI Systemic-Risk Controls

## Current Understanding

GPAI systemic-risk controls govern general-purpose AI model use where autonomous capabilities or downstream agentic use create security, misuse, or loss-of-control risk. The [August 3 topic news collector source](../../../raw/processed/2026-08-03/ai-security-wiki-topic-news-collector-2026-08-03T151901-0400.json) records the official [European Commission AI Act Service Desk FAQ](https://ai-act-service-desk.ec.europa.eu/en/faq), which says GPAI rules apply from 2026-08-02 and that systemic-risk obligations include autonomous capabilities and agentic use considerations.

Broad GPAI, EU AI Act, provider, and model background belongs upstream. This page owns the local security-governance lens: teams need model/version dependency evidence, systemic-risk assessment scope, mitigation records, and enforcement-response readiness when GPAI models support agentic systems.

The [August 10 leaf update watch source](../../../raw/processed/2026-08-09/ai-security-wiki-leaf-update-watch-20260810T000240Z.json) adds the same FAQ category as current enforcement-boundary evidence. It says AI agents are covered through AI system and GPAI model definitions, and systemic-risk obligations can consider autonomy and tool use for GPAI models with systemic risk. The fetched FAQ did not expose a page-level update timestamp, so this page treats the evidence as an effective-date and enforcement-boundary clarification, not as a newly published source.

[AI Office GPAI enforcement controls](ai-office-gpai-enforcement-controls.md) owns the separately maintainable enforcement response path for AI Office information requests, model evaluation access, mitigation orders, fines, and market restrictions.

The [September 1 leaf update watch source](../../../raw/processed/2026-09-01/ai-security-wiki-leaf-update-watch-20260902T000316Z.json) adds secondary [Axios reporting](https://www.axios.com/2026/08/28/eu-ai-act-gets-real) that the EU AI Act enforcement context is active for general-purpose model providers. Because official Service Desk pages checked by the source did not expose a visible in-window update date, this page treats the item as enforcement-awareness evidence and does not infer new technical thresholds beyond the official FAQ boundary.

## Security Impact

- Threat: agentic systems can inherit or amplify GPAI model risks when model capability, autonomy, and mitigation evidence are not tracked as release-gate inputs.
- Affected boundary: GPAI model dependencies, autonomous-capability assessment, systemic-risk mitigation evidence, provider/deployer responsibility, and enforcement-response records.
- Exploit or incident status: regulatory systemic-risk boundary, not a specific exploit.
- Mitigation state: official FAQ guidance exists; implementation depends on model-provider evidence, local risk assessment, deployment restrictions, monitoring, and incident-response plans.
- Confidence: high for the 2026-08-02 GPAI rule start date because the source is official European Commission guidance; medium for local applicability until model dependencies and roles are mapped.
- Residual risk: systemic-risk thresholds, model/provider responsibility, downstream agent autonomy, and expected mitigation evidence remain implementation-specific.

## Control Implications

- Maintain GPAI dependency evidence, including provider, model version, capability class, and deployment role.
- Record autonomous-capability and agentic-use assumptions as release-gate evidence.
- Preserve mitigation evidence for misuse, harmful manipulation, unauthorized autonomous action, and incident escalation.
- Include autonomy level, tool-use surface, delegated authority, and external-action controls in GPAI systemic-risk evidence for agent deployments.
- Tie systemic-risk controls to monitoring and enforcement-response records rather than treating them as one-time procurement notes.
- Reconfirm official AI Office evidence before converting secondary reporting into model-provider obligations or local release blockers.

## Authoritative Sources

- [August 3 topic news collector source](../../../raw/processed/2026-08-03/ai-security-wiki-topic-news-collector-2026-08-03T151901-0400.json)
- [August 10 leaf update watch source](../../../raw/processed/2026-08-09/ai-security-wiki-leaf-update-watch-20260810T000240Z.json)
- [September 1 leaf update watch source](../../../raw/processed/2026-09-01/ai-security-wiki-leaf-update-watch-20260902T000316Z.json)
- [European Commission AI Act Service Desk FAQ](https://ai-act-service-desk.ec.europa.eu/en/faq)
- [Axios EU AI Act enforcement reporting](https://www.axios.com/2026/08/28/eu-ai-act-gets-real)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [governance and compliance](index.md)
- [testing and assurance](../testing-and-assurance/index.md)
- [AI agent interaction transparency controls](../agent-and-tool-security/ai-agent-interaction-transparency-controls.md)
- [AI Office GPAI enforcement controls](ai-office-gpai-enforcement-controls.md)
- Upstream AI wiki owns broad GPAI, provider, model, and EU AI Act context.

## Open Questions

- Which GPAI models or providers require systemic-risk evidence for local agent deployments?
- What evidence format will demonstrate that GPAI systemic-risk mitigations passed before release?

## Maintenance Notes

- Created on 2026-08-03 from the [August 3 collector](../../../raw/processed/2026-08-03/ai-security-wiki-topic-news-collector-2026-08-03T151901-0400.json) after splitting GPAI systemic-risk controls from agent-interaction transparency controls.
- Updated on 2026-08-09 from the [August 10 watcher](../../../raw/processed/2026-08-09/ai-security-wiki-leaf-update-watch-20260810T000240Z.json) with AI-agent, autonomy, and tool-use systemic-risk evidence while preserving the missing page-level update-date caveat.
- Updated on 2026-09-01 from the [September 1 leaf watcher](../../../raw/processed/2026-09-01/ai-security-wiki-leaf-update-watch-20260902T000316Z.json) with secondary GPAI enforcement-awareness evidence while preserving the official-source caveat.
