---
type: "Topic"
title: "Raw Project-Wiki Monitor"
description: "Verified ingest from clippings and raw sources into federated AI security leaves and digests."
---

# Raw Project-Wiki Monitor

## Current Understanding

The monitor checks [Clippings](../../../Clippings) first, moves eligible non-hidden files into [raw](../../../raw) without overwriting, and then finds unprocessed raw artifacts outside [raw/processed](../../../raw/processed).

For each source, ingest extracts granular security concepts, searches both upstream topic indexes, routes general entity and development-practice knowledge upstream, and updates or creates only security-specific local leaves. It updates item-level monthly digest entries after the durable leaves, runs lint and OKF validation, performs independent topic verification, and moves only complete sources into processed storage.

## Practice Boundaries

- Stop on clipping destination collisions.
- Report both Clippings and raw queue state even when no work exists.
- Keep incomplete, unverified, conflicting, or incorrectly routed sources outside raw/processed.
- Preserve portable relative source links.
- Keep digest entries item-level and reverse chronological rather than grouped by collector run or source artifact.
- Commit a coherent verified ingest unless the task explicitly prohibits commits.

## Authoritative Sources

- [automated update feeds](automated-update-feeds.md)
- [clipping and raw intake](clipping-and-raw-intake.md)
- [source reconciliation and routing](source-reconciliation-and-routing.md)
- [schema.md](../schema.md)
- Target environment automation record for AI Security Wiki Raw Project-Wiki Monitor.

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

- No open ingest questions are recorded.

## Maintenance Notes

- Created on 2026-07-22 as the sole scheduled owner of docs/wiki ingest changes.
