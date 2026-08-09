---
type: "Topic"
title: "MCP Tool-Level IAM Authorization"
description: "Security analysis for controlling agent-visible MCP tools through identity, allow policies, deny policies, and audit logs."
---

# MCP Tool-Level IAM Authorization

## Current Understanding

The [July 28 topic news collector source](../../../raw/processed/2026-07-28/ai-security-wiki-topic-news-collector-2026-07-28T193213-0400.json) records the official [Google Cloud MCP AI security and safety documentation](https://docs.cloud.google.com/mcp/ai-security-safety) update that describes IAM allow and deny policies for Google Cloud MCP tools through the `tool.name` permission. The same source records [Cloud Monitoring MCP documentation](https://docs.cloud.google.com/monitoring/docs/use-monitoring-mcp) with [cloud observability MCP response controls](../agent-and-tool-security/cloud-observability-mcp-response-controls.md).

The [July 29 leaf update watch source](../../../raw/processed/2026-07-29/ai-security-wiki-leaf-update-watch-2026-07-29T200338-0400.json) adds the same official Google Cloud MCP safety documentation as in-window control evidence. It expands the local authorization model beyond `tool.name` to include:

- least-privilege agent identities;
- API key restrictions;
- prompt-injection mitigations;
- [Model Armor](../../../upstream-ai-wiki/products/google-cloud-model-armor.md) screening;
- periodic tool review;
- organization, project, and folder MCP restrictions;
- deny policies for read-write production access.

This page owns the local identity-and-access boundary for MCP tools. Broad [MCP](../../../upstream-ai-wiki/techniques/mcp-authorization-model.md), [Google Cloud](../../../upstream-ai-wiki/companies/google-ai.md), and managed product coverage belongs upstream; locally, tool visibility and invocation must be treated as delegated authorization decisions tied to:

- Human identity.
- Agent identity.
- Connector identity.
- Tool name.
- Audit evidence.

The [August 9 leaf update watch source](../../../raw/processed/2026-08-09/ai-security-wiki-leaf-update-watch-20260809T000323Z.json) adds [Cloud Monitoring MCP documentation](https://docs.cloud.google.com/monitoring/docs/use-monitoring-mcp) evidence for these required grants:

- MCP Tool User role;
- Monitoring Admin role;
- `mcp.tools.call` permission.

This does not create a separate Google Cloud product leaf locally. It strengthens the existing control rule that each agent-visible MCP tool call needs:

- IAM-scoped authorization;
- caller identity;
- audit evidence.

## Security Impact

- Threat or control area: agents can discover or invoke cloud tools outside the user's intended scope when tool authorization is only enforced at the connector or server level.
- Affected boundary: Google Cloud MCP tools, `tool.name` permission conditions, allow policies, deny policies, Cloud Logging IAM-aware responses, audit logging, and least-privilege agent access.
- Exploit or incident status: official security-control documentation update; no exploit or incident is reported in the source.
- Mitigation state:
  - Bind MCP tool access to explicit IAM conditions.
  - Use deny policies for disallowed tools.
  - Log user and agent context for invocations.
  - Keep log responses constrained by the requesting identity's effective permissions.
  - Restrict production read-write tools at the organization, folder, or project level when agent identity does not require them.
  - Review tool allowlists periodically because prompt injection can turn an otherwise legitimate tool into an overbroad delegated action path.
  - Require documented role grants and `mcp.tools.call` permission paths for Cloud Monitoring MCP tool use.
- Confidence: high for the official documentation statements and visible update dates carried by the collector source.
- Residual risk: local MCP deployments can still expose overbroad tool lists if discovery, authorization, and audit logging are implemented outside managed IAM controls.

## Authoritative Sources

- [July 28 topic news collector source](../../../raw/processed/2026-07-28/ai-security-wiki-topic-news-collector-2026-07-28T193213-0400.json)
- [July 29 leaf update watch source](../../../raw/processed/2026-07-29/ai-security-wiki-leaf-update-watch-2026-07-29T200338-0400.json)
- [August 9 leaf update watch source](../../../raw/processed/2026-08-09/ai-security-wiki-leaf-update-watch-20260809T000323Z.json)
- Google Cloud MCP AI security and safety documentation: https://docs.cloud.google.com/mcp/ai-security-safety
- Cloud Monitoring MCP documentation: https://docs.cloud.google.com/monitoring/docs/use-monitoring-mcp

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MCP client OAuth redirect URI handling](mcp-client-oauth-redirect-uri-handling.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [Google API hub MCP security controls](../agent-and-tool-security/google-api-hub-mcp-security-controls.md)
- Upstream AI wiki owns broad [MCP authorization model](../../../upstream-ai-wiki/techniques/mcp-authorization-model.md) context.

## Open Questions

- Which MCP audit fields are required locally to reconstruct a tool invocation from user request through agent plan to cloud API result?
- Which Cloud Monitoring MCP role grants are sufficient for read-only evidence collection without allowing configuration mutation?

## Maintenance Notes

- Added from the [July 28 topic news collector source](../../../raw/processed/2026-07-28/ai-security-wiki-topic-news-collector-2026-07-28T193213-0400.json); enriched from the [July 29 leaf watcher](../../../raw/processed/2026-07-29/ai-security-wiki-leaf-update-watch-2026-07-29T200338-0400.json). Keep future updates focused on tool authorization and identity evidence, not general MCP catalog coverage.
- Updated on 2026-08-09 from the [August 9 watcher](../../../raw/processed/2026-08-09/ai-security-wiki-leaf-update-watch-20260809T000323Z.json) with Cloud Monitoring MCP role and `mcp.tools.call` permission evidence.
