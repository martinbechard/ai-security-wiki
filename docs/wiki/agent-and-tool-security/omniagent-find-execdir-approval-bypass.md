---
type: "Topic"
title: "OmniAgent find -execdir Approval Bypass"
description: "Security analysis of CVE-2026-125368, where OmniAgent's shallow find allowlist can bypass the bash approval gate."
tags: ["agent-and-tool-security", "model-and-prompt-security", "identity-and-access"]
---

# OmniAgent find -execdir Approval Bypass

## Current Understanding

[CVE-2026-125368](https://www.tenable.com/cve/CVE-2026-125368), recorded in the [November 10 collector source](../../../raw/processed/2026-11-10/ai-security-wiki-topic-news-collector-2026-11-10T193250-0500.json), describes an OmniAgent bash approval-gate bypass through `find -execdir`. Broad OmniAgent and coding-agent workflow coverage belongs upstream in the AI development wiki; this leaf owns the prompt-influenced command-approval and execution-containment boundary.

The disclosed commit [12b98c5](https://github.com/YeQing17-2026/OmniAgent/blob/12b98c520959eff88a6cfa3dd233497084360ab0/omniagent/agents/reflexion.py#L1379) treats commands beginning with `find` as safe without interpreting `-execdir` arguments. The public [project issue](https://github.com/YeQing17-2026/OmniAgent/issues/67) says a prompt-injected agent can use that primitive to execute binaries without the advertised human-approval step. This is a delegated-authority failure: a command-name allowlist does not establish the safety of compound command semantics.

## Security Impact

- Threat: prompt-influenced tool input can execute a binary without the intended human-approval boundary.
- Affected boundary: OmniAgent through commit `12b98c520959eff88a6cfa3dd233497084360ab0`, especially ReflexionAgent bash execution with the approval gate enabled.
- Exploit or incident status: public CVE record, project issue, and implicated source revision; prompt injection is a stated exploitation precondition, not a confirmed in-the-wild campaign.
- Mitigation state: no fixed release or maintainer remediation is identified. Disable compound-command auto-approval or parse command semantics before approval, sandbox the execution runtime, and test negative approval paths.
- Confidence: medium-high because the public CVE, issue, and pinned source revision agree; the issue remains open and independent reproduction or maintainer confirmation is not recorded.
- Residual risk: any policy that approves a shell primitive from its leading token can be bypassed by execution-capable arguments or nested command features.

## Authoritative Sources

- [November 10 collector source](../../../raw/processed/2026-11-10/ai-security-wiki-topic-news-collector-2026-11-10T193250-0500.json)
- [CVE-2026-125368](https://www.tenable.com/cve/CVE-2026-125368)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/omniagent-bash-approval-gate-bypass-via-find-execdir-in-safe-command-allowlist)
- [OmniAgent issue 67](https://github.com/YeQing17-2026/OmniAgent/issues/67)
- [Implicated OmniAgent source revision](https://github.com/YeQing17-2026/OmniAgent/blob/12b98c520959eff88a6cfa3dd233497084360ab0/omniagent/agents/reflexion.py#L1379)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [coding agent command approval boundaries](coding-agent-command-approval-boundaries.md)
- [PraisonAI ast_grep_rewrite approval bypass](praisonai-ast-grep-rewrite-approval-bypass.md)

## Open Questions

- Does the current default branch still contain the shallow `find` classifier?
- Which maintainer release, if any, fixes CVE-2026-125368?

## Maintenance Notes

- Created on 2026-11-10 from the November 10 collector source. This page preserves the security control boundary without duplicating general OmniAgent workflow coverage.
