---
type: "Topic"
title: "Google API Hub MCP Security Controls"
description: "Security analysis for API hub MCP OAuth scoping, write-action controls, and Model Armor protection."
---

# Google API Hub MCP Security Controls

## Current Understanding

The [July 25 topic news collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json) records a 2026-07-24 [Google Cloud release-note](https://docs.cloud.google.com/release-notes) signal that the API hub MCP server reached general availability with:

- read/write AI-agent actions over API assets;
- a global MCP endpoint;
- service-specific OAuth scopes;
- Model Armor integration for tool-invocation protection.

Broad [Google AI](../../../upstream-ai-wiki/companies/google-ai.md), Google Cloud, Apigee API hub, and Model Armor product coverage belongs in the upstream AI wiki. The local security issue is the MCP control boundary. An agent-facing API catalog needs:

- separate read-only and read-write delegated scopes;
- prompt-injection defenses before tool invocation;
- audit evidence when an agent can discover, alter, or deploy API assets.

## Security Impact

- Threat: MCP-mediated API catalog access can turn prompt injection or overbroad delegation into unauthorized API asset reads, writes, or deployment changes.
- Affected boundary: Google Cloud API hub MCP server GA, `apihub.googleapis.com/mcp`, `apihub.readonly`, `apihub.readwrite`, and Model Armor tool-invocation protection.
- Exploit or incident status: [official control release](https://docs.cloud.google.com/release-notes); no exploit or incident was reported in the [collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json).
- Mitigation state: scope MCP clients separately for read-only and read-write use, use prompt-injection protection before tool invocation, and log agent identity, user identity, tool name, target API asset, and mutation result.
- Confidence: high for the release-note facts because the [collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json) cites [official Google Cloud release notes](https://docs.cloud.google.com/release-notes).
- Residual risk: downstream deployments can still collapse read and write scopes into one broad credential or bypass Model Armor-style checks in custom MCP gateways.

## Authoritative Sources

- [July 25 topic news collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json)
- Google Cloud release notes: https://docs.cloud.google.com/release-notes

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [final query authorization for AI data tools](final-query-authorization-for-ai-data-tools.md)
- [identity and access](../identity-and-access/index.md)
- [data and privacy](../data-and-privacy/index.md)
- Upstream AI wiki owns broad [Google AI](../../../upstream-ai-wiki/companies/google-ai.md), Google Cloud, API hub, and Model Armor context.

## Open Questions

- Which API hub MCP audit events expose enough detail to reconstruct agent-initiated write actions?

## Maintenance Notes

- Added from the [July 25 topic news collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json); keep this page focused on MCP security controls rather than Google Cloud product catalog coverage.
