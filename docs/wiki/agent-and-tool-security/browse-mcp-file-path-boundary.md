---
type: "Topic"
title: "browse-mcp File Path Boundary"
description: "Security analysis for CVE-2026-55557 caller-controlled download and browser-state paths in browse-mcp."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# browse-mcp File Path Boundary

## Current Understanding

The [August 25 topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T183709Z.json) and [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) record [CVE-2026-55557](https://nvd.nist.gov/vuln/detail/CVE-2026-55557) for browse-mcp before 0.8.2. Broad browse-mcp and Playwright catalog context belongs upstream; this page owns the local browser-agent filesystem boundary.

The [GitHub advisory](https://github.com/That1Drifter/browse-mcp/security/advisories/GHSA-m9mq-7m7q-xc6p) evidence says MCP callers could control download save directories and browser state paths, enabling arbitrary file writes and host filesystem read/write exposure. The [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) also notes that a `force_fetch` fallback bypassed the allowed-origin fence, connecting path containment with indirect prompt-injection risk from untrusted web content.

## Security Impact

- Threat: a prompt-influenced browser agent can read or write host files or persist browser state outside intended directories.
- Affected boundary: browse-mcp before 0.8.2 download, save/load state, and forced-fetch origin controls; NVD records CWE-22 and CVSS 4.0 HIGH 8.6.
- Exploit or incident status: public vulnerability advisory; no local exploitation incident is recorded.
- Mitigation state: upgrade to 0.8.2 or later, confine file paths to dedicated directories, and enforce origin policy consistently across fallbacks.
- Confidence: high for advisory existence, affected range, and fixed version from NVD/GitHub evidence.
- Residual risk: browser MCP servers remain exposed to filesystem compromise and state disclosure when web-controlled content can influence tool arguments.

## Control Implications

- Canonicalize and contain all agent-controlled download and state paths before filesystem access.
- Apply the same origin and egress checks to normal fetches and fallback fetch behavior.
- Separate browser state, downloads, and workspace files into least-privilege directories.

## Authoritative Sources

- [August 25 topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T183709Z.json)
- [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json)
- [NVD CVE-2026-55557](https://nvd.nist.gov/vuln/detail/CVE-2026-55557)
- [GitHub advisory GHSA-m9mq-7m7q-xc6p](https://github.com/That1Drifter/browse-mcp/security/advisories/GHSA-m9mq-7m7q-xc6p)
- [browse-mcp 0.8.2 release](https://github.com/That1Drifter/browse-mcp/releases/tag/v0.8.2)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)
- [chrome-devtools-mcp symlink root bypass](chrome-devtools-mcp-symlink-root-bypass.md)

## Open Questions

- Which browse-mcp deployments expose `force_fetch` to untrusted page-derived instructions, and how is origin policy represented in logs?

## Maintenance Notes

- Created on 2026-08-26 from the [August 25 collectors](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) as a browser MCP path-containment leaf.
