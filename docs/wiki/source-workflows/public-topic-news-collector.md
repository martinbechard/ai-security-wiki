---
type: "Topic"
title: "Public Topic News Collector"
description: "The raw-only daily query for recent security-related AI items."
---

# Public Topic News Collector

## Current Understanding

The topic news collector performs the daily public query for AI security items. It searches the approved local security topics, applies a two-day visible publication or update window, and saves qualifying findings as structured JSON under [raw](../../../raw).

A qualifying result must contain a concrete security fact or change: a threat or exploit, vulnerability or advisory, mitigation or patch, control or assurance result, standard or regulatory change, or public incident relevant to AI systems. Product announcements without a concrete security delta are excluded or routed upstream.

The artifact records source URLs, visible dates, factual summaries, security relevance, affected boundaries, named entities, upstream routing, exclusions with reasons, confidence or evidence notes, and follow-up actions. The collector does not edit docs/wiki.

## Practice Boundaries

- Search public security advisories, standards bodies, official product security pages, reputable security research, vulnerability databases, incident reports, and primary technical sources.
- Use a two-day visible date window and exclude ambiguous, future, missing, or boundary-only dates.
- Distinguish confirmed exploitation, demonstrated research, disclosed vulnerability, and unverified claim.
- Route broad entity background to ai-wiki and general development practices to ai-dev-wiki.
- Validate any created JSON artifact before closeout.

## Authoritative Sources

- [automated update feeds](automated-update-feeds.md)
- [schema.md](../schema.md)
- [federation.md](../federation.md)
- Target environment automation record for AI Security Wiki Topic News Collector.

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [source workflows](index.md)
- [leaf update watch](leaf-update-watch.md)
- [raw project-wiki monitor](raw-project-wiki-monitor.md)

## Open Questions

- No open collector questions are recorded.

## Maintenance Notes

- Created on 2026-07-22 as the daily security-related AI query.
