---
type: "Topic"
title: "mcp-gitlab Transport Exposure And PAT Theft"
description: "Security analysis for mcp-gitlab SSE and Streamable HTTP exposure CVEs that can expose GitLab personal access tokens."
tags: ["agent-and-tool-security", "identity-and-access", "data-and-privacy"]
---

# mcp-gitlab Transport Exposure And PAT Theft

## Current Understanding

The [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) records CVE-2026-61560 and CVE-2026-61568 for `@zereight/mcp-gitlab`. Broad GitLab and MCP server product context belongs upstream; this page owns the local boundary where MCP transport exposure turns into unauthenticated tool access, local-file reads, and GitLab personal access token theft.

CVE-2026-61560 says versions before 2.1.27 expose all MCP tools without authentication in SSE mode. The `upload_markdown` tool can read an attacker-selected local file and upload it to GitLab, including `/proc/self/environ` when that environment contains `GITLAB_PERSONAL_ACCESS_TOKEN`.

CVE-2026-61568 says versions before 2.1.30 expose the Streamable HTTP endpoint without an effective Host or Origin allowlist, so DNS rebinding from a malicious web page can reach a local MCP listener. Treat 2.1.30 as the safer consolidated remediation target when both SSE and Streamable HTTP are possible.

## Security Impact

- Threat: unauthenticated or browser-rebound MCP access can invoke GitLab tools and read host-local secrets into a remote GitLab destination.
- Affected boundary: `@zereight/mcp-gitlab` before 2.1.27 for SSE authentication and before 2.1.30 for Streamable HTTP Host/Origin validation.
- Exploit or incident status: public CVE records; no local exploitation incident is recorded.
- Mitigation state: upgrade to at least 2.1.30, require authentication on every transport, enforce Host and Origin allowlists for local listeners, and avoid storing PATs in process environment variables exposed to file-read tools.
- Confidence: high for CVE publication, affected versions, and token-theft path; medium for Docker default exposure until deployment configuration is inspected.
- Residual risk: local MCP listeners remain browser-reachable unless clients combine loopback binding, origin validation, DNS rebinding defenses, and per-tool authentication.

## Authoritative Sources

- [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json)
- [CVE-2026-61560 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-61560)
- [CVE-2026-61568 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-61568)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [MCP tool-level IAM authorization](../identity-and-access/mcp-tool-level-iam-authorization.md)
- [agent network egress controls](agent-network-egress-controls.md)
- [MCP data movement exposure controls](../data-and-privacy/mcp-data-movement-exposure-controls.md)

## Open Questions

- Which mcp-gitlab deployments bind SSE or Streamable HTTP listeners beyond loopback or run with GitLab PATs in process environment variables?

## Maintenance Notes

- Created on 2026-09-18 from the [September 17 topic collector](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) as a combined mcp-gitlab transport-hardening leaf.
