---
type: "Topic"
title: "MCP Toolbox SDK Python Google ID Token Audience Confusion"
description: "Security analysis for CVE-2026-19202, where mcp-toolbox-sdk-python can reuse Google ID tokens across audiences."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# MCP Toolbox SDK Python Google ID Token Audience Confusion

## Current Understanding

The [September 23 topic collector source](../../../raw/processed/2026-09-23/ai-security-wiki-topic-news-collector-2026-09-23T233151Z.json) records [CVE-2026-19202](https://cveawg.mitre.org/api/cve/CVE-2026-19202) for Google `mcp-toolbox-sdk-python` `toolbox-core` through 1.1.0. Broad [MCP Toolbox for Databases](../../../upstream-ai-wiki/mcp-servers/mcp-toolbox-for-databases.md) context belongs upstream; this page owns the local credential audience-isolation boundary.

The affected SDK caches Google ID tokens without keying the cache by requested audience. A process that authenticates to multiple service audiences can send a token minted for a sensitive service to a secondary service; an attacker controlling or observing that secondary service can replay the token against the original sensitive audience.

## Security Impact

- Threat: cross-audience credential reuse and replay across delegated MCP tool backends.
- Affected boundary: Google `mcp-toolbox-sdk-python` `toolbox-core` through 1.1.0, Google ID token cache, and applications authenticating to multiple audiences in one process.
- Exploit or incident status: public CVE, NVD, and patch PR evidence; no local exploitation evidence is recorded.
- Mitigation state: apply a build containing [Google PR 675](https://github.com/googleapis/mcp-toolbox-sdk-python/pull/675) or a fixed release when identified; verify token caches include the requested audience in their key material.
- Confidence: high for the affected component and audience-cache flaw from Google CNA, NVD, and patch PR evidence; medium for fixed package version until release metadata is identified.
- Residual risk: delegated data tools must bind workload credentials to exact target audiences, not only to process-local service identities.

## Authoritative Sources

- [September 23 topic collector source](../../../raw/processed/2026-09-23/ai-security-wiki-topic-news-collector-2026-09-23T233151Z.json)
- [CVE-2026-19202 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-19202)
- [NVD CVE-2026-19202](https://nvd.nist.gov/vuln/detail/CVE-2026-19202)
- [Google PR 675](https://github.com/googleapis/mcp-toolbox-sdk-python/pull/675)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [Google MCP Toolbox BigQuery forecast boundary bypass](../agent-and-tool-security/google-mcp-toolbox-bigquery-forecast-boundary-bypass.md)

## Open Questions

- Which `mcp-toolbox-sdk-python` release first includes the audience-keyed token cache fix for CVE-2026-19202?

## Maintenance Notes

- Created on 2026-09-24 from the [September 23 topic collector source](../../../raw/processed/2026-09-23/ai-security-wiki-topic-news-collector-2026-09-23T233151Z.json); keep broad SDK/product notes upstream and local updates focused on credential audience isolation.
