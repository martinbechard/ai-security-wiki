---
type: "Topic"
title: "SumatraPDF AI Selection Translate CLI Argument Injection"
description: "Security analysis for CVE-2026-107802 untrusted document text crossing into Grok, Claude, or Codex CLI arguments."
tags: ["agent-and-tool-security", "model-and-prompt-security"]
---

# SumatraPDF AI Selection Translate CLI Argument Injection

## Current Understanding

The [October 9 topic collector source](../../../raw/processed/2026-10-09/ai-security-wiki-topic-news-collector-2026-10-09T233308Z.json) records [CVE-2026-107802](https://cveawg.mitre.org/api/cve/CVE-2026-107802) for SumatraPDF 3.6.1 and earlier. Broad SumatraPDF and provider CLI context belongs upstream; this page owns the local desktop AI integration boundary where selected or pasted document text becomes command-line arguments for agentic CLI backends.

The [CVE record](https://cveawg.mitre.org/api/cve/CVE-2026-107802) and [GitHub advisory](https://github.com/sumatrapdfreader/sumatrapdf/security/advisories/GHSA-xvxg-cwmx-hr7j) say the Windows AI selection-translate path embeds untrusted text in quoted command lines using incomplete escaping. The affected `BuildGrokTranslateCmdLineTemp()`, `BuildClaudeTranslateCmdLineTemp()`, and `BuildCodexTranslateCmdLineTemp()` functions can allow attacker-controlled document text to inject model, working-directory, approval, or sandbox-bypass flags when the corresponding CLI backend is installed and used.

## Security Impact

- Threat: malicious document text can alter the execution policy of an installed agentic CLI instead of remaining translation input.
- Affected boundary: SumatraPDF 3.6.1 and earlier on Windows, AI selection translate, Grok/Claude/Codex CLI command construction, selected or pasted document text, working-directory flags, approval flags, and sandbox flags.
- Exploit or incident status: public CVE Services and GitHub Security Advisory evidence; no confirmed exploitation incident is recorded locally.
- Mitigation state: no fixed release is recorded locally; construct processes with structured argument arrays, pass user text through stdin or a data file, and isolate CLI policy flags from document-controlled content.
- Confidence: high for affected functions and issue class from CVE Services; medium for remediation state until a fixed release is identified.
- Residual risk: desktop document-to-agent workflows need explicit separation between untrusted content and agent runtime configuration.

## Authoritative Sources

- [October 9 topic collector source](../../../raw/processed/2026-10-09/ai-security-wiki-topic-news-collector-2026-10-09T233308Z.json)
- [CVE-2026-107802 record](https://cveawg.mitre.org/api/cve/CVE-2026-107802)
- [GHSA-xvxg-cwmx-hr7j](https://github.com/sumatrapdfreader/sumatrapdf/security/advisories/GHSA-xvxg-cwmx-hr7j)
- [SumatraPDF patch commit](https://github.com/sumatrapdfreader/sumatrapdf/commit/6b88a751ab34a28bafca3bdd635aaa2f4c1e06b6)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [model and prompt security](../model-and-prompt-security/index.md)
- [coding agent command approval boundaries](coding-agent-command-approval-boundaries.md)

## Open Questions

- Which SumatraPDF release includes the argument-separation fix for AI selection translate, and does it cover all configured CLI providers?

## Maintenance Notes

- Created on 2026-10-10 from the [October 9 topic collector source](../../../raw/processed/2026-10-09/ai-security-wiki-topic-news-collector-2026-10-09T233308Z.json) as a document-text-to-agentic-CLI boundary.
