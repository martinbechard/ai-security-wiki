# Project Wiki Research: Codex CLI And App Security Evidence

## Request

Audit `guides/agent-security/Codex-Agent-Security-Guide.md` and attach an
official OpenAI explanation, including a short quotation, to every assertion
about Codex CLI or ChatGPT desktop app security behavior.

## Existing Wiki Check

Checked:

- `docs/wiki/topic-index.md`
- `docs/wiki/agent-and-tool-security/coding-agent-command-approval-boundaries.md`
- `docs/wiki/agent-and-tool-security/local-agent-execution-and-processing-boundaries.md`
- `docs/wiki/data-and-privacy/ai-development-context-exclusion-controls.md`
- `docs/wiki/infrastructure-and-supply-chain/ai-development-workstation-containment.md`
- `upstream-ai-wiki/topic-index.md`
- `upstream-ai-dev-wiki/topic-index.md`

The local wiki has durable security lenses for agent command approvals,
execution boundaries, context exclusion, and workstation containment. It does
not contain the quote-level OpenAI product evidence needed to substantiate
every product-behavior assertion in the customer-facing Codex guide.

## Research Scope

Public official OpenAI sources only. Topics covered:

- local versus Worktree versus Cloud execution;
- ChatGPT and API-key authentication;
- plan and administration boundaries;
- permission profiles and protected paths;
- Windows elevated sandbox architecture;
- sandbox inheritance and network rules;
- managed requirements, command rules, feature pins, and MCP allowlists;
- cached, indexed, and live web search;
- transcript, credential, analytics, and telemetry settings.

Access date: July 30, 2026.

## Source Inventory

