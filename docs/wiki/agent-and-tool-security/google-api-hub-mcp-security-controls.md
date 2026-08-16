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
- [Model Armor](../../../upstream-ai-wiki/products/google-cloud-model-armor.md) integration for tool-invocation protection.

Broad [Google AI](../../../upstream-ai-wiki/companies/google-ai.md), Google Cloud, [Apigee API hub MCP Server](../../../upstream-ai-wiki/mcp-servers/apigee-api-hub-mcp-server.md), and [Model Armor](../../../upstream-ai-wiki/products/google-cloud-model-armor.md) product coverage belongs in the upstream AI wiki. The local security issue is the MCP control boundary. An agent-facing API catalog needs:

- separate read-only and read-write delegated scopes;
- prompt-injection defenses before tool invocation;
- audit evidence when an agent can discover, alter, or deploy API assets.

The [July 26 leaf update watch source](../../../raw/processed/2026-07-26/ai-security-wiki-leaf-update-watch-2026-07-26T200447-0400.json) reinforces the same security boundary and adds the official [Google Cloud MCP release notes](https://docs.cloud.google.com/mcp/release-notes) and [Apigee API hub MCP reference](https://docs.cloud.google.com/apigee/docs/reference/apis/apihub/mcp) as follow-up evidence to distinguish global endpoint convenience from scoped authorization and prompt-injection screening.

The [July 28 topic news collector source](../../../raw/processed/2026-07-28/ai-security-wiki-topic-news-collector-2026-07-28T193213-0400.json) adds two adjacent Google Cloud MCP control updates. The [Google Cloud MCP AI security and safety documentation](https://docs.cloud.google.com/mcp/ai-security-safety) describes tool-level IAM allow and deny policies through `tool.name`, which is owned locally by [MCP tool-level IAM authorization](../identity-and-access/mcp-tool-level-iam-authorization.md). The [Cloud Monitoring MCP documentation](https://docs.cloud.google.com/monitoring/docs/use-monitoring-mcp) describes [Model Armor](../../../upstream-ai-wiki/products/google-cloud-model-armor.md) checks for natural-language observability responses, which is owned locally by [cloud observability MCP response controls](cloud-observability-mcp-response-controls.md).

The [August 10 leaf update watch source](../../../raw/processed/2026-08-09/ai-security-wiki-leaf-update-watch-20260810T000240Z.json) records [Model Armor release notes](https://docs.cloud.google.com/model-armor/release-notes) for the planned promotion of filter version v3 to Stable on 2026-08-31 while v1 and v2 move to Legacy and retire on 2026-11-29. API hub MCP did not itself change in this evidence. The local MCP-control effect is filter-version lifecycle risk for deployments that depend on Model Armor-backed prompt-injection, jailbreak, or tool-invocation controls. [Model processing data residency controls](../data-and-privacy/model-processing-data-residency-controls.md) owns the separate `australia-southeast2` and `asia-northeast3` residency update.

The [August 15 leaf update watch source](../../../raw/processed/2026-08-15/ai-security-wiki-leaf-update-watch-20260816T000321Z.json) adds a [Google Cloud latest-news entry](https://cloud.google.com/blog/topics/inside-google-cloud/whats-new-google-cloud) for Apigee-centered MCP security gateway guidance. Google describes unmonitored agentic tool calls through MCP as an enterprise architecture risk and highlights:

- centralized tool filtering;
- execution quotas;
- the ParsePayload policy;
- payload operations groups in API Products.

Broad Apigee and Google Cloud positioning remains upstream; locally this strengthens the API hub MCP control boundary because gateway enforcement needs tool-call visibility before quotas and payload policy can constrain agent actions.

## Security Impact

- Threat: MCP-mediated API catalog access can turn prompt injection or overbroad delegation into unauthorized API asset reads, writes, or deployment changes.
- Affected boundary: Google Cloud API hub MCP server GA, `apihub.googleapis.com/mcp`, `apihub.readonly`, `apihub.readwrite`, Model Armor tool-invocation protection, Apigee gateway tool filtering, execution quotas, ParsePayload policy, payload operations groups, and Model Armor template filter-version aliases used by MCP or agent gateway guardrails.
- Exploit or incident status: [official control release](https://docs.cloud.google.com/release-notes); no exploit or incident was reported in the [collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json).
- Mitigation state: scope MCP clients separately for read-only and read-write use, use prompt-injection and payload controls before tool invocation, apply gateway quotas and tool filters, pin or migrate Model Armor filter versions, and log agent identity, user identity, tool name, target API asset, filter version, and mutation result.
- Confidence: high for the release-note facts because the collector and watcher sources cite official Google Cloud documentation; medium for downstream MCP impact because the Model Armor filter lifecycle can affect guardrails without changing API hub MCP itself.
- Residual risk: downstream deployments can still collapse read and write scopes into one broad credential, bypass Model Armor-style checks in custom MCP gateways, or drift when filter-version aliases change.

## Authoritative Sources

- [July 25 topic news collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json)
- [July 26 leaf update watch source](../../../raw/processed/2026-07-26/ai-security-wiki-leaf-update-watch-2026-07-26T200447-0400.json)
- [July 28 topic news collector source](../../../raw/processed/2026-07-28/ai-security-wiki-topic-news-collector-2026-07-28T193213-0400.json)
- [August 10 leaf update watch source](../../../raw/processed/2026-08-09/ai-security-wiki-leaf-update-watch-20260810T000240Z.json)
- [August 15 leaf update watch source](../../../raw/processed/2026-08-15/ai-security-wiki-leaf-update-watch-20260816T000321Z.json)
- Google Cloud release notes: https://docs.cloud.google.com/release-notes
- Google Cloud MCP release notes: https://docs.cloud.google.com/mcp/release-notes
- Apigee API hub MCP reference: https://docs.cloud.google.com/apigee/docs/reference/apis/apihub/mcp
- Google Cloud latest-news MCP gateway entry: https://cloud.google.com/blog/topics/inside-google-cloud/whats-new-google-cloud

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [final query authorization for AI data tools](final-query-authorization-for-ai-data-tools.md)
- [MCP tool-level IAM authorization](../identity-and-access/mcp-tool-level-iam-authorization.md)
- [cloud observability MCP response controls](cloud-observability-mcp-response-controls.md)
- [identity and access](../identity-and-access/index.md)
- [data and privacy](../data-and-privacy/index.md)
- Upstream AI wiki owns broad [Google AI](../../../upstream-ai-wiki/companies/google-ai.md), Google Cloud, [Apigee API hub MCP Server](../../../upstream-ai-wiki/mcp-servers/apigee-api-hub-mcp-server.md), and [Model Armor](../../../upstream-ai-wiki/products/google-cloud-model-armor.md) context.

## Open Questions

- Which API hub MCP audit events expose enough detail to reconstruct agent-initiated write actions?
- When should Apigee MCP gateway enforcement become a separate durable leaf instead of an enrichment to API hub MCP controls?

## Maintenance Notes

- Added from the [July 25 topic news collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json); enriched from the [July 26 leaf watcher](../../../raw/processed/2026-07-26/ai-security-wiki-leaf-update-watch-2026-07-26T200447-0400.json) and [July 28 collector](../../../raw/processed/2026-07-28/ai-security-wiki-topic-news-collector-2026-07-28T193213-0400.json). Keep this page focused on API hub MCP security controls rather than Google Cloud product catalog coverage.
- Updated on 2026-08-09 from the [August 10 watcher](../../../raw/processed/2026-08-09/ai-security-wiki-leaf-update-watch-20260810T000240Z.json) with Model Armor filter-version lifecycle evidence while routing the separate residency update to [model processing data residency controls](../data-and-privacy/model-processing-data-residency-controls.md).
- Updated on 2026-08-15 from the [August 15 watcher](../../../raw/processed/2026-08-15/ai-security-wiki-leaf-update-watch-20260816T000321Z.json) with Apigee MCP security gateway evidence while deferring a separate gateway leaf until repeated evidence appears.
