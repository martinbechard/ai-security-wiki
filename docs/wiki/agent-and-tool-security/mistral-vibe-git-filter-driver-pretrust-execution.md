---
type: "Topic"
title: "Mistral Vibe Git Filter-Driver Pre-Trust Execution"
description: "Security analysis for CVE-2026-122134 Git filter-driver execution during Mistral Vibe status collection."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Mistral Vibe Git Filter-Driver Pre-Trust Execution

## Current Understanding

The [November 5 collector source](../../../raw/processed/2026-11-05/ai-security-wiki-topic-news-collector-2026-11-05T003237Z.json) records [CVE-2026-122134](https://github.com/advisories/GHSA-3fw5-5q64-5hwx) for Mistral Vibe before 2.25.7. General product and developer workflow context remains upstream; this page owns the pre-trust Git filter-driver execution boundary.

The advisory says a crafted repository can configure clean or process filters that run when `ProjectContextProvider` invokes `git status` at startup. It references [v2.25.7](https://github.com/mistralai/mistral-vibe/releases/tag/v2.25.7) as the fixed release.

## Security Impact

- Threat: a repository's Git filter driver executes with the user's privileges during agent startup before a trust decision.
- Affected boundary: Mistral Vibe before 2.25.7; `ProjectContextProvider` status collection and Git clean or process filters.
- Exploit or incident status: public advisory; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to 2.25.7 or later and run pre-trust repository inspection without configurable filters.
- Confidence: high for the affected release line and Git-status execution path.
- Residual risk: context collectors that treat Git status as passive metadata can still trigger repository-defined executable hooks or filters.

## Authoritative Sources

- [November 5 collector source](../../../raw/processed/2026-11-05/ai-security-wiki-topic-news-collector-2026-11-05T003237Z.json)
- [GitHub advisory GHSA-3fw5-5q64-5hwx](https://github.com/advisories/GHSA-3fw5-5q64-5hwx)
- [Mistral Vibe 2.25.7 release](https://github.com/mistralai/mistral-vibe/releases/tag/v2.25.7)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Mistral Vibe gpg.program pre-trust execution](mistral-vibe-gpg-program-pretrust-execution.md)
- [Mistral Vibe Windows git.exe pre-trust execution](mistral-vibe-windows-git-exe-pretrust-execution.md)

## Open Questions

- Do all supported Mistral Vibe branches apply the same filter-isolation control before presenting a repository trust prompt?

## Maintenance Notes

- Created on 2026-11-05 from the November 5 collector; this status-collection path is independently maintained from signature-log and executable-resolution paths.
