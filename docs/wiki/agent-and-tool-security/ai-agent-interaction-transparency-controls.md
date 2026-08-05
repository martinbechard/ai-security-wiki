---
type: "Topic"
title: "AI Agent Interaction Transparency Controls"
description: "Security-control lens for disclosing when AI agents interact with natural persons."
tags: ["agent-and-tool-security", "governance-and-compliance"]
---

# AI Agent Interaction Transparency Controls

## Current Understanding

AI agent interaction transparency controls govern agent deployments that interact with natural persons or generate content in ways users may mistake for human action or non-AI content. The [August 3 topic news collector source](../../../raw/processed/2026-08-03/ai-security-wiki-topic-news-collector-2026-08-03T151901-0400.json) records the official [European Commission AI Act Service Desk FAQ](https://ai-act-service-desk.ec.europa.eu/en/faq), which says AI agents are not a separate legal category but can be covered by AI system definitions. The same source records 2026-08-02 as the start date for transparency obligations affecting AI agents intended to interact with natural persons or generate content.

The [August 4 leaf update watch source](../../../raw/processed/2026-08-04/ai-security-wiki-leaf-update-watch-2026-08-04T161500Z.json) adds the Commission [AI Act Service Desk Resources](https://ai-act-service-desk.ec.europa.eu/en/resources) page as release evidence. The source records 2026-07-31 resource-page evidence that enforcement begins from 2026-08-02 and that certain AI systems must tell users when they interact with AI or when content was generated or altered by AI.

Broad EU AI Act and agent product background belongs upstream. This page owns the local agent-security lens: systems need evidence for user-facing AI interaction notices, generated-content transparency where applicable, and release-gate checks that connect transparency to delegated authority.

## Security Impact

- Threat: users and operators can misjudge whether they are interacting with an AI agent, whether an agent is acting with delegated authority, or whether output is AI-generated.
- Affected boundary: AI agents intended to interact with natural persons, generated-content workflows, delegated-authority notices, and user-facing transparency evidence.
- Exploit or incident status: regulatory transparency boundary, not a specific exploit.
- Mitigation state: official FAQ and resource-page guidance exists; implementation depends on concrete notices, content marking paths, and evidence retention.
- Confidence: high for the 2026-08-02 start date and agent framing because the sources are official European Commission guidance; medium for local applicability until each agent role is mapped.
- Residual risk: provider/deployer responsibility, notice placement, accessibility, and enforcement evidence remain implementation-specific.

## Control Implications

- Record whether each agent interaction needs a user-facing AI disclosure.
- Tie transparency controls to delegated authority controls so users can see when an agent is acting, generating, or requesting authority.
- Preserve release-gate evidence for user notice behavior and generated-content marking paths.
- Keep harmful manipulation, impersonation, deception, and unauthorized autonomous action in the threat model for agent transparency reviews.

## Authoritative Sources

- [August 3 topic news collector source](../../../raw/processed/2026-08-03/ai-security-wiki-topic-news-collector-2026-08-03T151901-0400.json)
- [August 4 leaf update watch source](../../../raw/processed/2026-08-04/ai-security-wiki-leaf-update-watch-2026-08-04T161500Z.json)
- European Commission AI Act Service Desk FAQ: https://ai-act-service-desk.ec.europa.eu/en/faq
- European Commission AI Act Service Desk Resources: https://ai-act-service-desk.ec.europa.eu/en/resources

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [governance and compliance](../governance-and-compliance/index.md)
- [synthetic content provenance labeling controls](../governance-and-compliance/synthetic-content-provenance-labeling-controls.md)
- [GPAI systemic-risk controls](../governance-and-compliance/gpai-systemic-risk-controls.md)
- Upstream AI wiki owns broad EU AI Act, provider, model, and product context.
- Upstream AI development wiki owns general agent workflow practice.

## Open Questions

- Which local agents are intended to interact with natural persons under the EU AI Act framing?
- What evidence format will demonstrate that agent transparency and generated-content marking passed before release?

## Maintenance Notes

- Created on 2026-08-03 from the [August 3 collector](../../../raw/processed/2026-08-03/ai-security-wiki-topic-news-collector-2026-08-03T151901-0400.json) after splitting agent-interaction transparency from GPAI systemic-risk controls; enriched from the [August 4 leaf watcher](../../../raw/processed/2026-08-04/ai-security-wiki-leaf-update-watch-2026-08-04T161500Z.json) with official resource-page release evidence.
