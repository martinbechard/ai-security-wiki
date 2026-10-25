---
type: "Topic"
title: "NetBox MCP HTTP Authentication"
description: "Security analysis for CVE-2026-57207 unauthenticated NetBox MCP HTTP transport."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# NetBox MCP HTTP Authentication

## Current Understanding

[CVE-2026-57207](https://nvd.nist.gov/vuln/detail/CVE-2026-57207), captured by the [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json), reports that NetBox MCP HTTP transport lacked authentication before 1.2.1. This page owns listener authentication, not upstream MCP-server catalog detail.

## Security Impact

- Threat: a reachable listener grants unauthenticated tool authority.
- Affected boundary: NetBox MCP Server before 1.2.1.
- Exploit or incident status: public disclosure; no local incident is recorded.
- Mitigation state: upgrade to 1.2.1 and inventory exposed HTTP listeners.
- Confidence: high for disclosed scope and fixed version.
- Residual risk: network reachability remains authorization if transport authentication is optional.

## Authoritative Sources

- [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json)
- [CVE-2026-57207](https://nvd.nist.gov/vuln/detail/CVE-2026-57207)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)

## Open Questions

- Which NetBox MCP listeners are reachable beyond loopback?

## Maintenance Notes

- Created on 2026-10-24 after verifier-required split from a mixed MCP family.
