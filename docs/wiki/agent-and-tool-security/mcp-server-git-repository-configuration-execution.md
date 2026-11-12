---
type: "Topic"
title: "MCP Git Server Repository-Configuration Execution"
description: "Security analysis for GHSA-6hqx-gqrx-c5r2, repository-controlled Git configuration execution."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# MCP Git Server Repository-Configuration Execution

## Current Understanding

[GHSA-6hqx-gqrx-c5r2](https://github.com/modelcontextprotocol/servers/security/advisories/GHSA-6hqx-gqrx-c5r2), captured in the [November 11 collector source](../../../raw/processed/2026-11-11/ai-security-wiki-topic-news-collector-2026-11-11T193154-0500.json), reports that `mcp-server-git` could execute a program selected by untrusted repository Git configuration, including through a nominally read-only tool. Broad [MCP reference-server coverage](../../../upstream-ai-wiki/mcp-servers/modelcontextprotocol-reference-servers.md) and coding-workflow coverage belongs upstream; this page owns the repository-metadata execution boundary.

The advisory says the claimed 2026.11.11 remediation neutralizes command-bearing Git configuration and refuses Git versions before 2.31. The corresponding maintainer release could not be verified during ingestion.

## Security Impact

- Threat: an untrusted repository controls Git configuration that becomes host command execution through an agent tool.
- Affected boundary: `mcp-server-git` before 2026.11.11, including read-only operations that invoke Git.
- Exploit or incident status: public advisory; no active-exploitation incident is recorded.
- Mitigation state: do not process untrusted repositories with a privileged Git MCP server; require a verified fixed release and restrict executable Git configuration.
- Confidence: high for the reported trust boundary; medium for remediation availability.
- Residual risk: a read-only tool label does not prevent code execution when underlying repository metadata is executable.

## Authoritative Sources

- [November 11 collector source](../../../raw/processed/2026-11-11/ai-security-wiki-topic-news-collector-2026-11-11T193154-0500.json)
- [GHSA-6hqx-gqrx-c5r2](https://github.com/modelcontextprotocol/servers/security/advisories/GHSA-6hqx-gqrx-c5r2)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [mcp-server-git repository boundary bypasses](../infrastructure-and-supply-chain/mcp-server-git-repository-boundary-bypasses.md)

## Open Questions

- Which maintainer release confirms the 2026.11.11 remediation and Git-version floor?

## Maintenance Notes

- Created on 2026-11-11 from the November 11 collector source.
