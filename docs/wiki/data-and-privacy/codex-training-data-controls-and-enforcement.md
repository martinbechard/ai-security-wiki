---
type: "Topic"
title: "Codex Training Data Controls And Enforcement"
description: "Security-control lens for OpenAI Codex training-use settings, workspace policy domains, and authentication enforcement."
tags: ["data-and-privacy"]
---

# Codex Training Data Controls And Enforcement

## Current Understanding

The [Codex training data controls research](../../../raw/project-wiki-research-2026-07-30-codex-training-data-controls.md) distinguishes model-training use from retention, telemetry, feedback, local transcripts, and abuse-monitoring logs. Broad [OpenAI Codex](../../../upstream-ai-wiki/developer-tools/openai-codex.md) product coverage stays upstream; this page owns the local security control for proving which OpenAI account, ChatGPT workspace, or API organization owns the no-training decision used by Codex.

For personal ChatGPT Free, Plus, and Pro use, the training choice is an OpenAI account-level data-control setting, not a local Codex project setting. The research records that the account-wide self-service control is mutable, while the Privacy Portal route is described as a permanent opt-out request. The reviewed sources do not explain the internal record, reversal behavior, or whether a personal account exposes an immutable audit log for this preference.

For managed ChatGPT Business, Enterprise, and Edu workspaces, training use is governed by workspace and service policy. Enterprise is the strongest documented route in the research because OpenAI states no training on customer data for Codex Enterprise and API voluntary sharing is unavailable to Enterprise customers. Business and Edu still require administrator and contractual evidence because managed-account sources say administrators may control data settings where the workspace configuration permits it.

For API-key authentication, the training decision belongs to the OpenAI Platform organization or selected projects. API inputs and outputs are not used for model training by default unless sharing is explicitly enabled, but that is not the same as zero retention; default abuse-monitoring logs may retain customer content for a limited period.

Codex local configuration does not independently turn provider model training off. Managed authentication can reduce accidental policy drift by forcing Codex to use the approved control plane:

```toml
forced_login_method = "chatgpt"
forced_chatgpt_workspace_id = "<approved-workspace-uuid>"
```

or:

```toml
forced_login_method = "api"
```

These settings enforce which account or organization Codex uses; they do not create the no-training promise by themselves.

## Control Implications

- Record the selected Codex authentication route and the account, workspace, organization, or project that owns training-use policy.
- For personal use, check both the ChatGPT account training control and the separate Codex full-environment sharing control when that setting is available.
- Retain Privacy Portal or account-setting evidence, but do not claim a personal immutable audit trail unless OpenAI documents one.
- Prefer Enterprise or an approved API organization for organization-controlled use when accidental personal-account drift is unacceptable.
- Use managed `forced_login_method`; add `forced_chatgpt_workspace_id` for approved ChatGPT workspaces.
- Keep training-use, retention, telemetry, feedback, local transcript, and abuse-monitoring controls as separate assurance checks.
- Avoid explicit product feedback on sensitive Codex conversations because the research records that feedback can separately authorize associated conversation use.

## Authoritative Sources

- [Codex training data controls research](../../../raw/project-wiki-research-2026-07-30-codex-training-data-controls.md)
- OpenAI Help Center Data Controls FAQ: https://help.openai.com/en/articles/7730893-data-controls-faq
- OpenAI Help Center model-improvement data use: https://help.openai.com/en/articles/5722486-how-your-data-is-used-to-improve-model-performance
- OpenAI Help Center Codex with ChatGPT plan: https://help.openai.com/en/articles/11369540-using-codex-with-your-chatgpt-plan
- OpenAI Platform data controls: https://platform.openai.com/docs/guides/your-data
- OpenAI Codex authentication documentation: https://learn.chatgpt.com/docs/auth
- OpenAI Help Center Enterprise Codex guide: https://help.openai.com/en/articles/11390924

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [AI development context exclusion controls](ai-development-context-exclusion-controls.md)
- [development agent credential isolation](../identity-and-access/development-agent-credential-isolation.md)
- [local agent execution and processing boundaries](../agent-and-tool-security/local-agent-execution-and-processing-boundaries.md)
- Upstream AI wiki owns broad [OpenAI Codex](../../../upstream-ai-wiki/developer-tools/openai-codex.md) product coverage.

## Open Questions

- How does OpenAI represent Privacy Portal permanent opt-out requests internally, and can they be reversed?
- Which audit event or export, if any, proves a personal ChatGPT training-control state at a point in time?
- Where exactly is the separate Codex full-environment sharing control exposed, and what content boundary does it cover?

## Maintenance Notes

- Created on 2026-07-30 from the [Codex training data controls research](../../../raw/project-wiki-research-2026-07-30-codex-training-data-controls.md); keep this page limited to Codex security-control assurance and route broad product behavior to the upstream AI wiki.
