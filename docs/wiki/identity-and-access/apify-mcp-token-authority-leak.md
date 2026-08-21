---
type: "Topic"
title: "Apify MCP Token Authority Leak"
description: "Security analysis for CVE-2026-50143 bearer-token leakage through actor path authority injection."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# Apify MCP Token Authority Leak

## Current Understanding

The [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) records [NVD CVE-2026-50143](https://nvd.nist.gov/vuln/detail/CVE-2026-50143) publication and the earlier [GHSA-6gr2-qh89-hxwm advisory](https://github.com/apify/apify-mcp-server/security/advisories/GHSA-6gr2-qh89-hxwm) for `@apify/actors-mcp-server`. Broad Apify product context belongs upstream; this page owns the local connector-token and URL-authority validation boundary.

The advisory says version 0.10.7 concatenated a trusted Actor standby URL with attacker-controlled `webServerMcpPath` from an Actor definition. A malicious path such as `@attacker.example/mcp` can redirect the final MCP URL to an attacker host while the client attaches the victim's `Authorization: Bearer APIFY_TOKEN` header. [NVD CVE-2026-50143](https://nvd.nist.gov/vuln/detail/CVE-2026-50143) says versions prior to 0.10.11 are affected.

The [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json) records the in-window [CVE Program](https://www.cve.org/CVERecord?id=CVE-2026-50143) and [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-50143) publication for the older [GHSA](https://github.com/advisories/GHSA-6gr2-qh89-hxwm) and keeps the authority-parsing issue local while broad Apify product context routes upstream.

## Security Impact

- Threat: actor or marketplace metadata can redirect MCP traffic and leak bearer tokens cross-origin.
- Affected boundary: `@apify/actors-mcp-server` 0.10.7 and, per NVD, prior to 0.10.11.
- Exploit or incident status: public GitHub security advisory and NVD publication; no local incident evidence is recorded.
- Mitigation state: upgrade to 0.10.11 or later, validate URL authority after path joining, and bind bearer tokens to expected origins.
- Confidence: high for advisory mechanics; medium for exact affected-version range because GHSA and NVD wording differ.
- Residual risk: hosted MCP connectors need URL parsing tests for actor, plugin, marketplace, and manifest-provided path fields.

## Authoritative Sources

- [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json)
- [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json)
- [GitHub advisory GHSA-6gr2-qh89-hxwm](https://github.com/advisories/GHSA-6gr2-qh89-hxwm)
- [Apify security advisory GHSA-6gr2-qh89-hxwm](https://github.com/apify/apify-mcp-server/security/advisories/GHSA-6gr2-qh89-hxwm)
- [NVD CVE-2026-50143](https://nvd.nist.gov/vuln/detail/CVE-2026-50143)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [MCP client OAuth redirect URI handling](mcp-client-oauth-redirect-uri-handling.md)
- [development agent credential isolation](development-agent-credential-isolation.md)

## Open Questions

- Which source should be treated as authoritative for the full affected-version range, GHSA or NVD?

## Maintenance Notes

- Created on 2026-08-19 from the [August 18 topic collector](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json); digest treatment records the in-window NVD publication while preserving that the GHSA is older.
- Updated on 2026-08-20 from the [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json) with additional publication evidence for the existing authority-leak advisory.
