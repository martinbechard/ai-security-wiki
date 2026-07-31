# Project Wiki Research: Codex Training Data Controls And Enforcement

## Request

Research how a choice not to allow OpenAI to use Codex content for model
training is recorded, and how that choice can be locked down to reduce
accidental reversal.

## Existing Wiki Check

Checked on 2026-07-30:

- `docs/wiki/topic-index.md`
- `docs/wiki/data-and-privacy/index.md`
- `docs/wiki/data-and-privacy/ai-development-context-exclusion-controls.md`
- `guides/agent-security/Codex-Agent-Security-Guide.md`
- `upstream-ai-wiki/topic-index.md`
- `upstream-ai-wiki/developer-tools/openai-codex.md`
- `upstream-ai-dev-wiki/topic-index.md`

The local context-exclusion page advises reviewing provider training-use and
data-sharing terms, but it does not explain where OpenAI records the choices or
how Codex can be restricted to the control plane that owns them. The upstream
Codex page owns broad product coverage but does not answer this security-control
question. Durable coverage is therefore incomplete.

## Research Scope

Public, official OpenAI sources only. The research distinguishes:

- personal Free, Plus, and Pro ChatGPT workspaces used by Codex;
- Codex full-environment sharing;
- managed Business, Enterprise, and Edu workspaces;
- Codex authenticated with an OpenAI Platform API key; and
- local Codex authentication policy used to prevent the wrong account,
  workspace, or data-handling control plane from being selected.

Model-training use is treated separately from retention, local transcript
storage, telemetry, and abuse-monitoring logs.

## Source Inventory

All sources were accessed on 2026-07-30.

1. **OpenAI Help Center — Data Controls FAQ**
   https://help.openai.com/en/articles/7730893-data-controls-faq
   Official account-control instructions. It states: “the setting applies to
   your entire account.” It also says a support or privacy-form opt-out is
   represented on the account and the setting can be changed at any time.

2. **OpenAI Help Center — How your data is used to improve model
   performance**
   https://help.openai.com/en/articles/5722486-how-your-data-is-used-to-improve-model-performance
   Official product data-use explanation. It says new conversations are not
   used after opt-out, warns that feedback can make the associated conversation
   eligible for training, and documents separate Codex controls for “full
   environments.”

3. **OpenAI Help Center — Using Codex with your ChatGPT plan**
   https://help.openai.com/en/articles/11369540-using-codex-with-your-chatgpt-plan
   Official Codex plan and data-control explanation. It says: “Your ChatGPT
   training data controls apply to content processed through Codex.” For
   Business, Enterprise, and Edu it records no training by default; for Plus
   and Pro it directs users to ChatGPT Data Controls.

4. **OpenAI Help Center — Sharing feedback, evaluation and fine-tuning data,
   and API inputs and outputs with OpenAI**
   https://help.openai.com/en/articles/10306912-sharing-feedback-evals-and-api-data-with-openai
   Official API opt-in control description. It says API input/output sharing is
   “disabled for all organizations” by default, and account owners can change
   it at organization or selected-project scope. It also says this setting is
   unavailable to Enterprise and Zero Data Retention customers.

5. **OpenAI API documentation — Data controls in the OpenAI platform**
   https://platform.openai.com/docs/guides/your-data
   Official distinction between training and retention. It states that API
   data is not used to train models “unless you explicitly opt in,” while
   default abuse-monitoring logs can be retained for up to 30 days.

6. **OpenAI Codex documentation — Authentication**
   https://learn.chatgpt.com/docs/auth
   Official mapping from authentication to data-handling policy. ChatGPT login
   follows the ChatGPT workspace; API-key login follows the API organization.
   Managed `forced_login_method` and `forced_chatgpt_workspace_id` settings
   cause Codex to log out and exit when active credentials do not comply.

