---
type: "Topic"
title: "Skyvern TextPromptBlock Jinja Sandbox Escape"
description: "Security analysis for CVE-2026-82447 Skyvern prompt-template double rendering and server-side code execution."
tags: ["agent-and-tool-security", "model-and-prompt-security"]
---

# Skyvern TextPromptBlock Jinja Sandbox Escape

## Current Understanding

The [August 30 topic collector source](../../../raw/processed/2026-08-30/ai-security-wiki-topic-news-collector-2026-08-30T233055Z.json) records [CVE-2026-82447](https://nvd.nist.gov/vuln/detail/CVE-2026-82447) for Skyvern before 1.0.45. Broad Skyvern product and browser automation context belongs upstream; this page owns the local prompt-template execution boundary.

NVD and the [VulnCheck advisory](https://www.vulncheck.com/advisories/skyvern-before-1.0.45-sandbox-escape-via-textpromptblock) describe `TextPromptBlock` prompt content rendered first through a sandboxed Jinja environment and then through an unsandboxed environment. Workflow parameters or upstream block output could inject Jinja syntax and execute code with the server process privileges. The collector cites the [patch commit](https://github.com/Skyvern-AI/skyvern/commit/d723de621d5b3a340f3cc4d5b46bfe40a9a3124e) as primary remediation evidence.

## Security Impact

- Threat: prompt or workflow data can become server-side template code when a second render crosses from sandboxed to unsandboxed Jinja.
- Affected boundary: Skyvern versions from 0.2.1 through before 1.0.45 according to the collector's VulnCheck evidence; NVD records Skyvern before 1.0.45.
- Exploit or incident status: public vulnerability disclosure; no local incident is recorded.
- Mitigation state: upgrade to 1.0.45 or later, avoid second-pass rendering of model- or user-influenced prompt blocks, and test template syntax injection through workflow parameters and block output.
- Confidence: high for vulnerability identity, affected boundary, and patch evidence because NVD, VulnCheck, repository, and commit evidence align.
- Residual risk: browser-agent workflow builders can hide executable template boundaries inside prompt composition, so prompt security review must include rendering engines and server privilege context.

## Control Implications

- Treat prompt templates as code-adjacent input when they pass through templating engines.
- Ban unsandboxed second rendering for model output, user parameters, and upstream block output.
- Add tests that inject template syntax through every prompt block input channel.

## Authoritative Sources

- [August 30 topic collector source](../../../raw/processed/2026-08-30/ai-security-wiki-topic-news-collector-2026-08-30T233055Z.json)
- [NVD CVE-2026-82447](https://nvd.nist.gov/vuln/detail/CVE-2026-82447)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/skyvern-before-1.0.45-sandbox-escape-via-textpromptblock)
- [Skyvern patch commit](https://github.com/Skyvern-AI/skyvern/commit/d723de621d5b3a340f3cc4d5b46bfe40a9a3124e)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [model and prompt security](../model-and-prompt-security/index.md)
- [Agno Python and Shell tools prompt-injection RCE](agno-python-shell-tools-prompt-injection-rce.md)

## Open Questions

- Which Skyvern workflow inputs can still carry user- or model-controlled template syntax after the 1.0.45 fix?

## Maintenance Notes

- Created on 2026-08-30 from the [August 30 topic collector](../../../raw/processed/2026-08-30/ai-security-wiki-topic-news-collector-2026-08-30T233055Z.json) as a prompt-template execution leaf rather than a broad Skyvern product page.
