---
type: "Topic"
title: "Payload plugin-mcp API Key Account Takeover"
description: "Security analysis for CVE-2026-105806 account-boundary failure in @payloadcms/plugin-mcp API key management."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# Payload plugin-mcp API Key Account Takeover

## Current Understanding

The [October 6 topic collector source](../../../raw/processed/2026-10-06/ai-security-wiki-topic-news-collector-2026-10-06T233203Z.json) records [CVE-2026-105806](https://nvd.nist.gov/vuln/detail/CVE-2026-105806) / [GHSA-2q76-m6w6-qgc6](https://github.com/payloadcms/payload/security/advisories/GHSA-2q76-m6w6-qgc6) for `@payloadcms/plugin-mcp` 3.61.0 through before 3.88.0. Broad Payload CMS product context belongs upstream; this page owns delegated MCP API-key account scoping.

The advisory says an authenticated user can manage MCP API keys outside the intended account, enabling privilege escalation through account takeover. Payload 3.88.0 fixes the issue. The local security boundary is not general CMS administration; it is the tenant and account binding for keys that grant downstream MCP tool authority.

## Security Impact

- Threat: authenticated users can manage another account's MCP API keys and take over delegated tool access.
- Affected boundary: `@payloadcms/plugin-mcp` 3.61.0 through before 3.88.0, MCP API-key management, account ownership, and authenticated user context.
- Exploit or incident status: public GitHub advisory and NVD CVE record; no local exploitation incident is recorded.
- Mitigation state: update to Payload 3.88.0 or later, audit MCP API-key management events across the affected range, and rotate keys when account-boundary abuse cannot be excluded.
- Confidence: high because GitHub advisory, NVD, and release reference align on affected range and fixed version.
- Residual risk: MCP API keys are delegated action credentials, so lifecycle operations need tenant-bound authorization checks and audit evidence equivalent to ordinary account takeover controls.

## Authoritative Sources

- [October 6 topic collector source](../../../raw/processed/2026-10-06/ai-security-wiki-topic-news-collector-2026-10-06T233203Z.json)
- [NVD CVE-2026-105806](https://nvd.nist.gov/vuln/detail/CVE-2026-105806)
- [GitHub advisory GHSA-2q76-m6w6-qgc6](https://github.com/payloadcms/payload/security/advisories/GHSA-2q76-m6w6-qgc6)
- [Payload 3.88.0 release](https://github.com/payloadcms/payload/releases/tag/v3.88.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [MCP tool-level IAM authorization](mcp-tool-level-iam-authorization.md)

## Open Questions

- Does the Payload advisory require MCP API-key rotation after upgrade for tenants that exposed cross-account key management?

## Maintenance Notes

- Created on 2026-10-07 from the [October 6 topic collector source](../../../raw/processed/2026-10-06/ai-security-wiki-topic-news-collector-2026-10-06T233203Z.json) as a delegated MCP key lifecycle and account-boundary leaf.
