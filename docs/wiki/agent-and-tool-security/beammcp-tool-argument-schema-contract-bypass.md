---
type: "Topic"
title: "BeamMCP Tool Argument Schema Contract Bypass"
description: "Security analysis for BeamMCP schema-enforcement and boolean/null argument normalization flaws."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# BeamMCP Tool Argument Schema Contract Bypass

## Current Understanding

The [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json) records BeamMCP argument-validation flaws in ScriptKittyOS `beam_mcp`. Broad MCP server catalog context belongs upstream; this page owns the local MCP schema-contract and host-dispatch trust boundary.

[CVE-2026-88257](https://cveawg.mitre.org/api/cve/CVE-2026-88257) says nested tool argument constraints were advertised but not enforced. [CVE-2026-104634](https://cveawg.mitre.org/api/cve/CVE-2026-104634) says JSON boolean and null tool arguments reached dispatch as strings. The collector records BeamMCP from 0.1.0 before 0.10.1 as affected.

## Security Impact

- Threat: clients and policy layers can rely on advertised MCP schemas while the server dispatches arguments that violate those constraints or change boolean/null semantics.
- Affected boundary: ScriptKittyOS BeamMCP 0.1.0 before 0.10.1, `tools/call`, `prompts/get`, nested argument constraints, JSON booleans/nulls, and host dispatch.
- Exploit or incident status: public CVE Services records and GitHub advisories; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to BeamMCP 0.10.1 or later and validate received arguments against the same schema that `tools/list` advertises before dispatch.
- Confidence: high for advisory identity; medium for application impact because exploitability depends on host-specific policy and tool behavior.
- Residual risk: MCP schema metadata is security-relevant when hosts use it to authorize arguments or map model output into privileged operations.

## Authoritative Sources

- [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json)
- [CVE-2026-88257 record](https://cveawg.mitre.org/api/cve/CVE-2026-88257)
- [GHSA-mrg2-4747-fmpw](https://github.com/ScriptKittyOS/beam_mcp/security/advisories/GHSA-mrg2-4747-fmpw)
- [CVE-2026-104634 record](https://cveawg.mitre.org/api/cve/CVE-2026-104634)
- [GHSA-wv7p-j6qh-3hj4](https://github.com/ScriptKittyOS/beam_mcp/security/advisories/GHSA-wv7p-j6qh-3hj4)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [final-query authorization for AI data tools](final-query-authorization-for-ai-data-tools.md)
- [MCP data movement exposure controls](../data-and-privacy/mcp-data-movement-exposure-controls.md)
- Upstream AI wiki owns broad MCP framework/server catalog coverage.

## Open Questions

- Which BeamMCP 0.10.1 tests prove advertised nested constraints and runtime dispatch validation are identical?

## Maintenance Notes

- Created on 2026-10-09 from the [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json) as one closely coupled schema-contract leaf.
