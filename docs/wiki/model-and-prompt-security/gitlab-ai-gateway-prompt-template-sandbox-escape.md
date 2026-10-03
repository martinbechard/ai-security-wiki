---
type: "Topic"
title: "GitLab AI Gateway Prompt Template Sandbox Escape"
description: "Security analysis for CVE-2026-90970 template-engine sandbox escape through Duo Agent Platform flow configuration."
tags: ["model-and-prompt-security", "agent-and-tool-security"]
---

# GitLab AI Gateway Prompt Template Sandbox Escape

## Current Understanding

The [October 2 topic collector source](../../../raw/processed/2026-10-02/ai-security-wiki-topic-news-collector-2026-10-02T233227Z.json) records [CVE-2026-90970](https://cveawg.mitre.org/api/cve/CVE-2026-90970) for GitLab AI Gateway. Broad GitLab and Duo Agent Platform product context belongs upstream; this page owns the local prompt-template sandbox and flow-configuration execution boundary.

The CVE record says AI Gateway versions 18.1.6 before 19.2.4, 19.3 before 19.3.2, and 19.4 before 19.4.1 allowed an authenticated user with Duo Agent Platform access to escape the prompt template sandbox through a crafted flow configuration. The stated result is arbitrary command execution on the AI Gateway.

## Security Impact

- Threat: agent-platform flow configuration can cross from prompt-template customization into command execution when template-engine sandboxing is incomplete.
- Affected boundary: GitLab AI Gateway 18.1.6 before 19.2.4, 19.3 before 19.3.2, and 19.4 before 19.4.1; Duo Agent Platform access; flow configuration; prompt template sandbox.
- Exploit or incident status: public CVE record; no confirmed exploitation incident is recorded locally.
- Mitigation state: upgrade to 19.2.4, 19.3.2, 19.4.1, or later as applicable, and treat template configuration as code-adjacent input requiring sandbox, allow-list, and execution-environment tests.
- Confidence: high for affected ranges and fixed versions from the GitLab CVE record.
- Residual risk: AI gateways often mix prompt rendering, tool routing, credentials, and model calls, so template escapes can become infrastructure compromise rather than only prompt manipulation.

## Authoritative Sources

- [October 2 topic collector source](../../../raw/processed/2026-10-02/ai-security-wiki-topic-news-collector-2026-10-02T233227Z.json)
- [CVE-2026-90970 record](https://cveawg.mitre.org/api/cve/CVE-2026-90970)
- [NVD CVE-2026-90970](https://nvd.nist.gov/vuln/detail/CVE-2026-90970)
- [GitLab work item 628842](https://gitlab.com/gitlab-org/gitlab/-/work_items/628842)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [Open GenAI Stack Jinja prompt injection RCE](open-genai-stack-jinja-prompt-injection-rce.md)
- [Skyvern TextPromptBlock Jinja sandbox escape](../agent-and-tool-security/skyvern-textpromptblock-jinja-sandbox-escape.md)
- Upstream AI wiki owns broad GitLab and Duo product context.
- Upstream AI development wiki owns general Duo Agent Platform workflow practice.

## Open Questions

- Which GitLab security-release note or work item detail explains the exact template-engine escape primitive and any required Duo Agent Platform permissions?

## Maintenance Notes

- Created on 2026-10-03 from the [October 2 topic collector source](../../../raw/processed/2026-10-02/ai-security-wiki-topic-news-collector-2026-10-02T233227Z.json) as a prompt-template sandbox boundary rather than broad GitLab product coverage.
