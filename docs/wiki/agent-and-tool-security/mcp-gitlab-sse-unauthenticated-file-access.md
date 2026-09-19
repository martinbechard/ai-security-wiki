---
type: "Topic"
title: "mcp-gitlab SSE Unauthenticated File Access"
description: "Security analysis for CVE-2026-61560 mcp-gitlab SSE unauthenticated tools and local-file reads."
tags: ["agent-and-tool-security", "identity-and-access", "data-and-privacy"]
---

# mcp-gitlab SSE Unauthenticated File Access

## Current Understanding

The [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) records [CVE-2026-61560](https://cveawg.mitre.org/api/cve/CVE-2026-61560) for `@zereight/mcp-gitlab` before 2.1.27. Broad GitLab and MCP server product context belongs upstream; this page owns the local SSE authentication and file-read-to-GitLab boundary.

The CVE says SSE mode exposes all MCP tools without authentication. The `upload_markdown` tool can read an attacker-selected local file and upload it to GitLab, including `/proc/self/environ` when the process environment contains `GITLAB_PERSONAL_ACCESS_TOKEN`.

## Security Impact

- Threat: unauthenticated SSE access can invoke GitLab tools and copy host-local secrets into a remote GitLab destination.
- Affected boundary: `@zereight/mcp-gitlab` before 2.1.27, SSE transport, tool authentication, `upload_markdown`, and host-local file reads.
- Exploit or incident status: public CVE; no local exploitation incident is recorded.
- Mitigation state: upgrade to 2.1.27 or later, require authentication for SSE, restrict file-read tools, and avoid placing GitLab PATs in process environments reachable from file-read tools.
- Confidence: high for CVE publication, affected range, and token-theft path from the September 17 collector.
- Residual risk: MCP tools that bridge host files and GitLab writes need transport authentication and per-tool path controls.

## Authoritative Sources

- [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json)
- [CVE-2026-61560 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-61560)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [mcp-gitlab transport exposure and PAT theft](mcp-gitlab-transport-exposure-and-pat-theft.md)
- [MCP data movement exposure controls](../data-and-privacy/mcp-data-movement-exposure-controls.md)

## Open Questions

- Which mcp-gitlab deployments used SSE mode with GitLab PATs in process environment variables?

## Maintenance Notes

- Created on 2026-09-19 after verifier correction split the mcp-gitlab transport-hardening router into focused leaves.
