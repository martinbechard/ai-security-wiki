---
type: "Topic"
title: "Delegated Agent Cost Guardrail Bypass"
description: "Security assurance analysis for GHSA-j659-8xh6-5pq5 unknown-model cost-cap bypass in atomic-agents-stack."
tags: ["testing-and-assurance", "agent-and-tool-security"]
---

# Delegated Agent Cost Guardrail Bypass

## Current Understanding

The [August 17 topic news collector source](../../../raw/processed/2026-08-17/ai-security-wiki-topic-news-collector-2026-08-17T233246Z.json) records GHSA-j659-8xh6-5pq5 for atomic-agents-stack through 1.0.0. General framework orchestration and cost ergonomics route to the upstream AI development wiki; this local leaf treats cost caps as abuse-containment and assurance evidence for delegated agents.

The advisory says the parallel helper or delegated-agent batch estimator returned zero for model IDs absent from a hardcoded pricing table. Unknown self-hosted models, newly released provider models, or a steered helper model argument could skip daily cost-cap reservation. Version 1.1.0 is listed as patched.

The [August 19 leaf update watch source](../../../raw/processed/2026-08-18/ai-security-wiki-leaf-update-watch-20260819T000420Z.json) adds [GitHub-reviewed severity](https://github.com/advisories/GHSA-j659-8xh6-5pq5) for GHSA-j659-8xh6-5pq5: high severity, CVSS 8.7, CWE-770, fixed in 1.1.0. It also preserves the conformance-test implication that unknown-model reservation should fail closed rather than reserve zero.

This belongs near [AI workload cost anomaly monitoring](ai-workload-cost-anomaly-monitoring.md), but the control boundary is preventive rather than detective: unknown model prices must fail closed or require explicit approval before delegated fan-out begins.

## Security Impact

- Threat: a prompt-influenced or misconfigured delegated-agent workflow can overrun operator-defined spend limits when unknown models are treated as free.
- Affected boundary: atomic-agents-stack through 1.0.0; `cost_guardrails`, `daily_cap_usd`, and parallel helper/delegate batches with unknown model IDs.
- Exploit or incident status: public GitHub advisory; no CVE ID was present in the fetched record.
- Mitigation state: upgrade to 1.1.0, fail closed on unknown pricing, require explicit model-price registration, and alert on delegated fan-out that lacks a reserved budget.
- Confidence: high for advisory timing and affected range; lower for exact patched behavior until release notes and tests are inspected.
- Residual risk: cost caps remain policy estimates and need runtime spend telemetry, per-model pricing updates, and workload attribution to catch billing drift.

## Authoritative Sources

- [August 17 topic news collector source](../../../raw/processed/2026-08-17/ai-security-wiki-topic-news-collector-2026-08-17T233246Z.json)
- [August 19 leaf update watch source](../../../raw/processed/2026-08-18/ai-security-wiki-leaf-update-watch-20260819T000420Z.json)
- GitHub advisory GHSA-j659-8xh6-5pq5: https://github.com/advisories/GHSA-j659-8xh6-5pq5
- atomic-agents-stack release page: https://github.com/dep0we/atomic-agents-stack/releases#release-v1.1.0

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [testing and assurance](index.md)
- [AI workload cost anomaly monitoring](ai-workload-cost-anomaly-monitoring.md)
- [Agent action runtime hooks](../agent-and-tool-security/agent-action-runtime-hooks.md)
- Upstream AI development wiki owns general framework orchestration and model-cost workflow practice, including [Agent Cost Telemetry](../../../upstream-ai-dev-wiki/adoption-and-operating-model/agent-cost-telemetry.md).

## Open Questions

- Which default unknown-model price, approval gate, or fail-closed behavior should be considered acceptable for delegated-agent cost caps?

## Maintenance Notes

- Created on 2026-08-17 from the August 17 topic collector as a separate preventive cost-guardrail leaf, not a duplicate of cost anomaly monitoring.
- Updated on 2026-08-19 from the August 19 leaf watcher with CVSS, CWE-770, fixed-version, and fail-closed conformance-test detail.
