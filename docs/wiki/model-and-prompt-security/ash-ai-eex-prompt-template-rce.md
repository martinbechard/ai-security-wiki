---
type: "Topic"
title: "ash_ai EEx Prompt Template RCE"
description: "Security analysis for CVE-2026-77956 ash_ai prompt construction evaluating user-controlled EEx."
tags: ["model-and-prompt-security", "agent-and-tool-security"]
---

# ash_ai EEx Prompt Template RCE

## Current Understanding

The [August 31 topic collector source](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json) records [CVE-2026-77956](https://nvd.nist.gov/vuln/detail/CVE-2026-77956) for ash_ai from 0.1.0 before 1.0.0. Broad Ash Framework and ash_ai framework coverage belongs upstream; this page owns the local prompt-templating execution boundary.

NVD and the linked [GitHub Security Advisory](https://github.com/ash-project/ash_ai/security/advisories/GHSA-2g59-hg7m-qc83) describe user-controlled prompt text being evaluated as EEx. The security issue is not simply prompt injection as bad instructions; it is prompt text crossing into server-side Elixir template execution.

## Security Impact

- Threat: prompt text built from user input can execute arbitrary Elixir code when the prompt construction path evaluates EEx.
- Affected boundary: ash_ai 0.1.0 through before 1.0.0.
- Exploit or incident status: public CVE and GitHub advisory; no local incident is recorded.
- Mitigation state: upgrade to ash_ai 1.0.0 or later and remove EEx evaluation from user- or model-influenced prompt text.
- Confidence: high for advisory identity and affected range from NVD and the project advisory reference.
- Residual risk: prompt-template engines need code-review and tests as executable surfaces, not only prompt-quality review.

## Control Implications

- Treat prompt templates as code-adjacent inputs when they use EEx, Jinja, Liquid, or another evaluator.
- Add negative tests that place template delimiters in user text, retrieved context, tool output, and generated prompt fragments.
- Separate static system prompt templates from runtime prompt variables before model calls.

## Authoritative Sources

- [August 31 topic collector source](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json)
- [NVD CVE-2026-77956](https://nvd.nist.gov/vuln/detail/CVE-2026-77956)
- [GitHub Security Advisory GHSA-2g59-hg7m-qc83](https://github.com/ash-project/ash_ai/security/advisories/GHSA-2g59-hg7m-qc83)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [Skyvern TextPromptBlock Jinja sandbox escape](../agent-and-tool-security/skyvern-textpromptblock-jinja-sandbox-escape.md)

## Open Questions

- Which ash_ai prompt APIs accepted EEx-evaluated user text before 1.0.0?

## Maintenance Notes

- Created on 2026-08-31 from the [August 31 topic collector](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json) as a prompt-template execution leaf separate from the ash_ai tool-loop and MCP-origin advisories.