7. **OpenAI Help Center — Data access for your managed ChatGPT account**
   https://help.openai.com/en/articles/20001067
   Official managed-account notice. It says an administrator may control data
   controls and may “opt-in to share data with OpenAI” where the workspace
   configuration permits it.

8. **OpenAI Help Center — Enterprise admin getting started guide for Codex**
   https://help.openai.com/en/articles/11390924
   Official Enterprise Codex statement. Its security summary says: “No
   training on your data—ever.”

9. **OpenAI Privacy Center — Your Privacy Controls**
   https://privacy.openai.com/policies/en/?modal=take-control
   Official privacy-request description. It describes **Do not train on my
   content** as a request to “permanently opt out” of content being used for
   model improvements.

## Synthesis

### Personal ChatGPT Account

For a signed-in personal Free, Plus, or Pro workspace, the main training choice
is recorded as an OpenAI account setting under **Settings > Data Controls >
Improve the model for everyone**. OpenAI says the setting applies across
devices, so it is not stored only in the local Codex CLI or desktop
configuration. A support-team or Privacy Portal opt-out is also represented on
the account.

The control affects new conversations after opt-out. It does not retroactively
promise removal of earlier content from a training pipeline. Providing explicit
product feedback can separately authorize use of the entire associated
conversation, even when the general training control is off.

OpenAI also documents a separate Codex setting for allowing training on “full
environments” and explicitly says the ChatGPT interface or Privacy Portal does
not change that setting. Therefore a personal-account review must check both
the account-wide ChatGPT training control and the separate control visible in
Codex Settings when full-environment sharing is available.

OpenAI distinguishes two opt-out routes. The self-service **Improve the model
for everyone** setting is account-wide but mutable; the Data Controls FAQ says
it can be changed at any time. The Privacy Center describes **Do not train on
my content** as a permanent opt-out request, and the Data Controls FAQ says the
account represents a privacy-form request. The reviewed sources do not explain
the internal record, whether or how a permanent request can be reversed, or
whether a specific audit-log event is available. The Privacy Portal request
also does not change Codex's separate full-environment control.

### Managed ChatGPT Workspace

Business, Enterprise, and Edu inputs and outputs are not used for training by
default. This is a workspace/service policy rather than a personal-device
toggle. The managed-account notice nevertheless says an administrator may opt
in to sharing where supported, so Business and other configurable managed
plans still depend on workspace-owner governance.

Enterprise is the stronger documented lock: the Codex Enterprise guide states
that Codex has no training on customer data, and the API sharing guide says the
input/output sharing setting is unavailable to Enterprise customers. Workspace
identity, contractual records, and current admin configuration are the
evidence surfaces; the reviewed sources do not promise that the particular
training policy change appears as a named Compliance API audit event.

### API-Key Authentication

API inputs and outputs are not used for model training by default. The choice
is recorded in the API organization's data-sharing settings and can be scoped
to the organization or selected projects. Organization owners can enable or
disable sharing, so ordinary developers should not hold owner privileges.

For eligible Zero Data Retention customers, the voluntary sharing control is
unavailable. This is stronger against accidental opt-in, but it is a separate
control from the base no-training default and also changes retention behavior.
No-training must not be described as zero retention: default API
abuse-monitoring logs may contain customer content and may be retained for up
to 30 days.

### Preventing The Wrong Codex Control Plane

Codex has no documented project-level `config.toml` or `requirements.toml`
switch that independently turns provider model training off. The provider-side
account, workspace, or API organization owns that decision.

Managed Codex authentication can prevent accidental use of a different policy
domain:

```toml
# Managed ChatGPT workspace route
forced_login_method = "chatgpt"
forced_chatgpt_workspace_id = "<approved-workspace-uuid>"
```

or:

```toml
# OpenAI Platform organization/project route
forced_login_method = "api"
```

OpenAI says non-compliant active credentials cause Codex to log out and exit.
These settings do not themselves create a no-training promise; they force Codex
to use the workspace or API organization where the provider-side policy is
administered.

