---
type: "Topic"
title: "Langflow MCP Resource Read Authorization Bypass"
description: "Security analysis for CVE-2026-105699 project-scoped MCP resources/read authorization failure in Langflow."
tags: ["identity-and-access", "data-and-privacy", "agent-and-tool-security"]
---

# Langflow MCP Resource Read Authorization Bypass

## Current Understanding

The [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) records [CVE-2026-105699](https://cveawg.mitre.org/api/cve/CVE-2026-105699) for Langflow 1.6.8 through 1.9.0. Broad Langflow product coverage belongs upstream; this page owns project-scoped MCP resource read authorization.

The CVE record says Langflow authenticated access to the project identifier in a project-scoped MCP connection but did not authorize the `resources/read` URI. `read_resource` forwarded attacker-controlled URIs to handlers that parsed a `flow_id` and filename, then read files without verifying the flow belonged to the authenticated user or current project.

## Security Impact

- Threat: users with access to any project-scoped MCP endpoint can request another user's flow-backed file.
- Affected boundary: Langflow 1.6.8 through 1.9.0; project-scoped MCP endpoints; `resources/read`; flow-backed uploaded documents, structured data, prompts, and private artifacts.
- Exploit or incident status: public CVE record; no local exploitation incident is recorded.
- Mitigation state: update to Langflow 1.9.1 or later and authorize resource URIs against both current project and flow owner before file reads.
- Confidence: high for affected range and fix from CVE Services.
- Residual risk: list-resource behavior can expose identifiers that make cross-tenant file targeting easier even when files are not modified.

## Authoritative Sources

- [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json)
- [CVE-2026-105699 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-105699)
- [NVD CVE-2026-105699](https://nvd.nist.gov/vuln/detail/CVE-2026-105699)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [data and privacy](../data-and-privacy/index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [IBM Langflow MCP Tools cache isolation](ibm-langflow-mcp-tools-cache-isolation.md)

## Open Questions

- Which Langflow deployments used project-scoped MCP endpoints with shared project membership before 1.9.1?

## Maintenance Notes

- Created on 2026-10-06 from the [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) after verifier correction split MCP resource authorization from flow ownership and MCP configuration boundaries.