- [Authentication](https://learn.chatgpt.com/docs/auth) — current OpenAI
  product documentation. Quote: “Codex cloud requires signing in with
  ChatGPT.”
- [Codex environments](https://learn.chatgpt.com/docs/environments/modes) —
  current OpenAI desktop documentation. Quote: “Both Local and Worktree chats
  run on your computer.”
- [Cloud environments](https://learn.chatgpt.com/docs/environments/cloud-environment)
  — current OpenAI cloud documentation. Quote: “Codex creates a container and
  checks out your repo.”
- [Pricing](https://learn.chatgpt.com/docs/pricing) — current OpenAI plan
  comparison. Quote: Business includes “a secure, dedicated workspace with
  essential admin controls.”
- [Roles and workspace permissions](https://learn.chatgpt.com/docs/enterprise/roles-and-workspace-permissions)
  — current OpenAI administration boundary map. Quote: “Granting access at one
  boundary doesn't grant access at another.”
- [Permissions](https://learn.chatgpt.com/docs/permissions) — current OpenAI
  permission-profile documentation. Quote: “Permission profiles let you apply
  least-privilege boundaries to local commands.”
- [Sandbox](https://learn.chatgpt.com/docs/sandboxing) — current OpenAI local
  sandbox documentation. Quote: spawned tools “inherit the same sandbox
  boundaries.”
- [Agent approvals and security](https://learn.chatgpt.com/docs/agent-approvals-security)
  — current OpenAI protected-path and approval documentation. Quote: “`.git`
  is protected as read-only.”
- [Windows sandbox](https://learn.chatgpt.com/docs/windows/windows-sandbox) —
  current OpenAI Windows documentation. Quote: elevated mode uses “dedicated
  lower-privilege sandbox users.”
- [Building a safe, effective sandbox to enable Codex on Windows](https://openai.com/index/building-codex-windows-sandbox/)
  — official OpenAI engineering explanation, dated May 13, 2026. Quote: the
  elevated sandbox uses “two local users created by Codex itself.”
- [Managed configuration](https://learn.chatgpt.com/docs/enterprise/managed-configuration)
  — current OpenAI requirements documentation. Quote: “Requirements constrain
  security-sensitive settings.”
- [Configuration reference](https://learn.chatgpt.com/docs/config-file/config-reference)
  — current OpenAI configuration schema. Quote: `mcp_servers.<id>.url` is the
  “Endpoint for an MCP streamable HTTP server.”
- [Rules](https://learn.chatgpt.com/docs/agent-configuration/rules) — current
  OpenAI command-rule documentation. Quote: “Use rules to control which
  commands Codex can run outside the sandbox.”
- [Web search](https://learn.chatgpt.com/docs/web-search) — current OpenAI
  search-mode documentation. Quote: cached mode uses “an OpenAI-maintained
  index instead of fetching arbitrary pages live.”
- [Plugins](https://learn.chatgpt.com/docs/plugins) — current OpenAI extension
  boundary documentation. Quote: MCP servers “define tools, enforce auth” and
  “perform actions against external systems.”

## Synthesis

The official documentation supports a layered model:

1. Authentication and plan entitlements decide which product surfaces are
   available.
2. The desktop environment selector decides whether a chat runs locally, in a
   local worktree, or remotely in a cloud environment.
3. Local permission profiles constrain sandboxed command filesystem and network
   access; connectors, MCP servers, browsers, Computer Use, approved
   escalations, and Codex cloud use separate controls.
4. Native Windows elevated mode uses dedicated lower-privilege sandbox users,
   filesystem permissions, and firewall rules.
5. Managed `requirements.toml` constrains local-client settings, feature pins,
   permission profiles, command rules, web-search modes, and MCP availability.
6. The network policy is host-scoped rather than port-scoped. Exact loopback
   literals can be allowed while broader local/private access remains disabled.
7. Cached web search uses an OpenAI-maintained index and does not give spawned
   local commands public-internet access.

The audit also found and corrected one schema error: an HTTP MCP server belongs
at `mcp_servers.<id>.url` in runtime `config.toml`; `identity.url` is a managed
allowlist identity shape, not the runtime connection shape.

## Named Entities And Concepts

- OpenAI Codex
- ChatGPT desktop app
- Codex CLI
- Codex cloud
- permission profiles
- `requirements.toml`
- `CodexSandboxOffline`
- `CodexSandboxOnline`
- command rules
- MCP servers
- cached web search

## Candidate Wiki Destinations

- `docs/wiki/agent-and-tool-security/local-agent-execution-and-processing-boundaries.md`
- `docs/wiki/agent-and-tool-security/coding-agent-command-approval-boundaries.md`
- `docs/wiki/infrastructure-and-supply-chain/ai-development-workstation-containment.md`
- `docs/wiki/data-and-privacy/ai-development-context-exclusion-controls.md`

## Existing Pages To Link

- `guides/agent-security/Codex-Agent-Security-Guide.md`
- `docs/wiki/testing-and-assurance/coding-agent-access-validation.md`

## Conflicts Or Uncertainties

- OpenAI documents per-chat Local, Worktree, and Cloud selection and cloud
  environment configuration. The reviewed official pages do not document a Pro
  account-level “local environments only” control; this is an absence finding
  limited to the July 30, 2026 documentation snapshot.
- Permission profiles are marked beta and may change. Recheck the live schema
  before customer deployment.
- The OpenAI Windows engineering article names the two sandbox accounts and
  DPAPI/firewall setup details more precisely than the higher-level Windows
  product page.

## Excluded Sources Or Claims

- No community posts, third-party blogs, or remembered product behavior were
  used as authority.
- Quarkus, MySQL, Maven, Gradle, Windows Firewall, and Git behavior outside
  Codex's own controls was outside this OpenAI evidence audit.

## Privacy And Sensitivity Notes

Only public documentation, public product names, and repository-relative paths
were used. No PII, credentials, private source code, or company information was
sent to external services.

## Follow-Up For Ingest

Ingest only the durable Codex security-boundary findings that strengthen the
existing local security lenses. Do not create a general Codex product leaf if
that broad entity is already owned upstream. Preserve the customer-facing guide
as the primary implementation baseline and the official OpenAI pages as the
product-behavior authority.
