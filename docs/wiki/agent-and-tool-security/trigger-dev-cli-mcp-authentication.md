---
type: "Topic"
title: "Trigger.dev CLI MCP Authentication"
description: "Security analysis for CVE-2026-114090 unauthenticated Trigger.dev CLI MCP endpoints."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# Trigger.dev CLI MCP Authentication

## Current Understanding

The [October 21 topic collector source](../../../raw/processed/2026-10-21/ai-security-wiki-topic-news-collector-2026-10-21T193103-0400.json) records [CVE-2026-114090](https://nvd.nist.gov/vuln/detail/CVE-2026-114090) / [GHSA-pqmg-rq46-vm4m](https://github.com/triggerdotdev/trigger.dev/security/advisories/GHSA-pqmg-rq46-vm4m). Broad Trigger.dev coverage belongs upstream; this leaf owns the developer-workstation MCP listener and delegated-authority boundary.

## Security Impact

- Threat: a LAN attacker or malicious webpage can invoke run-management tools using the developer's stored access token.
- Affected boundary: `trigger dev --mcp` in cli-v3 3.0.0 before 4.5.4 when the MCP SSE and messages endpoints are exposed beyond loopback.
- Exploit or incident status: public GitHub advisory and NVD record; no local exploitation incident is recorded.
- Mitigation state: upgrade to 4.5.4 or later and restrict development MCP endpoints to trusted loopback or network boundaries.
- Confidence: high for affected range and exposed action surface; collector evidence should be reconciled for whether the patch changes binding, authentication, or both.
- Residual risk: an authenticated developer token remains a high-impact delegated capability if a tool listener is reachable from an untrusted origin.

## Authoritative Sources

- [October 21 topic collector source](../../../raw/processed/2026-10-21/ai-security-wiki-topic-news-collector-2026-10-21T193103-0400.json)
- [GitHub advisory GHSA-pqmg-rq46-vm4m](https://github.com/triggerdotdev/trigger.dev/security/advisories/GHSA-pqmg-rq46-vm4m)
- [NVD CVE-2026-114090](https://nvd.nist.gov/vuln/detail/CVE-2026-114090)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Argocd MCP unauthenticated HTTP tool control](argocd-mcp-unauthenticated-http-tool-control.md)

## Open Questions

- Does the patched CLI bind only to loopback, require authentication, or apply both protections?

## Maintenance Notes

- Created on 2026-10-21 from the October 21 topic collector as a development-listener authority boundary.
