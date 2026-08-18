---
type: "Topic"
title: "chrome-devtools-mcp Symlink Root Bypass"
description: "Security analysis for CVE-2026-53766 workspace-root bypass in chrome-devtools-mcp."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# chrome-devtools-mcp Symlink Root Bypass

## Current Understanding

The [August 17 topic news collector source](../../../raw/processed/2026-08-17/ai-security-wiki-topic-news-collector-2026-08-17T233246Z.json) records CVE-2026-53766 / GHSA-8qf9-62x2-82pp for [chrome-devtools-mcp](../../../upstream-ai-wiki/mcp-servers/chrome-devtools-mcp.md). Broad MCP server profile coverage belongs upstream; this page owns the local root-canonicalization and browser-agent file-boundary risk.

Versions 0.24.0 through 1.0.1 checked resolved path text against configured workspace roots without canonicalizing symlinks. An in-root symlink to an out-of-root target could pass validation, allowing downstream save or browser file-input operations to write outside the intended workspace or upload out-of-root files. Version 1.1.0 is listed as patched.

The security boundary is sharper than a generic path traversal because browser-connected MCP tools combine local file access, web-page influence, and agent-selected upload or save operations. A prompt-injected page does not need direct filesystem access if it can steer an agent into using a tool whose root check accepts symlink escape paths.

## Security Impact

- Threat: prompt injection or operator confusion can turn browser file tools into secret disclosure or out-of-workspace write paths when workspace roots are not canonicalized.
- Affected boundary: chrome-devtools-mcp 0.24.0 through 1.0.1; workspace roots, browser file uploads, and file-save operations.
- Exploit or incident status: public advisory; exploitability depends on local workspace state or an induced symlink path.
- Mitigation state: upgrade to chrome-devtools-mcp 1.1.0, canonicalize symlinks before root checks, log canonical paths, and require explicit consent for browser file uploads.
- Confidence: high for affected versions, patched version, and vulnerability class from the GitHub advisory and patch references.
- Residual risk: MCP clients still need independent file chooser, upload, and save-path review because patched server validation does not remove prompt-injection pressure from web content.

## Authoritative Sources

- [August 17 topic news collector source](../../../raw/processed/2026-08-17/ai-security-wiki-topic-news-collector-2026-08-17T233246Z.json)
- GitHub advisory GHSA-8qf9-62x2-82pp: https://github.com/advisories/GHSA-8qf9-62x2-82pp
- NVD CVE-2026-53766: https://nvd.nist.gov/vuln/detail/CVE-2026-53766
- chrome-devtools-mcp 1.1.0 release: https://github.com/ChromeDevTools/chrome-devtools-mcp/releases/tag/chrome-devtools-mcp-v1.1.0

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)
- [Agentic browser intent collision](agentic-browser-intent-collision.md)
- Upstream AI wiki owns broad [chrome-devtools-mcp](../../../upstream-ai-wiki/mcp-servers/chrome-devtools-mcp.md) coverage.

## Open Questions

- Which MCP clients expose enough canonical-path evidence for users or logs to detect symlink-mediated out-of-root file activity?

## Maintenance Notes

- Created on 2026-08-17 from the August 17 topic collector as a browser-agent filesystem-boundary advisory leaf.
