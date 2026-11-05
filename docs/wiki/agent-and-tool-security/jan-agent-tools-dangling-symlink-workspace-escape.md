---
type: "Topic"
title: "Jan Agent-Tools Dangling-Symlink Workspace Escape"
description: "Security analysis for CVE-2026-122235, a Jan agent-tools workspace write guard bypass."
tags: ["agent-and-tool-security"]
---

# Jan Agent-Tools Dangling-Symlink Workspace Escape

## Current Understanding

The [November 5 collector source](../../../raw/processed/2026-11-05/ai-security-wiki-topic-news-collector-2026-11-05T003237Z.json) records [CVE-2026-122235](https://github.com/advisories/GHSA-pjpc-p955-xv4f) for Jan 0.8.5 through before 0.8.8. General Jan product context and coding-agent workflow remain upstream; this page owns the agent-tools filesystem-containment boundary.

The advisory says a malicious repository can combine dangling symlinks with prompt injection so write or edit tools follow a link outside the workspace, including to user-home paths. The [Jan 0.8.8 release](https://github.com/janhq/jan/releases/tag/v0.8.8) says paths are checked before reads or writes, but does not describe this advisory's exact fix mechanics.

## Security Impact

- Threat: attacker-controlled repository content can convert a prompt-influenced agent write into an out-of-workspace host-file write.
- Affected boundary: Jan agent-tools workspace write and edit guard in versions 0.8.5 through before 0.8.8.
- Exploit or incident status: public advisory; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to 0.8.8 or later, resolve final paths and parents under the workspace root, and reject dangling or escaping links.
- Confidence: high for the affected range and dangling-symlink bypass; medium for exact remediation mechanics.
- Residual risk: lexical path checks alone do not contain writes when filesystem indirection changes the final target.

## Authoritative Sources

- [November 5 collector source](../../../raw/processed/2026-11-05/ai-security-wiki-topic-news-collector-2026-11-05T003237Z.json)
- [GitHub advisory GHSA-pjpc-p955-xv4f](https://github.com/advisories/GHSA-pjpc-p955-xv4f)
- [Jan 0.8.8 release](https://github.com/janhq/jan/releases/tag/v0.8.8)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [open-multi-agent dangling-symlink sandbox escape](open-multi-agent-dangling-symlink-sandbox-escape.md)
- [Phi symlink workspace write bypass](phi-symlink-workspace-write-bypass.md)

## Open Questions

- Does Jan 0.8.8 canonicalize both parent and final targets for every agent-tools write and edit operation?

## Maintenance Notes

- Created on 2026-11-05 from the November 5 collector after upstream routing retained only the workspace-containment vulnerability locally.
