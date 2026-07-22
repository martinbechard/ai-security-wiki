---
type: "Topic"
title: "Automated Update Feeds"
description: "Source-first automation for daily AI security discovery, durable-leaf updates, and verified raw ingest."
---

# Automated Update Feeds

## Current Understanding

This wiki uses three automation layers:

- [Public Topic News Collector](public-topic-news-collector.md) runs daily and searches public sources for security-related AI items.
- [Leaf Update Watch](leaf-update-watch.md) checks existing durable local security leaves for recent public changes.
- [Raw Project-Wiki Monitor](raw-project-wiki-monitor.md) moves clippings into raw, ingests eligible raw artifacts, updates local leaves and monthly digests, verifies the result, and moves complete sources to processed storage.

The two collectors are raw-only. They never edit docs/wiki and never write directly to raw/processed. The ingest monitor is the only scheduled layer that changes durable wiki pages.

## Feed Topics

- AI threat activity, abuse, adversarial techniques, and vulnerability disclosures.
- Prompt injection, jailbreaks, model extraction, poisoning, evasion, unsafe output handling, and guardrail bypasses.
- Agent, tool, browser, MCP, plugin, and autonomous-action security.
- AI identity, delegated authority, authentication, authorization, secrets, and least privilege.
- Training, retrieval, inference, memory, telemetry, privacy, retention, and data leakage.
- Model, dataset, dependency, package, artifact, runtime, cloud, hardware, and deployment supply chains.
- Threat modeling, red teaming, security benchmarks, assurance, monitoring, and release gates.
- AI security standards, regulations, governance, audit evidence, and risk-management changes.
- Public AI incidents, mitigations, patches, disclosures, and lessons learned.

## Practice Boundaries

- Use only public sources and visible date evidence.
- Never send private, proprietary, sensitive, PII, or company-internal local content to external services.
- Route general AI entity news to ai-wiki and general AI-development practice to ai-dev-wiki.
- Keep only a concrete security finding, control, assurance result, governance change, or incident implication locally.

## Authoritative Sources

- [schema.md](../schema.md)
- [federation.md](../federation.md)
- Target environment automation records for the three AI Security Wiki automations.

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [source workflows](index.md)
- [digests](../digests/index.md)

## Open Questions

- No open automation questions are recorded.

## Maintenance Notes

- Created on 2026-07-22 for the federated AI security source workflow.
