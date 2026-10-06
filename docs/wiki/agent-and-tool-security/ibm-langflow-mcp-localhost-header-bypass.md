---
type: "Topic"
title: "IBM Langflow MCP Localhost Header Bypass"
description: "Security analysis for CVE-2026-9186 localhost-only MCP configuration bypass in IBM Langflow."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# IBM Langflow MCP Localhost Header Bypass

## Current Understanding

The [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json) records CVE-2026-9186 for IBM Langflow OSS 1.0.0 through 1.11.2. Broad Langflow product coverage belongs upstream; this page owns MCP configuration locality, proxy-header trust, and IDE tool-authority persistence.

[CVE-2026-9186](https://cveawg.mitre.org/api/cve/CVE-2026-9186), [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-9186), and [IBM support advisory 7285646](https://www.ibm.com/support/pages/node/7285646) describe an authenticated remote bypass of localhost-only MCP configuration installation by spoofing `X-Forwarded-For: 127.0.0.1`. The resulting write path can install configuration into IDE files such as `~/.cursor/mcp.json`.

The [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) records [CVE-2026-105741](https://cveawg.mitre.org/api/cve/CVE-2026-105741) in the same MCP configuration locality family. The CVE covers Langflow 1.5.0 until 1.10.3, where authenticated remote attackers could spoof `X-Forwarded-For: 127.0.0.1` against `POST /api/v1/mcp/project/{project_id}/install` and write or overwrite MCP client configuration files on the server filesystem.

## Security Impact

- Threat: proxy-header trust lets remote callers reach an endpoint intended only for localhost configuration.
- Affected boundary: IBM Langflow OSS 1.0.0 through 1.11.2 for CVE-2026-9186; Langflow 1.5.0 until 1.10.3 for CVE-2026-105741; MCP configuration installation; spoofable proxy headers; IDE or MCP client configuration files.
- Exploit or incident status: public CVE and [IBM support advisory 7285646](https://www.ibm.com/support/pages/node/7285646); no local exploitation evidence is recorded.
- Mitigation state: bind local-only decisions to the actual socket peer or a trusted proxy chain, then approval-gate IDE MCP configuration writes.
- Confidence: high for affected versions and bypass shape from direct CVE evidence.
- Residual risk: MCP configuration files can persist new tool authority after the original Langflow request is gone.

## Authoritative Sources

- [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json)
- [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json)
- [CVE-2026-9186](https://cveawg.mitre.org/api/cve/CVE-2026-9186)
- [CVE-2026-105741 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-105741)
- [NVD CVE-2026-9186](https://nvd.nist.gov/vuln/detail/CVE-2026-9186)
- [IBM support advisory 7285646](https://www.ibm.com/support/pages/node/7285646)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent action runtime hooks](agent-action-runtime-hooks.md)

## Open Questions

- Which Langflow release changes the localhost trust decision and how are existing MCP configuration writes remediated?

## Maintenance Notes

- Created on 2026-09-04 from the [September 4 topic collector source](../../../raw/processed/2026-09-04/ai-security-wiki-topic-news-collector-2026-09-04T233156Z.json).
- Updated on 2026-10-06 with CVE-2026-105741 evidence; the digest links this existing MCP locality boundary instead of creating a duplicate Langflow page.
