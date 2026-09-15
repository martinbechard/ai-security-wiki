---
type: "Topic"
title: "PraisonAI code tools workspace fail-open"
description: "Security analysis for CVE-2026-56839 PraisonAI code tools skipping containment when workspace roots are missing."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# PraisonAI code tools workspace fail-open

## Current Understanding

The [September 14 topic collector source](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json) records [CVE-2026-56839](https://cveawg.mitre.org/api/cve/CVE-2026-56839) for PraisonAI before 4.6.59. Broad coding-agent workflow context belongs upstream; this page owns the local workspace-root fail-closed boundary for code tools.

The CVE says PraisonAI passed `workspace=None` to `code_read_file`, `code_search_replace`, and `code_apply_diff` helper paths. Containment checks only ran when a workspace value was truthy, so missing workspace state became a fail-open path for file access and mutation.

## Security Impact

- Threat: prompt-influenced code tools can reach unintended files when workspace containment is disabled by absent state.
- Affected boundary: PraisonAI before 4.6.59, `CODE_TOOLS` wrappers, read/search-replace/apply-diff helpers, and workspace-root enforcement.
- Exploit or incident status: public CVE and GitHub advisory evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade PraisonAI to 4.6.59 or later and make missing workspace roots deny file operations instead of bypassing containment.
- Confidence: high because the direct CVE, GitHub advisory, patch, and release evidence align on the fail-open workspace boundary.
- Residual risk: agent tool wrappers should treat absent authority context as a hard error; permissive defaults can bypass otherwise sound path checks.

## Authoritative Sources

- [September 14 topic collector source](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json)
- [CVE-2026-56839 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-56839)
- [GitHub advisory GHSA-gcq3-mfvh-3x25](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-gcq3-mfvh-3x25)
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

- Which PraisonAI execution modes can initialize code tools without a workspace root, and are existing sessions invalidated after upgrade?

## Maintenance Notes

- Created on 2026-09-15 from the [September 14 topic collector](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json) as a fail-closed workspace containment leaf.
