---
type: "Topic"
title: "MCP Atlassian Confluence Attachment File Read"
description: "Security analysis for CVE-2026-73498 in mcp-atlassian Confluence attachment uploads."
tags: ["agent-and-tool-security", "identity-and-access", "infrastructure-and-supply-chain"]
---

# MCP Atlassian Confluence Attachment File Read

## Current Understanding

CVE-2026-73498 is an MCP server file-containment failure in `sooperset/mcp-atlassian`. The [August 13 topic news collector source](../../../raw/processed/2026-08-13/ai-security-wiki-topic-news-collector-2026-08-13T233150Z.json) records [CVE.org](https://raw.githubusercontent.com/CVEProject/cvelistV5/main/cves/2026/73xxx/CVE-2026-73498.json), [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-73498), [GitHub Security Advisory GHSA-g5r6-gv6m-f5jv](https://github.com/sooperset/mcp-atlassian/security/advisories/GHSA-g5r6-gv6m-f5jv), and [mcp-atlassian 0.22.0 release](https://github.com/sooperset/mcp-atlassian/releases/tag/v0.22.0) evidence that versions before 0.22.0 pass a client-supplied `file_path` into `confluence_upload_attachment` without `validate_safe_path`.

Broad Atlassian, Jira, Confluence, and MCP server catalog context belongs upstream. Locally, the security issue is that an authenticated MCP client, or an AI agent induced by untrusted content to call the vulnerable tool, can read files available to the MCP server process and upload them to Confluence. That can disclose environment variables, including `CONFLUENCE_API_TOKEN`, plus other server-side credentials or configuration files.

The [August 14 leaf update watch source](../../../raw/processed/2026-08-14/ai-security-wiki-leaf-update-watch-20260815T000408Z.json) adds CVE List publication evidence and CISA ADP proof-of-concept tagging for the same advisory. That changes confidence in public exploitability evidence but does not create a separate local item: this remains one CVE-2026-73498 MCP attachment file-read leaf anchored to the pre-0.22.0 fix boundary.

## Security Impact

- Threat: prompt-injection or malicious client input can turn a legitimate Confluence attachment tool into arbitrary server-side file read.
- Affected boundary: `mcp-atlassian` versions before 0.22.0, `confluence_upload_attachment`, `src/mcp_atlassian/confluence/attachments.py`, local files readable by the MCP server process, Confluence attachment storage, and environment credentials such as `CONFLUENCE_API_TOKEN`.
- Exploit or incident status: public vulnerability advisory, CVE-2026-73498 and GHSA-g5r6-gv6m-f5jv; CISA ADP tagged proof-of-concept evidence in the CVE List record, but no confirmed in-the-wild exploitation was captured by the raw sources.
- Mitigation state: upgrade to `mcp-atlassian` 0.22.0 or later and reduce the server process file and credential scope.
- Confidence: high for the affected version, fix version, CWE-22 path-containment class, and CVSS 7.7 high rating because the source records CVE metadata and advisory references with in-window publication/update timestamps.
- Residual risk: authenticated MCP clients may still bridge untrusted workspace, ticket, wiki, or page content into privileged SaaS/file actions unless tool parameters are validated and approval context is explicit.

## Control Implications

- Validate resolved file paths inside the MCP server before upload, export, attach, or read operations.
- Treat MCP attachment tools as data-exfiltration paths, not only convenience upload helpers.
- Run file-capable MCP servers with least-privilege filesystem access and narrowly scoped SaaS tokens.
- Require approval or deterministic policy for agent-suggested attachment uploads when the file path originates from page, ticket, alert, or model output.
- Rotate Confluence and adjacent API tokens if a vulnerable server handled untrusted client prompts or content.

## Authoritative Sources

- [August 13 topic news collector source](../../../raw/processed/2026-08-13/ai-security-wiki-topic-news-collector-2026-08-13T233150Z.json)
- [August 14 leaf update watch source](../../../raw/processed/2026-08-14/ai-security-wiki-leaf-update-watch-20260815T000408Z.json)
- NVD CVE-2026-73498 entry: https://nvd.nist.gov/vuln/detail/CVE-2026-73498
- CVE.org CVE-2026-73498 record: https://raw.githubusercontent.com/CVEProject/cvelistV5/main/cves/2026/73xxx/CVE-2026-73498.json
- GitHub Security Advisory GHSA-g5r6-gv6m-f5jv: https://github.com/sooperset/mcp-atlassian/security/advisories/GHSA-g5r6-gv6m-f5jv
- mcp-atlassian v0.22.0 release: https://github.com/sooperset/mcp-atlassian/releases/tag/v0.22.0

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)
- [MCP tool-level IAM authorization](../identity-and-access/mcp-tool-level-iam-authorization.md)
- [RovoBlast enterprise data exfiltration](rovoblast-enterprise-data-exfiltration.md)
- Upstream AI wiki owns broad Atlassian, Jira, Confluence, and MCP server catalog context.
- Upstream AI development wiki owns general MCP server selection and workflow governance.

## Open Questions

- Which deployments exposed `mcp-atlassian` to untrusted page, ticket, alert, or model-generated content before 0.22.0?
- Does upstream AI wiki have or need a durable `mcp-atlassian` MCP server catalog page?

## Maintenance Notes

- Created on 2026-08-13 from the [August 13 topic collector](../../../raw/processed/2026-08-13/ai-security-wiki-topic-news-collector-2026-08-13T233150Z.json) after routing broad Atlassian and MCP server catalog context upstream.
- Updated on 2026-08-14 from the [August 14 watcher](../../../raw/processed/2026-08-14/ai-security-wiki-leaf-update-watch-20260815T000408Z.json) with CVE List publication and CISA ADP proof-of-concept tagging while keeping the advisory family consolidated.
