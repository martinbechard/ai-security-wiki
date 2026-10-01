---
type: "Topic"
title: "mcp-chrome-bridge CORS Origin Bypass"
description: "Security analysis for CVE-2026-102878, where mcp-chrome-bridge exposes local browser automation tools to malicious pages."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# mcp-chrome-bridge CORS Origin Bypass

## Current Understanding

The [September 29 topic collector source](../../../raw/processed/2026-09-29/ai-security-wiki-topic-news-collector-2026-09-29T233133Z.json) records [CVE-2026-102878](https://nvd.nist.gov/vuln/detail/CVE-2026-102878) for `mcp-chrome-bridge` through 1.0.31. Broad browser-agent and MCP server catalog context belongs upstream; this page owns the local browser-tool exposure and cross-origin request boundary.

The source says an origin validation error lets malicious pages make cross-origin requests to the local native-server HTTP API and invoke browser automation tools. The exposed capabilities include script execution, page-content reading, and screenshot capture, which turns a browser visit into delegated browser control.

The [September 30 leaf update watch source](../../../raw/processed/2026-09-30/ai-security-wiki-leaf-update-watch-20261001T000313Z.json) preserves the distinction between the September 4 public issue/advisory timing and the September 29 CVE publication/update timing.

## Security Impact

- Threat: web content can invoke local MCP browser automation APIs without the intended origin boundary.
- Affected boundary: `mcp-chrome-bridge` through 1.0.31; local native-server HTTP API; browser automation tools for script execution, content reading, and screenshot capture.
- Exploit or incident status: public NVD entry, GitHub issue, and VulnCheck advisory; no active exploitation was identified in the collector source.
- Mitigation state: disable exposed local bridge endpoints until upgraded, require strict Origin and Host validation, and bind browser-control APIs to explicit user/session authorization.
- Confidence: high for affected range and exposed capability class from NVD and VulnCheck; medium for fixed-version status because the collector did not identify a patched release.
- Residual risk: local browser-control bridges remain high risk when ambient browser pages can reach loopback services through permissive CORS, DNS rebinding, or missing per-request authorization.

## Authoritative Sources

- [September 29 topic collector source](../../../raw/processed/2026-09-29/ai-security-wiki-topic-news-collector-2026-09-29T233133Z.json)
- [September 30 leaf update watch source](../../../raw/processed/2026-09-30/ai-security-wiki-leaf-update-watch-20261001T000313Z.json)
- [CVE-2026-102878 NVD entry](https://nvd.nist.gov/vuln/detail/CVE-2026-102878)
- [mcp-chrome issue 384](https://github.com/hangwin/mcp-chrome/issues/384)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/mcp-chrome-bridge-through-1.0.31-cors-origin-bypass)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [cross-site agent forgery](cross-site-agent-forgery.md)
- [agentic browser intent collision](agentic-browser-intent-collision.md)
- [mcp-go DNS rebinding host validation](mcp-go-dns-rebinding-host-validation.md)
- Upstream AI wiki owns broad mcp-chrome catalog context if needed.

## Open Questions

- Which mcp-chrome-bridge release, if any, fixes CVE-2026-102878?

## Maintenance Notes

- Created on 2026-09-30 from the [September 29 topic collector source](../../../raw/processed/2026-09-29/ai-security-wiki-topic-news-collector-2026-09-29T233133Z.json) after routing general browser-agent runtime practice upstream.
- Updated on 2026-10-01 from the [September 30 leaf update watch source](../../../raw/processed/2026-09-30/ai-security-wiki-leaf-update-watch-20261001T000313Z.json) with CVE-publication timing provenance and no duplicate digest item.
