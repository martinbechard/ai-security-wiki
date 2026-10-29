---
type: "Topic"
title: "MCP Python SDK Cross-Origin Redirect Credential Forwarding"
description: "Security analysis for CVE-2026-116685 and GHSA-5h93-6whr-6q8j."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# MCP Python SDK Cross-Origin Redirect Credential Forwarding

## Current Understanding

The [October 28 collector source](../../../raw/processed/2026-10-28/ai-security-wiki-topic-news-collector-2026-10-28T233111Z.json) records [CVE-2026-116685](https://cveawg.mitre.org/api/cve/CVE-2026-116685) / [GHSA-5h93-6whr-6q8j](https://github.com/advisories/GHSA-5h93-6whr-6q8j). The MCP Python SDK followed cross-origin redirects in HTTP, SSE, OAuth, and related client paths while forwarding caller credentials and sometimes bodies. Broad MCP SDK context belongs upstream; this page owns the origin-binding boundary.

## Security Impact

- Threat: a redirecting endpoint can receive delegated credentials and request payloads.
- Affected boundary: versions 1.8.0 before 1.30.0 and 2.0.0 before 2.2.0.
- Exploit or incident status: public CVE and advisory; no confirmed local incident is recorded.
- Mitigation state: upgrade to 1.30.0 or 2.2.0 and review custom authorization headers.
- Confidence: high; residual risk remains in wrappers that implement their own redirect handling.

## Control Implications

- Bind credentials, bodies, and OAuth flows to the configured origin before following redirects.
- Inventory HTTP MCP clients for affected SDK lines and header-forwarding customizations.

## Authoritative Sources

- [October 28 collector source](../../../raw/processed/2026-10-28/ai-security-wiki-topic-news-collector-2026-10-28T233111Z.json)
- [CVE-2026-116685](https://cveawg.mitre.org/api/cve/CVE-2026-116685)
- [GitLab advisory](https://advisories.gitlab.com/pypi/mcp/CVE-2026-116685/)
- [MCP Python SDK 1.30.0 release](https://github.com/modelcontextprotocol/python-sdk/releases/tag/v1.30.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MCP Python SDK OAuth metadata trust flaw](mcp-python-sdk-oauth-metadata-trust-flaw.md)

## Open Questions

- Do dependent MCP clients retain credentials on redirects outside SDK-managed paths?

## Maintenance Notes

- Created on 2026-10-28 from the October 28 collector.
