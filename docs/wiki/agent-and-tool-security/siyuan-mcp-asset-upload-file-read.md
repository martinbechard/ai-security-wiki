---
type: "Topic"
title: "SiYuan MCP asset upload file read"
description: "Security analysis for CVE-2026-82233 SiYuan MCP asset.upload path traversal and sensitive file exposure."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# SiYuan MCP asset upload file read

## Current Understanding

The [August 28 topic collector source](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json) records [CVE-2026-82233](https://nvd.nist.gov/vuln/detail/CVE-2026-82233) for SiYuan before v3.8.1. Broad [SiYuan MCP endpoint authorization risk](../../../upstream-ai-wiki/techniques/siyuan-mcp-endpoint-authorization-risk.md) belongs upstream; this page owns the local `asset.upload` file-boundary failure where prompt-influenced tool arguments can upload host files into the workspace.

This issue stays separate from [SiYuan MCP file tool blocklist bypass](siyuan-mcp-file-tool-blocklist-bypass.md), [SiYuan MCP HTTP request secret exfiltration](siyuan-mcp-http-request-secret-exfiltration.md), and [SiYuan MCP database clean path traversal](siyuan-mcp-database-clean-path-traversal.md) because `asset.upload`, generic file-tool reads, URL secret forwarding, and database cleanup expose different tool authorities and mitigation checks.

## Security Impact

- Threat: prompt injection can induce an AI agent to pass arbitrary absolute host paths to `asset.upload`, exposing SSH keys, cloud credentials, or other local secrets after a category-level approval that omits exact file paths.
- Affected boundary: SiYuan before v3.8.1 `asset.upload` MCP handling and workspace upload authority.
- Exploit or incident status: public NVD and GitHub advisory evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: update to v3.8.1 or later, enforce workspace and sensitive-path restrictions inside the tool, and require approval prompts to show exact file paths.
- Confidence: high for advisory existence, affected boundary, and fixed-version metadata.
- Residual risk: human approval remains weak when the approval surface hides file arguments or treats all asset uploads as equivalent.

## Authoritative Sources

- [August 28 topic collector source](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json)
- [NVD CVE-2026-82233](https://nvd.nist.gov/vuln/detail/CVE-2026-82233)
- [GitHub security advisory](https://github.com/siyuan-note/siyuan/security/advisories/GHSA-p23f-cm6q-2qp8)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/siyuan-before-3.8.1-path-traversal-via-asset-upload)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [SiYuan MCP debug key and file boundary](siyuan-mcp-debug-key-and-file-boundary.md)
- [agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)

## Open Questions

- Which SiYuan approval surfaces display exact `asset.upload` source paths after v3.8.1?

## Maintenance Notes

- Created on 2026-08-29 from the [August 28 topic collector](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json) as the `asset.upload` member of the SiYuan v3.8.1 advisory family.
