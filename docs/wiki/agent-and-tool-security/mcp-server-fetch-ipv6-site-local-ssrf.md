---
type: "Topic"
title: "MCP Fetch Server IPv6 Site-Local SSRF"
description: "Security analysis for GHSA-3rxj-6jhw-qfv7, an IPv6 site-local SSRF classifier gap."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# MCP Fetch Server IPv6 Site-Local SSRF

## Current Understanding

[GHSA-3rxj-6jhw-qfv7](https://github.com/modelcontextprotocol/servers/security/advisories/GHSA-3rxj-6jhw-qfv7), captured in the [November 11 collector source](../../../raw/processed/2026-11-11/ai-security-wiki-topic-news-collector-2026-11-11T193154-0500.json), reports that `mcp-server-fetch` classified IPv6 `fec0::/10` as public. Broad [MCP reference-server coverage](../../../upstream-ai-wiki/mcp-servers/modelcontextprotocol-reference-servers.md) belongs upstream; this page owns the fetch tool’s destination-validation boundary.

The advisory states that default-host reachability is limited and does not claim a demonstrated metadata-service read. It reports 2026.11.11 as patched, but the corresponding maintainer release tag was unavailable during ingestion; that patch claim remains unverified.

## Security Impact

- Threat: a model-influenced fetch request reaches a non-public IPv6 destination through a classifier gap.
- Affected boundary: `mcp-server-fetch` >= 2026.10.10 and < 2026.11.11, network destination validation.
- Exploit or incident status: public advisory; no active exploitation or demonstrated metadata-service read is recorded.
- Mitigation state: enforce egress controls and reject non-public resolved destinations; do not rely on the claimed 2026.11.11 patch until a maintainer release is verified.
- Confidence: high for advisory publication and described boundary; medium for release remediation.
- Residual risk: a URL policy that omits IPv6 classifications can expand an agent’s network authority.

## Authoritative Sources

- [November 11 collector source](../../../raw/processed/2026-11-11/ai-security-wiki-topic-news-collector-2026-11-11T193154-0500.json)
- [GHSA-3rxj-6jhw-qfv7](https://github.com/modelcontextprotocol/servers/security/advisories/GHSA-3rxj-6jhw-qfv7)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP Server Fetch SSRF](mcp-server-fetch-ssrf.md)
- [agent network egress controls](agent-network-egress-controls.md)

## Open Questions

- Which maintainer release and release notes verify the claimed 2026.11.11 patch?

## Maintenance Notes

- Created on 2026-11-11 from the November 11 collector source.
