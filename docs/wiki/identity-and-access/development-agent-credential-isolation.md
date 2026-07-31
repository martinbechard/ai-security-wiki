---
type: "Topic"
title: "Development Agent Credential Isolation"
description: "Security controls for separating agent, artifact, database, and remote-system credentials in local development."
tags: ["identity-and-access"]
---

# Development Agent Credential Isolation

## Current Understanding

Development agent credential isolation limits credentials by service, data class, operation, environment, and lifetime. The current [Codex security guide](../../../guides/agent-security/Codex-Development-Security-Guide.md) and [JetBrains AI development security guide](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md) separate model authentication, artifact download, local application database, and remote Git operations, but they do not specify the same database privilege detail.

The database privilege baselines are product-specific choices, not interchangeable claims:

- The [Codex profile](../../../guides/agent-security/Codex-Development-Security-Guide.md) grants its application identity only `SELECT`, `INSERT`, `UPDATE`, and `DELETE` on a disposable local development schema and configures schema management to validate rather than modify it.
- The [Junie profile](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md) requires the application identity to be limited to the disposable development schema, but the guide does not prescribe an exact MySQL grant set.

Both profiles keep routine access through the application and tests and prohibit direct database clients and database MCP servers. The [IntelliJ AI Assistant profile](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md) receives no database identity or tool; the developer runs the application and database operations.

Credentials are injected through an approved local secret mechanism and are not stored in the project, committed scripts, agent configuration, command allowlists, or generated content. An unattended agent token uses the same or narrower authority as an interactive session and is removed from the process environment after use.

The [July 30 leaf update watch source](../../../raw/processed/2026-07-30/ai-security-wiki-leaf-update-watch-2026-07-30T200159-0400.json) adds [Junie CLI reference](https://junie.jetbrains.com/docs/parameters.html) evidence for separate Junie tokens, license keys, and BYOK provider API keys. It also identifies configurable cache, MCP, model, skill, command, and agent discovery paths as credential-isolation boundaries because those paths decide which local inputs and secrets the agent can find.

## Control Implications

- Separate model access, artifact download, application database, and remote repository identities. Keep Codex on its documented DML-only identity; treat any DDL or migration authority as a separate developer decision outside that baseline.
- Restrict database identities to disposable local schemas and bind local services to loopback.
- Keep production identities and reusable production data outside agent-accessible profiles and context.
- Prefer application-level tests over direct database tools; keep exceptional direct database access outside the agent profiles unless a separately governed workflow is established.
- Use download-only artifact credentials and approval-gate remote Git or platform CLI operations.
- Inject short-lived or scoped credentials outside the repository and avoid putting secrets in launchers, profiles, allowlists, logs, or prompts.
- Separate product tokens, license keys, model-provider BYOK keys, and per-project configuration paths instead of treating all agent authentication as one credential class.
- Review cache, MCP, model, skill, command, and agent discovery paths as identity boundaries because repository-controlled paths can change which credentials or tools are loaded.

## Authoritative Sources

- [Codex Development Security Guide](../../../guides/agent-security/Codex-Development-Security-Guide.md)
- [JetBrains AI Development Security Guide - Junie profile](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md)
- [JetBrains AI Development Security Guide - AI Assistant profile](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md)
- [July 30 leaf update watch source](../../../raw/processed/2026-07-30/ai-security-wiki-leaf-update-watch-2026-07-30T200159-0400.json)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [AI development context exclusion controls](../data-and-privacy/ai-development-context-exclusion-controls.md)
- [MCP tool-level IAM authorization](mcp-tool-level-iam-authorization.md)

## Open Questions

- Which exact minimum MySQL grants should the Junie application identity receive for the approved application and test workflow?
- Which local secret-injection mechanism provides the required audit and expiry evidence for interactive and headless agent sessions?

## Maintenance Notes

- Created on 2026-07-30 from the credential, MySQL, artifact, Git, and headless-token controls in the [Codex](../../../guides/agent-security/Codex-Development-Security-Guide.md), [Junie CLI](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md), and [IntelliJ AI Assistant](../../../guides/agent-security/JetBrains-AI-Development-Security-Guide.md) security guides; enriched from the [July 30 leaf watcher](../../../raw/processed/2026-07-30/ai-security-wiki-leaf-update-watch-2026-07-30T200159-0400.json) with Junie token, BYOK, and discovery-path evidence.
