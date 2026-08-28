---
type: "Topic"
title: "Telnyx MCP stored credential auth bypass"
description: "Security analysis for CVE-2026-81098 Telnyx MCP missing authentication and stored credential forwarding."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# Telnyx MCP stored credential auth bypass

## Current Understanding

The [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) records [CVE-2026-81098](https://nvd.nist.gov/vuln/detail/CVE-2026-81098) for the Telnyx Node MCP server through 6.83.0. Broad Telnyx and [MCP server catalog](../../../upstream-ai-wiki/mcp-servers/index.md) context belongs upstream; this page owns the stored-provider-credential and unauthenticated tool-dispatch boundary.

## Security Impact

- Threat: unauthenticated HTTP transport clients can initialize the MCP server and invoke tools that forward the configured Telnyx API key and client secret
- Affected boundary: team-telnyx/telnyx-node MCP server through 6.83.0
- Exploit or incident status: public advisory evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: Apply the [upstream fix](https://github.com/team-telnyx/telnyx-node/pull/450) when available; require fail-closed authentication before initialization and tool dispatch, and scope stored provider credentials to authenticated principals.
- Confidence: high for advisory existence and affected boundary; medium for remediation details when the primary advisory does not name a fixed release.
- Residual risk: model- or browser-reachable helper surfaces can convert ordinary tool arguments into internal data access, credential use, or host execution when final authorization is missing.

## Authoritative Sources

- [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json)
- [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-81098)
- [CVE record](https://www.cve.org/CVERecord?id=CVE-2026-81098)
- [GitHub security advisory](https://github.com/team-telnyx/telnyx-node/security/advisories/GHSA-46jp-xr2h-fw7h)
- [GitHub pull request](https://github.com/team-telnyx/telnyx-node/pull/450)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](../agent-and-tool-security/index.md)
- [infrastructure and supply chain](../infrastructure-and-supply-chain/index.md)
- [identity and access](../identity-and-access/index.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-08-28 from the [August 27 topic collector](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) as a focused stored-provider-credential and MCP dispatch leaf after routing broad Telnyx context upstream; next check the first fixed Node MCP server version and whether authentication is mandatory by default.
