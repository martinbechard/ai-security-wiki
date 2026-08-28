---
type: "Topic"
title: "Strands Agents Tools Python REPL Consent Bypass"
description: "Security analysis for CVE-2026-78379 nested tool invocation bypassing python_repl human consent."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# Strands Agents Tools Python REPL Consent Bypass

## Current Understanding

CVE-2026-78379 affects Amazon Strands Agents Tools before 0.8.5 and crosses the local consent-gate and nested tool-dispatch boundary. Broad Strands Agents and AWS framework context belongs upstream. The [August 26 topic news collector source](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json) and [August 27 leaf update watch source](../../../raw/processed/2026-08-27/ai-security-wiki-leaf-update-watch-20260828T000238Z.json) provide the current evidence.

The exploit path is a nested tool-call consent bypass:

- A crafted prompt can forward `non_interactive_mode` through the batch tool as a keyword argument.
- The forwarded flag can cause `python_repl` to execute Python on the agent host without the intended human approval.
- The affected boundary is Amazon Strands Agents Tools before 0.8.5, with upgrade to 0.8.5 or later recorded as the remediation.

This is a concrete advisory instance of the reusable [agent action runtime hooks](agent-action-runtime-hooks.md) and [coding agent command approval boundaries](coding-agent-command-approval-boundaries.md) rule: consent checks must sit at the execution edge, not only at the first model-visible tool entry point.

## Security Impact

- Threat: model-controlled or prompt-influenced nested tool arguments can disable human approval and execute code on the agent host.
- Affected boundary: `strands-agents-tools` before 0.8.5; batch tool argument forwarding; `python_repl`; human consent and code-execution controls.
- Exploit or incident status: public AWS bulletin and NVD evidence; no local incident evidence is recorded.
- Mitigation state: upgrade `strands-agents-tools` to 0.8.5 or later and enforce consent at every code-executing tool regardless of caller tool.
- Confidence: high for affected version and consent-bypass description from AWS/NVD evidence in the source.
- Residual risk: tool bundles that let one tool invoke another can bypass approval if the callee trusts caller-supplied mode flags.

## Authoritative Sources

- [August 27 leaf update watch source](../../../raw/processed/2026-08-27/ai-security-wiki-leaf-update-watch-20260828T000238Z.json)
- [CVE-2026-78379 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-78379)
- [August 26 topic news collector source](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json)
- [NVD CVE-2026-78379](https://nvd.nist.gov/vuln/detail/CVE-2026-78379)
- [AWS security bulletin](https://aws.amazon.com/security/security-bulletins/rss/2026-089-aws/)
- [strands-agents-tools 0.8.5](https://pypi.org/project/strands-agents-tools/0.8.5/)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent action runtime hooks](agent-action-runtime-hooks.md)
- [coding agent command approval boundaries](coding-agent-command-approval-boundaries.md)
- Upstream AI wiki owns broad [Strands Agents](../../../upstream-ai-wiki/agentic-frameworks/strands-agents.md) context.

## Open Questions

- Does CVE-2026-78379 affect only `strands-agents-tools`, or are adjacent Strands Agents SDK tool-dispatch patterns also vulnerable without the tool package?

## Maintenance Notes

- Updated on 2026-08-28 with August 27 leaf-update evidence for CVE-2026-78379.
- Created on 2026-08-27 from the [August 26 topic collector](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json) as a nested execution-tool approval boundary leaf.
