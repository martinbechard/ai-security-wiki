---
type: "Topic"
title: "Cyber Resilience Act AI Security Lifecycle"
description: "Governance lens for applying Cyber Resilience Act implementation guidance to AI software, model, tool, and runtime products."
---

# Cyber Resilience Act AI Security Lifecycle

## Current Understanding

The [July 27 topic news collector source](../../../raw/processed/2026-07-27/ai-security-wiki-topic-news-collector-2026-07-27T193242-0400.json) records European Commission publication of [Cyber Resilience Act implementation guidance](https://digital-strategy.ec.europa.eu/en/news/commission-publishes-new-guidance-support-businesses-implementation-cyber-resilience-act).

The Commission source says the guidance clarifies:

- Product scope.
- Substantial modification.
- Support periods.
- Reporting obligations.
- Risk assessment requirements.

The Commission fact page records [reporting obligations beginning 2026-09-11 and main CRA obligations applying 2027-12-11](https://digital-strategy.ec.europa.eu/en/factpages/cyber-resilience-act-implementation).

The [July 28 leaf update watch source](../../../raw/processed/2026-07-28/ai-security-wiki-leaf-update-watch-2026-07-28T200204-0400.json) confirms the same official guidance and fact-page source set. It reinforces the reporting-readiness and full-application milestone dates without changing the local applicability caveat.

This page owns the AI security lifecycle lens. AI products may need security lifecycle evidence for:

- Software surfaces.
- Model-serving surfaces.
- Agent tool surfaces.
- Runtime and cloud surfaces.
- Connected device surfaces.
- Integration surfaces.

Broad EU policy, AI Act, and legislative background belongs upstream when it is not security-specific.

## Security Impact

- Threat or control area: AI product teams may miss lifecycle cybersecurity obligations when model, tool, runtime, and integration surfaces are treated as only AI governance topics.
- Affected boundary: digital products placed on the EU market, including AI-enabled software and connected product surfaces when CRA scope applies.
- Exploit or incident status: no incident; official regulatory implementation guidance.
- Mitigation state:
  - Review the [Commission guidance and annexes](https://digital-strategy.ec.europa.eu/en/library/commission-publishes-new-guidance-support-timely-cyber-resilience-act-implementation) before relying on local obligations.
  - Map applicable requirements to release gates.
  - Map vulnerability disclosure intake to reporting obligations.
  - Track support-period evidence for in-scope products.
  - Preserve audit evidence for risk assessment and lifecycle security decisions.
- Confidence: high for official publication, dates, and stated implementation topics from the [Commission news](https://digital-strategy.ec.europa.eu/en/news/commission-publishes-new-guidance-support-businesses-implementation-cyber-resilience-act), [library](https://digital-strategy.ec.europa.eu/en/library/commission-publishes-new-guidance-support-timely-cyber-resilience-act-implementation), and [implementation fact page](https://digital-strategy.ec.europa.eu/en/factpages/cyber-resilience-act-implementation); medium for local applicability until product scope is assessed against the guidance.
- Residual risk: product scope, substantial modification, and reporting obligations can shift release and maintenance responsibilities after an AI model, agent tool, or runtime changes materially.

## Authoritative Sources

- [July 27 topic news collector source](../../../raw/processed/2026-07-27/ai-security-wiki-topic-news-collector-2026-07-27T193242-0400.json)
- [July 28 leaf update watch source](../../../raw/processed/2026-07-28/ai-security-wiki-leaf-update-watch-2026-07-28T200204-0400.json)
- European Commission news: https://digital-strategy.ec.europa.eu/en/news/commission-publishes-new-guidance-support-businesses-implementation-cyber-resilience-act
- European Commission library page: https://digital-strategy.ec.europa.eu/en/library/commission-publishes-new-guidance-support-timely-cyber-resilience-act-implementation
- European Commission implementation fact page: https://digital-strategy.ec.europa.eu/en/factpages/cyber-resilience-act-implementation

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [governance and compliance](index.md)
- [testing and assurance](../testing-and-assurance/index.md)
- [infrastructure and supply chain](../infrastructure-and-supply-chain/index.md)
- [incident response](../incident-response/index.md)
- Upstream AI wiki owns broad EU AI policy background.

## Open Questions

- Which CRA guidance annexes or product-scope examples apply to AI model-serving, agent-tool, and AI-enabled software products?
- What local evidence pack should demonstrate vulnerability handling and support-period readiness before 2026-09-11?

## Maintenance Notes

- Added from the [July 27, 2026 topic collector artifact](../../../raw/processed/2026-07-27/ai-security-wiki-topic-news-collector-2026-07-27T193242-0400.json); enriched from the [July 28 leaf watcher](../../../raw/processed/2026-07-28/ai-security-wiki-leaf-update-watch-2026-07-28T200204-0400.json). Verify legal applicability against official guidance before converting this lens into mandatory local release gates.
