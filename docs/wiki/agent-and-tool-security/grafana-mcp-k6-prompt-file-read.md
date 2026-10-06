---
type: "Topic"
title: "Grafana mcp-k6 prompt file read"
description: "Security analysis for CVE-2026-89039 / GHSA-ffg3-vfrj-4mjj arbitrary file reads through the mcp-k6 Playwright conversion prompt."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# Grafana mcp-k6 prompt file read

## Current Understanding

The [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) records [CVE-2026-89039](https://cveawg.mitre.org/api/cve/CVE-2026-89039) / [GHSA-ffg3-vfrj-4mjj](https://github.com/advisories/GHSA-ffg3-vfrj-4mjj) for Grafana `mcp-k6` 0.3.0 before 0.7.0. Broad Grafana and MCP product context belongs upstream; this page owns the local MCP prompt path-containment and credential-exposure boundary.

The advisory describes `convert_playwright_script` prompt path handling that accepts bare paths outside the configured working directory and can also be bypassed with symlinks inside the working directory. When the MCP prompt is exposed to an assistant or agent workflow, that path bug becomes a file-read capability for anything readable by the server user, including SSH keys or cloud credentials.

## Security Impact

- Threat: prompt-facing MCP conversion can read arbitrary local files when path confinement is bypassed.
- Affected boundary: Grafana `mcp-k6` 0.3.0 before 0.7.0; `convert_playwright_script`; working-directory restriction; symlink handling; server-user-readable files.
- Exploit or incident status: public CVE, GitHub advisory, Grafana advisory, and NVD records; no local exploitation incident is recorded.
- Mitigation state: update to `mcp-k6` 0.7.0 or later and treat MCP prompt file parameters as sandboxed file-authority inputs, not plain text.
- Confidence: high because CVE Services, GitHub, Grafana, and NVD agree on the affected range and patched release.
- Residual risk: agent hosts often hold developer, CI, or cloud credentials that a normal web test conversion feature should never expose.

## Authoritative Sources

- [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json)
- [CVE-2026-89039 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-89039)
- [GitHub advisory GHSA-ffg3-vfrj-4mjj](https://github.com/advisories/GHSA-ffg3-vfrj-4mjj)
- [Grafana advisory CVE-2026-89039](https://grafana.com/security/security-advisories/cve-2026-89039)
- [NVD CVE-2026-89039](https://nvd.nist.gov/vuln/detail/CVE-2026-89039)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [data and privacy](../data-and-privacy/index.md)
- [agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)
- Upstream AI wiki owns broad [Grafana MCP Server](../../../upstream-ai-wiki/mcp-servers/grafana-mcp-server.md) context.

## Open Questions

- Does `mcp-k6` 0.7.0 reject existing symlink-based prompt inputs, or should deployments also review work directories for unsafe symlinks?

## Maintenance Notes

- Created on 2026-10-06 from the [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) after routing broad Grafana and MCP catalog context upstream.
