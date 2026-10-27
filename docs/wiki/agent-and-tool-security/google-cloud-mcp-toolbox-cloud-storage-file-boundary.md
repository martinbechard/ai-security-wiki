---
type: "Topic"
title: "Google Cloud MCP Toolbox Cloud-Storage File Boundary"
description: "Security analysis for CVE-2026-93328 path traversal and missing authorization in MCP Toolbox cloud storage."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# Google Cloud MCP Toolbox Cloud-Storage File Boundary

## Current Understanding

The October 26 collector records [CVE-2026-93328](https://nvd.nist.gov/vuln/detail/CVE-2026-93328) and [GHSA-2gc9-c85v-5vwr](https://github.com/advisories/GHSA-2gc9-c85v-5vwr) in [Google Cloud MCP Toolbox for Databases](../../../upstream-ai-wiki/mcp-servers/mcp-toolbox-for-databases.md) 1.2.0 through 1.4.0. General MCP Toolbox catalog context is upstream-owned; this page owns the delegated tool-parameter path and cloud-storage egress boundary.

## Security Impact

- Threat: crafted tool parameters can traverse paths or bypass authorization, exfiltrating host files to external Cloud Storage or overwriting local files.
- Affected boundary: `cloud-storage` source in googleapis/mcp-toolbox 1.2.0 through 1.4.0.
- Exploit or incident status: public advisory; no exploitation evidence is recorded.
- Mitigation state: upgrade to 1.5.0 or later, apply the linked [upstream patch](https://github.com/googleapis/mcp-toolbox/pull/3454), constrain tool paths, and scope storage credentials.
- Confidence: high for the affected range and boundary.
- Residual risk: authorization checks that precede path canonicalization or storage dispatch can still expose host files.

## Authoritative Sources

- [October 26 collector source](../../../raw/processed/2026-10-26/ai-security-wiki-topic-news-collector-2026-10-26T233009Z.json)
- [CVE-2026-93328 record](https://www.cve.org/CVERecord?id=CVE-2026-93328)
- [Google pull request 3454](https://github.com/googleapis/mcp-toolbox/pull/3454)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Google MCP Toolbox allowedLocalRoots symlink bypass](google-mcp-toolbox-allowedlocalroots-symlink-bypass.md)

## Open Questions

- Does every cloud-storage connector path receive the 1.5.0 authorization and canonical-path fix?

## Maintenance Notes

- Created on 2026-10-26 from the October 26 collector as a separate filesystem and egress boundary.
