---
type: "Topic"
title: "PraisonAI file mention path traversal"
description: "Security analysis for CVE-2026-57129 PraisonAI file mention workspace-boundary bypass and arbitrary file read."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security", "data-and-privacy"]
---

# PraisonAI file mention path traversal

## Current Understanding

The [September 14 topic collector source](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json) records [CVE-2026-57129](https://cveawg.mitre.org/api/cve/CVE-2026-57129) for `praisonaiagents` before 1.6.59. Broad PraisonAI framework and file-mention UX context belongs upstream; this page owns the local context-ingestion file boundary.

The CVE says `@file:` mention values could fall back to `Path(file_path)` without traversal rejection, symlink resolution, or workspace-boundary validation. Prompt-addressable file references therefore become arbitrary host-file reads when model or user text can influence the mention path.

## Security Impact

- Threat: agent context ingestion can disclose host files through prompt-addressable file mentions.
- Affected boundary: `praisonaiagents` before 1.6.59 and `MentionsParser` file-mention handling.
- Exploit or incident status: public CVE, GitHub advisory, patch, and release evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade `praisonaiagents` to 1.6.59 or later, resolve paths before access, reject traversal and symlink escapes, and bind file mentions to an explicit workspace root.
- Confidence: high because the source evidence aligns on the file-mention path, patch, and release.
- Residual risk: file mentions are deceptively user-friendly, but they are authority-bearing context ingestion APIs when assistant output can request or transform path strings.

## Authoritative Sources

- [September 14 topic collector source](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json)
- [CVE-2026-57129 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-57129)
- [GitHub advisory GHSA-2rcg-mm5h-xchx](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-2rcg-mm5h-xchx)
- [PraisonAI patch commit](https://github.com/MervinPraison/PraisonAI/commit/b4270173d4123fb1ee8910588f0896668ee21b59)
- [PraisonAI 4.6.59 release](https://github.com/MervinPraison/PraisonAI/releases/tag/v4.6.59)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [Agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)
- [PraisonAI multiedit file boundary bypass](praisonai-multiedit-file-boundary-bypass.md)

## Open Questions

- Which PraisonAI UI or agent flows can inject `@file:` mentions without explicit operator review?

## Maintenance Notes

- Created on 2026-09-15 from the [September 14 topic collector](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json) as a file-mention context-ingestion boundary leaf.
