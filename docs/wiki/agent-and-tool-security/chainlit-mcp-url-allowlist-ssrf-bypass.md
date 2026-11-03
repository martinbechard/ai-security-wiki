---
type: Topic
title: Chainlit MCP URL-Allowlist SSRF Bypass
description: A semicolon path segment can bypass Chainlit MCP path-scoped destination controls.
tags: [agent-and-tool-security]
---

# Chainlit MCP URL-Allowlist SSRF Bypass

## Current Understanding

[CVE-2026-120492](https://nvd.nist.gov/vuln/detail/CVE-2026-120492) identifies a Chainlit 2.12.0 MCP `allowed_urls` path-scope bypass. A semicolon path segment can cause requests outside the operator-approved path on origins that strip path parameters. MCP destination policy must canonicalize URLs and revalidate the final connection target against SSRF controls.

No exploitation is reported. Confidence is medium: NVD's new record differs from its older linked advisory's version framing, so this might be a corrected mapping, a distinct bypass, or a duplicate disclosure.

- Mitigation state: canonicalize and revalidate final destinations against SSRF policy; a fixed version is not established here.
- Residual risk: path-scope policies can be bypassed on parameter-stripping origins until final-target validation is deployed.

## Authoritative Sources

- [November 3 collector source](../../../raw/processed/2026-11-03/ai-security-wiki-topic-news-collector-2026-11-03T002828Z.json)
- [NVD CVE-2026-120492](https://nvd.nist.gov/vuln/detail/CVE-2026-120492)
- [GitHub advisory GHSA-hvfh-5mj3-5f3j](https://github.com/Chainlit/chainlit/security/advisories/GHSA-hvfh-5mj3-5f3j)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [Chainlit MCP setup command and SSRF](chainlit-mcp-setup-command-and-ssrf.md)
- [Cross-vendor MCP SSRF protocol pivoting](cross-vendor-mcp-ssrf-protocol-pivoting.md)

## Open Questions

- Is CVE-2026-120492 a distinct semicolon-path bypass or a remapped version of the older Chainlit advisory?

## Maintenance Notes

- Created on 2026-11-03. Chainlit product context remains upstream-owned.
