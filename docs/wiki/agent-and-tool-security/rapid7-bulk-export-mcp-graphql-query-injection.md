---
type: "Topic"
title: "Rapid7 Bulk Export MCP GraphQL Query Injection"
description: "Security analysis for CVE-2026-97228, where a Rapid7 Bulk Export MCP tool argument was interpolated into a privileged GraphQL query."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# Rapid7 Bulk Export MCP GraphQL Query Injection

## Current Understanding

The [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) records [CVE-2026-97228](https://nvd.nist.gov/vuln/detail/CVE-2026-97228) for Rapid7 Bulk Export MCP versions 0.2.5 through 0.6.1. Broad Rapid7 product context belongs upstream; this page owns the local MCP tool-argument-to-GraphQL execution boundary.

The `get_export_status` path interpolated an unvalidated `export_id` MCP tool argument into a GraphQL query sent with the operator's Rapid7 API key. A crafted value could append extra root-level selections, including schema introspection. The reported fix in 0.6.2 parameterizes `export_id` as a GraphQL variable.

## Security Impact

- Threat: a compromised MCP client, prompt-influenced tool call, or hostile user can turn a nominal export-status lookup into an unintended API query.
- Affected boundary: Rapid7 Bulk Export MCP 0.2.5 through 0.6.1, `get_export_status`, GraphQL query construction, and the operator API key used by the MCP server.
- Exploit or incident status: disclosed CVE; no confirmed exploitation is recorded in the collector.
- Mitigation state: upgrade to 0.6.2 or later, parameterize GraphQL variables, and treat tool arguments as untrusted input even when API credentials constrain final data access.
- Confidence: medium-high from NVD-backed collector evidence; primary project advisory text should be reconciled when available.
- Residual risk: delegated MCP tools can still execute broad API reads under the operator's key unless per-tool query allowlists and audit evidence are in place.

## Authoritative Sources

- [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json)
- [NVD CVE-2026-97228](https://nvd.nist.gov/vuln/detail/CVE-2026-97228)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP tool-level IAM authorization](../identity-and-access/mcp-tool-level-iam-authorization.md)

## Open Questions

- Which Rapid7 Bulk Export MCP advisory or release note identifies the exact query-construction patch?

## Maintenance Notes

- Created on 2026-09-27 from the [September 26 topic collector source](../../../raw/processed/2026-09-26/ai-security-wiki-topic-news-collector-2026-09-26T233301Z.json) as the local MCP tool-argument injection boundary.
