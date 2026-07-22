---
type: "Wiki Schema"
title: "Wiki Schema"
description: "Authority, page, federation, source lifecycle, digest, and security-evidence rules for the AI security wiki."
---

# Wiki Schema

## Authority Order

1. Primary security advisories, vulnerability records, standards, laws, official incident reports, code, and tests describe verified facts and actual behavior.
2. Product security documentation, threat models, specifications, and requirements describe intended controls and boundaries.
3. AGENTS.md, README files, procedures, and runbooks describe workflow obligations.
4. Backlog and incident records describe tracked work; explicit status fields outrank file presence.
5. Architecture, plans, research papers, and reputable secondary analysis provide design and contextual evidence.
6. Wiki pages synthesize and navigate those sources.

## Topic Page Contract

Non-reserved concept pages use OKF frontmatter with `type`, `title`, and `description`, then these sections:

```markdown
## Current Understanding
## Authoritative Sources
## Related Code
## Related Tests
## Related Backlog Items
## Related Wiki Pages
## Open Questions
## Maintenance Notes
```

Security pages should distinguish observed exploit evidence, demonstrated research, plausible threat hypotheses, affected versions or boundaries, mitigations, residual risk, and confidence. Do not convert a vendor claim, search snippet, or undated report into confirmed exploitation.

## Maintenance Rules

- Prefer granular durable leaves over omnibus pages.
- Search both upstream topic indexes before creating a local leaf.
- Keep broad entities in ai-wiki and general AI-development practices in ai-dev-wiki; keep only independently maintainable security analysis here.
- Use point-of-need links to upstream pages instead of copying their background.
- Collectors and leaf watches are raw-only. Only ingest may update docs/wiki.
- Use public sources only for automated collection, and never send private, proprietary, sensitive, PII, or company-internal local content to external services.
- Store unprocessed artifacts in [raw](../../raw), fully processed artifacts in [raw/processed](../../raw/processed), and human clippings in [Clippings](../../Clippings).
- Create one monthly digest entry per independently changing security item or closely coupled advisory family. Keep entries short, leaf-linked, and reverse chronological.
- Run lint, OKF validation, and the independent topic verifier before moving a raw source to processed storage.
- Preserve unresolved contradictions, attribution gaps, and ownership uncertainty as open questions.
- Use portable relative links for repository source artifacts; never add machine-specific absolute source links to wiki content.

## Related Wiki Pages

- [federation.md](federation.md)
- [topic-index.md](topic-index.md)
- [source workflows](source-workflows/index.md)
