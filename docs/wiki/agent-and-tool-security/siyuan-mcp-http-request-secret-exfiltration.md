---
type: "Topic"
title: "SiYuan MCP HTTP Request Secret Exfiltration"
description: "Security analysis for CVE-2026-59809 SiYuan MCP http_request secret placeholder exfiltration."
tags: ["agent-and-tool-security", "data-and-privacy", "identity-and-access"]
---

# SiYuan MCP HTTP Request Secret Exfiltration

## Current Understanding

The [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) and [August 23 topic news collector source](../../../raw/processed/2026-08-23/ai-security-wiki-topic-news-collector-2026-08-23T233302Z.json) record CVE-2026-59809 for SiYuan before v3.8.0. Broad [SiYuan MCP endpoint authorization risk](../../../upstream-ai-wiki/techniques/siyuan-mcp-endpoint-authorization-risk.md) belongs upstream; this page owns the local MCP tool secret-exfiltration boundary.

The [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-59809), linked [GitHub advisory](https://github.com/siyuan-note/siyuan/security/advisories/GHSA-853m-gvvm-6rvx), and [VulnCheck advisory](https://www.vulncheck.com/advisories/siyuan-before-secret-exfiltration-via-http-request-url) describe `http_request` destination URL construction that interpolated stored secret placeholders before issuing requests. An MCP client with the required access could therefore direct plaintext secrets to an attacker-controlled public host.

This is split from [SiYuan MCP database clean path traversal](siyuan-mcp-database-clean-path-traversal.md), [SiYuan debug endpoint AI key disclosure](../data-and-privacy/siyuan-debug-endpoint-ai-key-disclosure.md), and [SiYuan MCP file tool blocklist bypass](siyuan-mcp-file-tool-blocklist-bypass.md) because URL-destination validation, debug endpoint exposure, and file-tool path restrictions fail at different trust boundaries.

## Security Impact

- Threat: templated secrets can cross from a local knowledge-base credential store into attacker-controlled network destinations through an MCP tool call.
- Affected boundary: SiYuan before v3.8.0 `http_request` handling for URL parameters containing secret placeholders.
- Exploit or incident status: public CVE, GitHub advisory, and VulnCheck advisory; no local exploitation evidence is recorded.
- Mitigation state: upgrade to v3.8.0 or later, prevent secret interpolation in untrusted URL destinations, and bind outbound requests to explicit allowlists.
- Confidence: high for advisory identity and affected version from NVD plus linked advisories.
- Residual risk: high-privilege MCP clients remain sensitive even when CVSS scoring treats administrator access as a prerequisite.

## Authoritative Sources

- [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json)
- [August 23 topic news collector source](../../../raw/processed/2026-08-23/ai-security-wiki-topic-news-collector-2026-08-23T233302Z.json)
- [August 23 leaf update watch source](../../../raw/processed/2026-08-23/ai-security-wiki-leaf-update-watch-20260824T000259Z.json)
- [NVD CVE-2026-59809](https://nvd.nist.gov/vuln/detail/CVE-2026-59809)
- [GitHub advisory GHSA-853m-gvvm-6rvx](https://github.com/siyuan-note/siyuan/security/advisories/GHSA-853m-gvvm-6rvx)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/siyuan-before-secret-exfiltration-via-http-request-url)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [development agent credential isolation](../identity-and-access/development-agent-credential-isolation.md)
- [MCP data movement exposure controls](../data-and-privacy/mcp-data-movement-exposure-controls.md)
- [SiYuan MCP debug key and file boundary](siyuan-mcp-debug-key-and-file-boundary.md)
- Upstream AI wiki owns broad [SiYuan MCP endpoint authorization risk](../../../upstream-ai-wiki/techniques/siyuan-mcp-endpoint-authorization-risk.md).

## Open Questions

- Which SiYuan MCP deployments expose `http_request` to clients that can supply destination URLs?

## Maintenance Notes

- Created on 2026-08-22 from the [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) as the URL-secret member of the SiYuan v3.8.0 advisory set.
- Updated on 2026-08-23 from the [August 23 topic news collector source](../../../raw/processed/2026-08-23/ai-security-wiki-topic-news-collector-2026-08-23T233302Z.json) with NVD, SecAlerts, and Rapid7 corroboration while avoiding a duplicate SiYuan leaf.
