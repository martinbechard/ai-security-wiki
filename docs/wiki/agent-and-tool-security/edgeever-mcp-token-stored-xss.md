---
type: "Topic"
title: "EdgeEver MCP-Token Stored XSS"
description: "Security analysis for CVE-2026-109557 and CVE-2026-109558, where MCP-writeable EdgeEver content can execute in privileged desktop UI contexts."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# EdgeEver MCP-Token Stored XSS

## Current Understanding

The [October 13 topic collector source](../../../raw/processed/2026-10-13/ai-security-wiki-topic-news-collector-2026-10-13T232603Z.json) records [CVE-2026-109557](https://nvd.nist.gov/vuln/detail/CVE-2026-109557) and [CVE-2026-109558](https://nvd.nist.gov/vuln/detail/CVE-2026-109558) for EdgeEver through 1.112.0. Broad EdgeEver product context belongs upstream; this page owns the MCP-writeable content to privileged desktop bridge boundary.

The CVE evidence describes two closely coupled stored-XSS paths. Notebook names or memo titles set through MCP tools can become stored script, and template Markdown rendered as raw HTML in `TemplatesPane` can let an API or MCP token holder execute script when another user previews a template.

## Security Impact

- Threat: MCP or API write authority over notebook, memo, or template content can become desktop UI script execution.
- Affected boundary: EdgeEver through 1.112.0 for notebook and memo title XSS; EdgeEver 1.6.0 through 1.112.0 for template Markdown rendering.
- Exploit or incident status: public CVE records; no confirmed exploitation incident is recorded locally.
- Mitigation state: fixed version was not visible in the collector evidence; deployments should treat MCP-writeable text as untrusted and require output encoding before privileged desktop rendering.
- Confidence: high for affected ranges and XSS paths from the NVD/CVE records; medium for remediation because fixed-version evidence remains open.
- Residual risk: desktop bridges amplify stored XSS when rendered content can access session tokens or privileged bridge APIs.

## Control Implications

- Sanitize and encode all MCP-writeable content before rendering in desktop or admin UI surfaces.
- Separate content-authoring tokens from bridge-capable session contexts.
- Add regression tests where agent-written notebook, memo, and template fields are rendered by another user.

## Authoritative Sources

- [October 13 topic collector source](../../../raw/processed/2026-10-13/ai-security-wiki-topic-news-collector-2026-10-13T232603Z.json)
- [NVD CVE-2026-109557](https://nvd.nist.gov/vuln/detail/CVE-2026-109557)
- [NVD CVE-2026-109558](https://nvd.nist.gov/vuln/detail/CVE-2026-109558)
- [CVE Services CVE-2026-109557](https://cveawg.mitre.org/api/cve/CVE-2026-109557)
- [CVE Services CVE-2026-109558](https://cveawg.mitre.org/api/cve/CVE-2026-109558)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [data and privacy](../data-and-privacy/index.md)

## Open Questions

- Which EdgeEver release or advisory identifies the fixed version and bridge-access impact for each XSS path?

## Maintenance Notes

- Created on 2026-10-14 from the October 13 topic collector as one content-to-desktop-bridge XSS family because both CVEs share the same MCP/API-token write-to-render boundary.
