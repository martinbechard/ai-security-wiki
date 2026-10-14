---
type: "Topic"
title: "obsidian-tc Local MCP DNS-Rebinding Exposure"
description: "Security analysis for CVE-2026-77363, where obsidian-tc Streamable HTTP transport can expose Obsidian vault access."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# obsidian-tc Local MCP DNS-Rebinding Exposure

## Current Understanding

The [October 13 topic collector source](../../../raw/processed/2026-10-13/ai-security-wiki-topic-news-collector-2026-10-13T232603Z.json) records [CVE-2026-77363](https://nvd.nist.gov/vuln/detail/CVE-2026-77363) for obsidian-tc before 1.3.1. Broad Obsidian and obsidian-tc context belongs upstream; this page owns the local MCP DNS-rebinding, browser-origin, and vault-access boundary.

The CVE evidence says obsidian-tc lacks Host, Origin, and DNS-rebinding validation in Streamable HTTP transport. With documented loopback `auth.mode=none`, a malicious web page can send requests to the local MCP endpoint and gain unrestricted vault access as the `http-local` caller.

## Security Impact

- Threat: browser-delivered DNS rebinding can convert a local knowledge server into unauthorized vault access.
- Affected boundary: obsidian-tc before 1.3.1, local Streamable HTTP transport, `auth.mode=none`, and Obsidian vault content access.
- Exploit or incident status: public CVE and NVD record; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to 1.3.1 or later and require Host, Origin, DNS-rebinding, and authentication controls before vault access.
- Confidence: high for affected range and transport weakness from NVD/CVE evidence.
- Residual risk: vault contents can become agent context and tool-accessible data, so local-only assumptions are insufficient.

## Control Implications

- Treat local MCP servers that expose knowledge stores as data-security systems, not only developer conveniences.
- Disable unauthenticated local HTTP modes unless browser-origin and host validation are enforced.
- Test Streamable HTTP transports against DNS-rebinding and hostile-origin requests.

## Authoritative Sources

- [October 13 topic collector source](../../../raw/processed/2026-10-13/ai-security-wiki-topic-news-collector-2026-10-13T232603Z.json)
- [NVD CVE-2026-77363](https://nvd.nist.gov/vuln/detail/CVE-2026-77363)
- [CVE Services CVE-2026-77363](https://cveawg.mitre.org/api/cve/CVE-2026-77363)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [data and privacy](../data-and-privacy/index.md)
- [Obsidian Web MCP unauthenticated vault tokens](../identity-and-access/obsidian-web-mcp-unauthenticated-vault-tokens.md)

## Open Questions

- Which obsidian-tc 1.3.1 change shows the exact DNS-rebinding and origin-control implementation?

## Maintenance Notes

- Created on 2026-10-14 from the October 13 topic collector as a local-MCP vault exposure leaf.
