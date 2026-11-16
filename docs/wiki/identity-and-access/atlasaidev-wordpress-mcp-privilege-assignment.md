---
type: "Topic"
title: "AtlasAiDev WordPress MCP Privilege Assignment"
description: "Security analysis for CVE-2026-125771 incorrect privilege assignment in AtlasAiDev MCP Server for WordPress."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# AtlasAiDev WordPress MCP Privilege Assignment

## Current Understanding

The [November 15 collector source](../../../raw/processed/2026-11-15/ai-security-wiki-topic-news-collector-2026-11-16T003018Z.json) records [CVE-2026-125771](https://nvd.nist.gov/vuln/detail/CVE-2026-125771) / [GHSA-w68m-3rvm-5xxq](https://github.com/advisories/GHSA-w68m-3rvm-5xxq) for AtlasAiDev MCP Server for WordPress (`ai-workflow-automation-ai-agent-hub`) through 2.0.3. Broad product context belongs upstream; this page owns the delegated WordPress MCP privilege-assignment boundary.

## Security Impact

- Threat: a [high-privileged account prerequisite](https://github.com/advisories/GHSA-w68m-3rvm-5xxq) precedes incorrect privilege assignment that can permit privilege escalation through a WordPress MCP server bridging an AI client to administrative web actions.
- Affected boundary: AtlasAiDev MCP Server for WordPress through 2.0.3, WordPress role assignment, and the authority exposed through delegated MCP tools.
- Exploit or incident status: public advisory disclosure; no confirmed exploitation or local incident is recorded.
- Mitigation state: verify the vendor remediation before selecting an upgrade because the public GHSA does not identify a fixed version; restrict the plugin and MCP tool authority to explicitly authorized WordPress roles.
- Confidence: high for the affected range and CWE-266; medium for remediation because the cited Patchstack advisory was unavailable for independent retrieval during ingest.
- Residual risk: a patched plugin still needs least-privilege role mapping and tool authorization because compromised or over-privileged accounts can retain broad delegated authority.

## Authoritative Sources

- [November 15 collector source](../../../raw/processed/2026-11-15/ai-security-wiki-topic-news-collector-2026-11-16T003018Z.json)
- [CVE-2026-125771](https://nvd.nist.gov/vuln/detail/CVE-2026-125771)
- [GHSA-w68m-3rvm-5xxq](https://github.com/advisories/GHSA-w68m-3rvm-5xxq)
- [Patchstack advisory](https://patchstack.com/database/wordpress/plugin/ai-workflow-automation-ai-agent-hub/vulnerability/wordpress-mcp-server-for-wordpress-plugin-2-0-3-privilege-escalation-vulnerability?_s_id=cve)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MCP Server for WordPress workflow configuration authorization](mcp-server-for-wordpress-workflow-configuration-authorization.md)
- [MCP Server for WordPress content object authorization](../data-and-privacy/mcp-server-for-wordpress-content-object-authorization.md)

## Open Questions

- Which fixed release and vendor remediation does the Patchstack CNA advisory identify for CVE-2026-125771?
- Does AtlasAiDev MCP Server for WordPress share code or deployment identity with the earlier MCP Server for WordPress advisories, or do the matching product names describe separate plugin lines?

## Maintenance Notes

- Created on 2026-11-15 from the November 15 collector source; the fixed-version uncertainty is intentionally retained.
