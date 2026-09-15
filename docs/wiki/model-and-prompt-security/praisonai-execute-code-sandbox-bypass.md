---
type: "Topic"
title: "PraisonAI execute_code sandbox bypass"
description: "Security analysis for CVE-2026-57120 str.format dunder access bypassing PraisonAI execute_code sandbox controls."
tags: ["model-and-prompt-security", "agent-and-tool-security"]
---

# PraisonAI execute_code sandbox bypass

## Current Understanding

The [September 14 topic collector source](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json) records [CVE-2026-57120](https://cveawg.mitre.org/api/cve/CVE-2026-57120) for `praisonaiagents` before 1.6.59. Broad PraisonAI framework context belongs upstream; this page owns the local prompt-to-code sandbox containment boundary.

The CVE, GitHub advisory, patch, and release evidence say `execute_code` sandbox mode could assemble blocklisted dunder names at runtime and use `str.format` or `str.format_map` dotted-field access to bypass `_safe_getattr`. The weakness matters because LLM-controlled code snippets can reconstruct forbidden object access paths even when string filters block obvious tokens.

## Security Impact

- Threat: prompt-influenced code can bypass syntactic sandbox filters and regain unsafe Python object access.
- Affected boundary: `praisonaiagents` before 1.6.59, `execute_code` sandbox mode, dunder-name filtering, `str.format`, and `str.format_map`.
- Exploit or incident status: public CVE and GitHub advisory evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade `praisonaiagents` to 1.6.59 or later and treat formatting APIs as object traversal surfaces inside sandboxes.
- Confidence: high because the direct CVE and upstream advisory align on affected component, bypass mechanism, patch, and release.
- Residual risk: sandbox controls that rely on token blocklists remain brittle against semantic object access, generated strings, and library features that perform attribute traversal.

## Authoritative Sources

- [September 14 topic collector source](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json)
- [CVE-2026-57120 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-57120)
- [GitHub advisory GHSA-pv2j-rghr-v5r9](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-pv2j-rghr-v5r9)
- [PraisonAI patch commit](https://github.com/MervinPraison/PraisonAI/commit/2adfe7e8323f6deec66925cf15a885b6238895e9)
- [PraisonAI 4.6.59 release](https://github.com/MervinPraison/PraisonAI/releases/tag/v4.6.59)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [PraisonAI ast_grep_rewrite approval bypass](../agent-and-tool-security/praisonai-ast-grep-rewrite-approval-bypass.md)
- [ToolUniverse Python executor sandbox escape](../agent-and-tool-security/tooluniverse-python-executor-sandbox-escape.md)

## Open Questions

- Which Python formatting or reflection APIs remain reachable in PraisonAI code-execution flows after the 1.6.59 sandbox changes?

## Maintenance Notes

- Created on 2026-09-15 from the [September 14 topic collector](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json) as a prompt-to-code sandbox bypass leaf.
