---
type: "Topic"
title: "PraisonAI ast_grep_rewrite Approval Bypass"
description: "Security analysis for CVE-2026-55530 missing approval enforcement on PraisonAI file mutation tooling."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# PraisonAI ast_grep_rewrite Approval Bypass

## Current Understanding

CVE-2026-55530 maps to [GHSA-cfxv-8fw8-rwpv](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-cfxv-8fw8-rwpv) and affects `praisonaiagents` before 1.6.58. Broad PraisonAI framework context belongs upstream; this page owns the local file-mutation approval boundary. The [August 26 leaf update watch source](../../../raw/processed/2026-08-26/ai-security-wiki-leaf-update-watch-20260827T000538Z.json) and [August 27 leaf update watch source](../../../raw/processed/2026-08-27/ai-security-wiki-leaf-update-watch-20260828T000238Z.json) provide the current evidence.

The advisory is distinct from authentication and SSRF because it concerns a mutation tool that should require human approval before an agent rewrites files. `ast_grep_rewrite` lacks the `@require_approval` decorator used by sibling mutation tools; with `dry_run=False`, an agent-controlled call can pass `--update-all` and a broad path to rewrite matching files without the expected authorization gate. It belongs near [approval metadata access control](approval-metadata-access-control.md), [coding agent command approval boundaries](coding-agent-command-approval-boundaries.md), and [agent action runtime hooks](agent-action-runtime-hooks.md): approval needs to be enforced by the tool runtime, not only encoded in tool descriptions or caller intent.

## Security Impact

- Threat: an agent can invoke a file rewrite tool without the approval gate expected for project mutation.
- Affected boundary: `praisonaiagents` before 1.6.58; `ast_grep_rewrite`; `@require_approval`; file mutation tools.
- Exploit or incident status: public CVE/GitHub advisory mapping; no local exploitation incident is recorded.
- Mitigation state: upgrade `praisonaiagents` to 1.6.58 or later and test all mutating tools for runtime approval enforcement.
- Confidence: high for mapping and fixed-version evidence from the August 26 watcher and GHSA page.
- Residual risk: approval decorators and metadata can drift from actual tool behavior unless automated tests exercise negative approval paths.

## Authoritative Sources

- [August 27 leaf update watch source](../../../raw/processed/2026-08-27/ai-security-wiki-leaf-update-watch-20260828T000238Z.json)
- [CVE-2026-55530 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-55530)
- [August 26 leaf update watch source](../../../raw/processed/2026-08-26/ai-security-wiki-leaf-update-watch-20260827T000538Z.json)
- [GHSA-cfxv-8fw8-rwpv](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-cfxv-8fw8-rwpv)
- [CVE-2026-55530 record](https://cveawg.mitre.org/api/cve/CVE-2026-55530)
- [PraisonAI 4.6.58 release](https://github.com/MervinPraison/PraisonAI/releases/tag/v4.6.58)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [approval metadata access control](approval-metadata-access-control.md)
- [coding agent command approval boundaries](coding-agent-command-approval-boundaries.md)
- [agent action runtime hooks](agent-action-runtime-hooks.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Updated on 2026-08-28 with August 27 leaf-update evidence for CVE-2026-55530.
- Created on 2026-08-27 from the [August 26 leaf watcher](../../../raw/processed/2026-08-26/ai-security-wiki-leaf-update-watch-20260827T000538Z.json) after verifier correction split resolved PraisonAI mutation-approval evidence into a focused leaf.
