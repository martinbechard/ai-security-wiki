---
type: "Topic"
title: "Mistral Vibe Command Permission-Gate Bypass"
description: "Security analysis for CVE-2026-109429, where shell parsing gaps can bypass Mistral Vibe command permission gates."
tags: ["agent-and-tool-security"]
---

# Mistral Vibe Command Permission-Gate Bypass

## Current Understanding

The [October 13 topic collector source](../../../raw/processed/2026-10-13/ai-security-wiki-topic-news-collector-2026-10-13T232603Z.json) records [CVE-2026-109429](https://nvd.nist.gov/vuln/detail/CVE-2026-109429) for Mistral Vibe before 2.25.4. General coding-agent command approval workflow belongs upstream in ai-dev-wiki; this page owns the shell command-gate bypass mechanics.

The CVE evidence says attackers can hide command substitution inside a single-quoted variable value that static `tree-sitter-bash` parsing does not detect. Bash prompt-transform behavior can later re-expand the payload while only the trailing allowlisted command is classified.

## Security Impact

- Threat: prompt-injected shell text can execute denied behavior while an approval gate classifies only an allowed suffix.
- Affected boundary: Mistral Vibe before 2.25.4, shell command permission classification, `tree-sitter-bash` parsing, and bash prompt variable expansion.
- Exploit or incident status: public CVE record; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to 2.25.4 or later and classify the command the shell will actually execute.
- Confidence: high for affected range and bypass mechanics from NVD/CVE evidence.
- Residual risk: static parser approval gates remain brittle when shell runtime expansion has more behavior than the classifier models.

## Control Implications

- Evaluate shell commands under a constrained execution model rather than trusting parsed allowlisted prefixes.
- Deny command substitution, prompt-variable expansion, and mixed quoting patterns unless explicitly modeled.
- Regression-test approval gates with variable assignment, quoting, globbing, and command-substitution payloads.

## Authoritative Sources

- [October 13 topic collector source](../../../raw/processed/2026-10-13/ai-security-wiki-topic-news-collector-2026-10-13T232603Z.json)
- [NVD CVE-2026-109429](https://nvd.nist.gov/vuln/detail/CVE-2026-109429)
- [CVE Services CVE-2026-109429](https://cveawg.mitre.org/api/cve/CVE-2026-109429)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [mac-shell-mcp command whitelist bypass](mac-shell-mcp-command-whitelist-bypass.md)
- [Roo Code command approval bypass cluster](roo-code-command-approval-bypass-cluster.md)

## Open Questions

- Does Mistral Vibe 2.25.4 replace static parsing, restrict shell features, or add runtime command normalization before approval?

## Maintenance Notes

- Created on 2026-10-14 from the October 13 topic collector as a shell-parser command-gate bypass leaf.
