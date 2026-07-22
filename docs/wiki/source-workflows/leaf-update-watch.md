---
type: "Topic"
title: "Leaf Update Watch"
description: "A raw-only rolling check for public updates to durable local AI security leaves."
---

# Leaf Update Watch

## Current Understanding

The leaf update watch builds its universe from durable Markdown leaves under the approved local security topic roots. It excludes hubs and maintenance pages, checks new or oldest-unchecked leaves first, and uses the relative wiki page path as the stable leaf id.

The watch searches public topic names, aliases, advisory identifiers, and cited public source URLs rather than sending whole local pages to an external service. It applies a seven-day visible date window, records a deterministic state ledger outside the repository, and saves qualifying findings as raw JSON only.

## Practice Boundaries

- Select durable local security leaves, not upstream entity pages or local folder hubs.
- Record sources checked, result status, qualifying updates, exclusions, and follow-up notes for every selected leaf.
- Preserve the federation boundary and route non-security updates upstream.
- Do not edit docs/wiki or save output under raw/processed.

## Authoritative Sources

- [automated update feeds](automated-update-feeds.md)
- [schema.md](../schema.md)
- [federation.md](../federation.md)
- Target environment automation record for AI Security Wiki Leaf Update Watch.

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [source workflows](index.md)
- [public topic news collector](public-topic-news-collector.md)
- [raw project-wiki monitor](raw-project-wiki-monitor.md)

## Open Questions

- No open leaf-watch questions are recorded.

## Maintenance Notes

- Created on 2026-07-22 for rotating public checks of durable local security topics.
