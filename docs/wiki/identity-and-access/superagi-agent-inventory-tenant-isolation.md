---
type: "Topic"
title: "SuperAGI Agent-Inventory Tenant Isolation"
description: "Security analysis for CVE-2026-51902 cross-organization agent inventory disclosure."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# SuperAGI Agent-Inventory Tenant Isolation

## Current Understanding

The [October 29 topic collector source](../../../raw/processed/2026-10-29/ai-security-wiki-topic-news-collector-2026-10-29T232841Z.json) records [CVE-2026-51902](https://nvd.nist.gov/vuln/detail/CVE-2026-51902): SuperAGI through v0.0.14 returns another organization's agent inventory when the caller supplies its `project_id`. Broad SuperAGI product context belongs upstream; this leaf owns the project-to-organization authorization boundary for delegated-agent inventory.

## Security Impact

- Threat: an authenticated organization member can enumerate another organization's agents by selecting its project identifier.
- Affected boundary: SuperAGI through v0.0.14, `/api/agents/get/project/{project_id}`, and server-side ownership validation before inventory retrieval.
- Exploit or incident status: public NVD CVE disclosure; no exploitation incident is recorded locally.
- Mitigation state: no maintained fixed release is established by the collected evidence; enforce organization ownership from authenticated server-side context before returning project-scoped inventory.
- Confidence: high for the reported vulnerable boundary and affected version; lower for remediation status because the NVD evidence does not name a fix.
- Residual risk: agent inventory can disclose delegated capabilities and automation scope even when it does not expose execution data.

## Authoritative Sources

- [October 29 topic collector source](../../../raw/processed/2026-10-29/ai-security-wiki-topic-news-collector-2026-10-29T232841Z.json)
- [CVE-2026-51902](https://nvd.nist.gov/vuln/detail/CVE-2026-51902)
- [SuperAGI issue 1558](https://github.com/TransformerOptimus/SuperAGI/issues/1558)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [SuperAGI Agent-Execution Metadata Tenant Isolation](superagi-agent-execution-metadata-tenant-isolation.md)
- [SuperAGI Agent-Execution Configuration Tenant Isolation](superagi-agent-execution-configuration-tenant-isolation.md)

## Open Questions

- Which maintained SuperAGI release, if any, binds agent-inventory reads to the authenticated organization and project?

## Maintenance Notes

- Created on 2026-10-29 from NVD-first evidence; retain this inventory boundary separately from execution metadata and configuration disclosure.
