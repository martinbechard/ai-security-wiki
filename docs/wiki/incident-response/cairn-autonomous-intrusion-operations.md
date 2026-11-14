---
type: "Topic"
title: "Cairn Autonomous Intrusion Operations"
description: "Incident analysis for Unit 42's CL-STA-1238 assessment of model-enabled Cairn intrusion activity."
tags: ["incident-response", "agent-security"]
---

# Cairn Autonomous Intrusion Operations

## Current Understanding

The [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json) preserves Unit 42's report that Chinese-speaking attackers combined the open-source Cairn penetration-testing framework with [GLM 5.2](../../../upstream-ai-wiki/models/glm-5-2.md) and [DeepSeek](../../../upstream-ai-wiki/companies/deepseek-ai.md) models for autonomous operations against organizations in August and September 2026. Broad model coverage belongs upstream; no dedicated upstream Cairn leaf was identified, so this local incident page does not duplicate framework background.

## Security Impact

- Threat: model-assisted planning and tool execution can scale target-to-action intrusion workflows.
- Affected boundary: autonomous intrusion workflow; no product version is a remediation target.
- Exploit or incident status: Unit 42 tracks the activity as CL-STA-1238 with moderate confidence and reports unauthorized access or data obtained at 10 organizations; attribution and totals are its assessment.
- Mitigation state: isolate credentials, restrict egress and tool authority, retain action logs, and use approvals for consequential operations.
- Confidence: medium-high because the primary vendor report supports the incident assessment but is not independently replicated here.
- Residual risk: ordinary model, browser, and tool controls can be composed into offensive automation where account and network controls are weak.

## Authoritative Sources

- [November 13 collector source](../../../raw/processed/2026-11-13/ai-security-wiki-topic-news-collector-2026-11-13T192923-0500.json)
- [Unit 42 incident report](https://unit42.paloaltonetworks.com/attackers-use-autonomous-ai-to-target-semiconductor-defense-and-civil-society-sectors/)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [incident response](index.md)

## Open Questions

- Which report indicators and defensive recommendations remain actionable after Unit 42's original assessment is reviewed?

## Maintenance Notes

- Created on 2026-11-13; incident attribution and impact counts remain explicitly attributed to Unit 42.
