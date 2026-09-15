---
type: "Topic"
title: "PraisonAI multiedit file boundary bypass"
description: "Security analysis for CVE-2026-57145 LLM-controlled PraisonAI multiedit file read and write without workspace containment."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security", "data-and-privacy"]
---

# PraisonAI multiedit file boundary bypass

## Current Understanding

The [September 14 topic collector source](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json) records [CVE-2026-57145](https://cveawg.mitre.org/api/cve/CVE-2026-57145) for PraisonAI before 4.6.62. Broad code-editing workflow context belongs upstream; this page owns the local LLM-directed file mutation boundary.

The CVE says the multiedit tool passed an LLM-controlled filepath directly to reads and writes without traversal rejection, symlink resolution, workspace checks, or protected-path checks. That makes model-influenced editing authority broader than the intended project workspace.

## Security Impact

- Threat: LLM-directed editing can read or modify arbitrary host files when filepath authority is unchecked.
- Affected boundary: PraisonAI before 4.6.62, multiedit file reads and writes, traversal handling, symlink resolution, workspace roots, and protected paths.
- Exploit or incident status: public CVE, GitHub advisory, patch, and release evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade PraisonAI to 4.6.62 or later and require canonical workspace-boundary checks before reads and writes.
- Confidence: high because the direct CVE and upstream advisory align on the filepath boundary and fixed release.
- Residual risk: edit tools need explicit authority separation between suggested patch content and filesystem target selection, because both can be influenced by model output.

## Authoritative Sources

- [September 14 topic collector source](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json)
- [CVE-2026-57145 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-57145)
- [GitHub advisory GHSA-29w3-p9w9-wc47](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-29w3-p9w9-wc47)
- [PraisonAI patch commit](https://github.com/MervinPraison/PraisonAI/commit/2a855c470077c7d2e2479a575f7ef7f548d51c33)
- [PraisonAI 4.6.62 release](https://github.com/MervinPraison/PraisonAI/releases/tag/v4.6.62)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [Agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)
- [PraisonAI file mention path traversal](praisonai-file-mention-path-traversal.md)
- [PraisonAI code tools workspace fail-open](praisonai-code-tools-workspace-fail-open.md)

## Open Questions

- Which protected paths does PraisonAI 4.6.62 deny by default, and can projects extend that denylist?

## Maintenance Notes

- Created on 2026-09-15 from the [September 14 topic collector](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json) as an LLM-directed edit authority leaf.