### Recommended Assurance Pattern

1. For personal use, submit the Privacy Portal's permanent **Do not train on my
   content** request, turn off **Improve the model for everyone**, check the
   separate full-environment control in Codex Settings, avoid feedback on
   sensitive conversations, and retain the privacy-request confirmation as
   local evidence.
2. For organization-controlled use, prefer Enterprise or an approved API
   organization with a non-sharing policy. Reserve owner privileges for a small
   administrative group.
3. Apply managed `forced_login_method`; for ChatGPT authentication, also apply
   `forced_chatgpt_workspace_id`.
4. Verify the active Codex authentication method and workspace during rollout.
5. Review provider settings periodically because the official personal and API
   controls are mutable unless the plan makes sharing unavailable.
6. Document training, retention, feedback, telemetry, and local transcript
   controls separately.

## Named Entities And Concepts

- OpenAI Codex
- ChatGPT Data Controls
- Improve the model for everyone
- Privacy Portal
- Codex full-environment training control
- ChatGPT Business
- ChatGPT Enterprise
- ChatGPT Edu
- OpenAI Platform data sharing
- Zero Data Retention
- `forced_login_method`
- `forced_chatgpt_workspace_id`

## Candidate Wiki Destinations

- Primary local destination:
  `docs/wiki/data-and-privacy/codex-training-data-controls-and-enforcement.md`
- Link from:
  `docs/wiki/data-and-privacy/index.md`
- Link broad product identity to:
  `upstream-ai-wiki/developer-tools/openai-codex.md`

The durable local page should own the security-control and assurance lens, not
duplicate broad Codex product coverage.

## Existing Pages To Link

- `docs/wiki/data-and-privacy/ai-development-context-exclusion-controls.md`
- `docs/wiki/identity-and-access/development-agent-credential-isolation.md`
- `docs/wiki/agent-and-tool-security/local-agent-execution-and-processing-boundaries.md`
- `upstream-ai-wiki/developer-tools/openai-codex.md`

## Conflicts Or Uncertainties

- The general data-use article says full-environment Codex sharing has a
  separate setting unaffected by ChatGPT Data Controls, while the Codex plan
  article says ChatGPT training controls apply to content processed through
  Codex. The most supportable reading is that ordinary Codex task content uses
  the account control while full-environment sharing is an additional control.
  The reviewed pages do not precisely define the boundary or name the
  full-environment UI toggle.
- The Privacy Center calls its request a permanent opt-out, while the Data
  Controls FAQ says the self-service account setting can be changed at any
  time. The reviewed sources support treating these as distinct routes but do
  not explain their precedence, reversal behavior, or backend representation.
- No reviewed official source documents an immutable audit trail for a personal
  opt-out, a named Compliance API event for the preference, or inclusion of the
  current preference in a ChatGPT data export.
- The API sharing page uses “account owners” while the relevant scope is an API
  organization and its projects. Administrative role naming should be checked
  in the live Platform UI before writing a procedural runbook.

## Excluded Sources Or Claims

- Excluded third-party articles, forum posts, social-media claims, and search
  snippets from non-OpenAI domains.
- Did not infer storage database names, internal preference keys, API endpoints,
  audit event schemas, or retroactive removal behavior because OpenAI does not
  document them in the reviewed public sources.
- Did not treat local transcript persistence, analytics, OpenTelemetry, or
  abuse-monitoring retention as model-training controls.

## Privacy And Sensitivity Notes

Only public OpenAI documentation and public repository wiki pages were used.
No private account state, personal data, company information, credentials, or
local Codex authentication files were sent to external services.

## Follow-Up For Ingest

Create the proposed granular local data-and-privacy leaf, preserve the
documented full-environment ambiguity in Open Questions, link the upstream
Codex product page, and update the current monthly digest during normal
project-wiki ingest. Keep this report in `raw` until that ingest passes its
independent topic verification.
