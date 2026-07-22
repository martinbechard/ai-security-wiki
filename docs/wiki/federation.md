---
type: "Topic"
title: "Wiki Federation"
description: "One-way federation keeps broad AI and AI-development knowledge upstream while this wiki owns security-specific analysis."
---

# Wiki Federation

## Current Understanding

This wiki is a downstream, one-way extension of two maintained wikis:

- The [AI wiki](../../upstream-ai-wiki/README.md) owns broad ecosystem entities such as companies, models, products, frameworks, MCP servers, developer tools, and general AI techniques.
- The [AI development wiki](../../upstream-ai-dev-wiki/README.md) owns AI-assisted software-development practices, coding-agent workflows, verification patterns, adoption practices, and development governance.

This wiki owns the security lens: AI-specific threats and attacks, model and prompt security, agent and tool security, data and privacy controls, identity and access, infrastructure and supply-chain security, security testing and assurance, governance and compliance, and AI incident response.

A local page may cite an upstream entity or development practice when the security analysis depends on it, but must not restate the upstream page as a parallel encyclopedia entry. If a source contains both general product news and a security finding, route the general product update upstream and keep the security finding, affected boundary, mitigation, evidence, and operational implication here.

## Federation Rules

- Search [ai-wiki topic-index.md](../../upstream-ai-wiki/topic-index.md) and [ai-dev-wiki topic-index.md](../../upstream-ai-dev-wiki/topic-index.md) before creating a local leaf.
- Link to an upstream durable page when it already owns the entity or development practice.
- Create a local leaf only when the durable subject is security-specific or needs independently maintained security analysis.
- Keep company, product, model, framework, MCP-server, and tool catalogs upstream.
- Keep general coding, agent workflow, evaluation, and adoption practices in ai-dev-wiki unless the page owns a distinct security control or threat boundary.
- Record unclear ownership in [open-decisions.md](open-decisions.md) instead of silently duplicating a leaf.
- Do not schedule duplicate broad AI or AI-development feeds. Local collectors search security-specific public sources and route non-security findings upstream.

## Authoritative Sources

- [AI wiki README](../../upstream-ai-wiki/README.md)
- [AI wiki topic index](../../upstream-ai-wiki/topic-index.md)
- [AI development wiki README](../../upstream-ai-dev-wiki/README.md)
- [AI development wiki topic index](../../upstream-ai-dev-wiki/topic-index.md)
- [schema.md](schema.md)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [topic-index.md](topic-index.md)
- [source reconciliation and routing](source-workflows/source-reconciliation-and-routing.md)

## Open Questions

- No open federation questions are recorded.

## Maintenance Notes

- Established on 2026-07-22 as a one-way extension of ai-wiki and ai-dev-wiki.
