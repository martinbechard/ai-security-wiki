---
type: "Topic"
title: "mcp-gitlab Transport Exposure And PAT Theft"
description: "Security analysis for mcp-gitlab SSE and Streamable HTTP exposure CVEs that can expose GitLab personal access tokens."
tags: ["agent-and-tool-security", "identity-and-access", "data-and-privacy"]
---

# mcp-gitlab Transport Exposure And PAT Theft

## Current Understanding

The [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) records CVE-2026-61560 and CVE-2026-61568 for `@zereight/mcp-gitlab`. Broad GitLab and MCP server product context belongs upstream; this page owns the local boundary where MCP transport exposure turns into unauthenticated tool access, local-file reads, and GitLab personal access token theft.

The mcp-gitlab transport and token-theft family is split into focused leaves because each transport or endpoint-control failure can change independently:

- [mcp-gitlab SSE unauthenticated file access](mcp-gitlab-sse-unauthenticated-file-access.md) owns CVE-2026-61560, where SSE mode exposes all MCP tools without authentication and can read local files into GitLab.
- [mcp-gitlab Streamable HTTP DNS rebinding](mcp-gitlab-streamable-http-dns-rebinding.md) owns CVE-2026-61568, where Host and Origin validation failures let browser-origin traffic reach a local MCP listener before 2.1.30.
- [mcp-gitlab dynamic API URL PAT exfiltration](mcp-gitlab-dynamic-api-url-pat-exfiltration.md) owns CVE-2026-61559, where `ENABLE_DYNAMIC_API_URL=true` lets callers redirect credentialed GitLab API calls and receive `Private-Token` values before 2.1.27.

## Security Impact

- Threat: unauthenticated, browser-rebound, or dynamically redirected MCP access can invoke GitLab tools, read host-local secrets, or exfiltrate GitLab personal access tokens; linked leaves own issue-specific detail.
- Affected boundary: `@zereight/mcp-gitlab` before 2.1.27 for SSE authentication and dynamic API URL host allowlisting, and before 2.1.30 for Streamable HTTP Host/Origin validation; linked leaves own exact transport and endpoint boundaries.
- Exploit or incident status: public CVE records; no local exploitation incident is recorded.
- Mitigation state: upgrade to at least 2.1.30, require authentication on every transport, enforce Host and Origin allowlists for local listeners, and avoid storing PATs in process environment variables exposed to file-read tools.
- Confidence: high for CVE publication, affected versions, and token-theft path; medium for Docker default exposure until deployment configuration is inspected.
- Residual risk: local MCP listeners remain browser-reachable unless clients combine loopback binding, origin validation, DNS rebinding defenses, and per-tool authentication.

## Authoritative Sources

- [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json)
- [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json)
- [CVE-2026-61559 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-61559)
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
- [mcp-gitlab SSE unauthenticated file access](mcp-gitlab-sse-unauthenticated-file-access.md)
- [mcp-gitlab Streamable HTTP DNS rebinding](mcp-gitlab-streamable-http-dns-rebinding.md)
- [mcp-gitlab dynamic API URL PAT exfiltration](mcp-gitlab-dynamic-api-url-pat-exfiltration.md)

## Open Questions

- Which mcp-gitlab deployments bind SSE or Streamable HTTP listeners beyond loopback or run with GitLab PATs in process environment variables?
- Which deployments enable `ENABLE_DYNAMIC_API_URL=true`, and do they restrict GitLab API hosts to an approved allowlist?

## Maintenance Notes

- Created on 2026-09-18 from the [September 17 topic collector](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) as a combined mcp-gitlab transport-hardening leaf.
- Updated on 2026-09-19 from the [September 18 topic collector source](../../../raw/processed/2026-09-18/ai-security-wiki-topic-news-collector-2026-09-18T233135Z.json) with CVE-2026-61559 dynamic API URL PAT-exfiltration evidence.
- Converted to a router on 2026-09-19 after verifier correction split the bundled mcp-gitlab vulnerabilities into focused leaves.
