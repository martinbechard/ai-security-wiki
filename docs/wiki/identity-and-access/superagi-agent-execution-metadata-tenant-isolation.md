---
type: "Topic"
title: "SuperAGI Agent-Execution Metadata Tenant Isolation"
description: "Security analysis for CVE-2026-51903 cross-organization agent-execution metadata disclosure."
tags: ["identity-and-access", "agent-and-tool-security", "data-and-privacy"]
---

# SuperAGI Agent-Execution Metadata Tenant Isolation

## Current Understanding

The [October 29 topic collector source](../../../raw/processed/2026-10-29/ai-security-wiki-topic-news-collector-2026-10-29T232841Z.json) records [CVE-2026-51903](https://nvd.nist.gov/vuln/detail/CVE-2026-51903): SuperAGI v0.0.14 permits one organization to retrieve another organization's latest agent execution and metadata using the victim project identifier. Broad SuperAGI product context belongs upstream; this leaf owns execution-state isolation.

## Security Impact

- Threat: an authenticated cross-tenant caller can read another organization's latest agent execution metadata.
- Affected boundary: SuperAGI v0.0.14, `/agentexecutions/get/latest/agent/project/{project_id}`, and authorization before execution-state lookup.
- Exploit or incident status: public NVD CVE disclosure; no exploitation incident is recorded locally.
- Mitigation state: no maintained fixed release is established by the collected evidence; resolve the project through the authenticated organization before returning execution state.
- Confidence: high for the reported endpoint, version, and cross-organization disclosure; lower for remediation status.
- Residual risk: execution metadata can expose operational behavior, tool use, and business context even without returning configuration records.

## Authoritative Sources

- [October 29 topic collector source](../../../raw/processed/2026-10-29/ai-security-wiki-topic-news-collector-2026-10-29T232841Z.json)
- [CVE-2026-51903](https://nvd.nist.gov/vuln/detail/CVE-2026-51903)
- [SuperAGI repository](https://github.com/TransformerOptimus/SuperAGI)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [SuperAGI Agent-Inventory Tenant Isolation](superagi-agent-inventory-tenant-isolation.md)
- [SuperAGI Agent-Execution Configuration Tenant Isolation](superagi-agent-execution-configuration-tenant-isolation.md)

## Open Questions

- Which maintained SuperAGI release, if any, binds latest-execution reads to the authenticated organization and project?

## Maintenance Notes

- Created on 2026-10-29 from NVD-first evidence; execution metadata remains distinct from inventory and configuration confidentiality.
