---
type: "Topic"
title: "Google MCP Toolbox BigQuery Forecast Boundary Bypass"
description: "Security analysis for CVE-2026-15829, where a prebuilt BigQuery forecasting tool bypasses allowed dataset controls."
---

# Google MCP Toolbox BigQuery Forecast Boundary Bypass

## Current Understanding

The [July 22 topic news collector source](../../../raw/processed/2026-07-22/ai-security-wiki-topic-news-collector-2026-07-22T193242-0400.json) records CVE-2026-15829 for [Google](../../../upstream-ai-wiki/companies/google-ai.md) [MCP Toolbox for Databases](../../../upstream-ai-wiki/mcp-servers/mcp-toolbox-for-databases.md) versions 0.13.0 through 1.3.0. The `bigquery-forecast` tool interpolated client-controlled column parameters into an `AI.FORECAST` query while validating only the selected `history_data` dataset against `allowedDatasets`.

[Google PR 3324](https://github.com/googleapis/mcp-toolbox/pull/3324) was merged on June 4, 2026 and says the fix wraps tool options and dry-runs the fully assembled BigQuery statement to inspect every accessed dataset. The [GitHub releases feed](https://github.com/googleapis/mcp-toolbox/releases/tag/v1.4.0) checked during ingest shows v1.4.0 published after the merge, so the local mitigation state is to upgrade past the affected 1.3.0 line and verify deployed prebuilt tools use a build containing PR 3324. The reusable control is [final query authorization for AI data tools](final-query-authorization-for-ai-data-tools.md).

## Security Impact

- Threat: SQL injection and hidden cross-dataset access through agent-controlled or user-controlled tool parameters.
- Affected boundary: Google MCP Toolbox for Databases 0.13.0 through 1.3.0, prebuilt `bigquery-forecast`, `allowedDatasets`, and BigQuery tables reachable by the service identity.
- Exploit or incident status: public CVE and merged fix PR; no public exploitation was identified in the raw source.
- Mitigation state: fixed code merged in PR 3324; deploy a release after the affected 1.3.0 range and verify fully assembled query dry-run enforcement.
- Confidence: high for affected range and technical boundary from the raw source and merged PR; medium for exact fixed release because the NVD source names the affected range but not a fixed version.
- Residual risk: custom BigQuery tools may repeat the same anti-pattern if they validate only selected dataset parameters instead of final executed statements.

## Authoritative Sources

- [July 22 topic news collector source](../../../raw/processed/2026-07-22/ai-security-wiki-topic-news-collector-2026-07-22T193242-0400.json)
- NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-15829
- Google PR 3324: https://github.com/googleapis/mcp-toolbox/pull/3324

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [final query authorization for AI data tools](final-query-authorization-for-ai-data-tools.md)
- [data and privacy](../data-and-privacy/index.md)
- [identity and access](../identity-and-access/index.md)
- [infrastructure and supply chain](../infrastructure-and-supply-chain/index.md)
- Upstream AI wiki owns broad Google, BigQuery, and MCP Toolbox product context.

## Open Questions

- Which release note or advisory explicitly names the first fixed MCP Toolbox version for CVE-2026-15829?

## Maintenance Notes

- Added from the July 22, 2026 raw collector artifact plus GitHub PR and release metadata.
