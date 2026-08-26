---
type: "Topic"
title: "Continue CLI Unattended Command Denylist Bypass"
description: "Security analysis for CVE-2026-76072 destructive-command denylist bypass in Continue CLI unattended and auto modes."
tags: ["agent-and-tool-security", "testing-and-assurance"]
---

# Continue CLI Unattended Command Denylist Bypass

## Current Understanding

The [August 25 topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T183709Z.json) records [CVE-2026-76072](https://nvd.nist.gov/vuln/detail/CVE-2026-76072) for Continue CLI headless and auto modes. Broad Continue CLI developer-tool coverage belongs upstream in the AI development wiki; this page owns the local security boundary where a coding agent receives shell authority without a fail-closed command policy.

[NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-76072) and [VulnCheck](https://www.vulncheck.com/advisories/continue-cli-through-incomplete-destructive-command-denylist-in-headless-and-auto-mode) evidence describe unattended/headless execution granting Bash allow permission while blocking only command forms recognized by an incomplete destructive-command evaluator. Crafted command syntax can bypass the intended destructive-command barrier, so the risk is not just one dangerous command but a parser-policy mismatch in non-interactive agent execution.

## Security Impact

- Threat: a coding agent running in unattended or auto mode can execute destructive shell operations when denylist parsing misses an equivalent command form.
- Affected boundary: Continue CLI headless mode and auto mode; NVD records CVSS 3.1 HIGH 7.4 and CWE-184.
- Exploit or incident status: disclosed vulnerability advisory; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: exact fixed version is not yet confirmed in local evidence; disable unattended shell authority or require explicit allowlisted command templates until patched.
- Confidence: high for advisory existence and class from NVD/VulnCheck; medium for patched-state detail until upstream release evidence is captured.
- Residual risk: denylist-based command controls remain brittle for AI agents because the model or prompt-injected context can vary shell syntax faster than string filters cover it.

## Control Implications

- Prefer structured command policies, argument schemas, and sandboxed execution over destructive-command denylists.
- Treat unattended and auto modes as higher-risk release gates because they remove the human checkpoint that would otherwise catch unexpected shell intent.
- Log mode, delegated user, command template, parsed argv, raw shell string, policy decision, and working directory for incident reconstruction.

## Authoritative Sources

- [August 25 topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T183709Z.json)
- [NVD CVE-2026-76072](https://nvd.nist.gov/vuln/detail/CVE-2026-76072)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/continue-cli-through-incomplete-destructive-command-denylist-in-headless-and-auto-mode)
- [Continue issue reference](https://github.com/continuedev/continue/issues/13001)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [coding agent command approval boundaries](coding-agent-command-approval-boundaries.md)
- [local agent execution and processing boundaries](local-agent-execution-and-processing-boundaries.md)

## Open Questions

- Which Continue CLI release first fixes CVE-2026-76072, and does it replace denylist matching with structured command authorization?

## Maintenance Notes

- Created on 2026-08-26 from the [August 25 topic collector](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T183709Z.json) after routing broad Continue CLI workflow coverage upstream.
