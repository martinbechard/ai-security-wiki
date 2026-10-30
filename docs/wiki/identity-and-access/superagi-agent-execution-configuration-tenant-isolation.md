---
type: "Topic"
title: "SuperAGI Agent-Execution Configuration Tenant Isolation"
description: "Security analysis for CVE-2026-51905 cross-organization agent-execution configuration disclosure."
tags: ["identity-and-access", "agent-and-tool-security", "data-and-privacy"]
---

# SuperAGI Agent-Execution Configuration Tenant Isolation

## Current Understanding

The [October 29 topic collector source](../../../raw/processed/2026-10-29/ai-security-wiki-topic-news-collector-2026-10-29T232841Z.json) records [CVE-2026-51905](https://nvd.nist.gov/vuln/detail/CVE-2026-51905): SuperAGI v0.0.14 does not verify organization ownership before returning execution configuration for supplied `agent_id` and `agent_execution_id` values. Broad SuperAGI product context belongs upstream; this leaf owns configuration confidentiality at the execution-control-plane boundary.

## Security Impact

- Threat: an authenticated caller can read another organization's agent execution configuration by presenting victim identifiers.
- Affected boundary: SuperAGI v0.0.14, `/agent_executions_configs/details/agent_id/{agent_id}/agent_execution_id/{agent_execution_id}`, and organization ownership checks for both identifiers.
- Exploit or incident status: public NVD CVE disclosure; no exploitation incident is recorded locally.
- Mitigation state: no maintained fixed release is established by the collected evidence; bind each execution-configuration read to the authenticated organization and verify the agent/execution relationship server-side.
- Confidence: high for the reported endpoint, version, and missing ownership check; lower for whether exposed records contain credential material.
- Residual risk: execution configuration can disclose tool, model, workflow, endpoint, or credential-reference choices and should be treated as control-plane data.

## Authoritative Sources

- [October 29 topic collector source](../../../raw/processed/2026-10-29/ai-security-wiki-topic-news-collector-2026-10-29T232841Z.json)
- [CVE-2026-51905](https://nvd.nist.gov/vuln/detail/CVE-2026-51905)
- [SuperAGI issue 1559](https://github.com/TransformerOptimus/SuperAGI/issues/1559)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [SuperAGI Agent-Inventory Tenant Isolation](superagi-agent-inventory-tenant-isolation.md)
- [SuperAGI Agent-Execution Metadata Tenant Isolation](superagi-agent-execution-metadata-tenant-isolation.md)

## Open Questions

- Do affected configuration responses contain credential material or sensitive tool endpoints, and which maintained release fixes the ownership check?

## Maintenance Notes

- Created on 2026-10-29 from NVD-first evidence; retain configuration disclosure separately from inventory and runtime metadata.
