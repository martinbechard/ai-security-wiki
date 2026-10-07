---
type: "Topic"
title: "SimpleChat MCP Stdio Personal Plugin RCE"
description: "Security analysis for CVE-2026-105797 authorization-ordering bypass that can spawn MCP stdio processes from SimpleChat personal plugins."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# SimpleChat MCP Stdio Personal Plugin RCE

## Current Understanding

The [October 6 topic collector source](../../../raw/processed/2026-10-06/ai-security-wiki-topic-news-collector-2026-10-06T233203Z.json) records [CVE-2026-105797](https://nvd.nist.gov/vuln/detail/CVE-2026-105797) for SimpleChat versions 0.261.003 and 0.261.027. Broad SimpleChat product context belongs upstream if it becomes durable; this page owns the local personal-plugin authorization ordering and MCP stdio process-spawn boundary.

The CVE record says an authenticated low-privilege user can omit the top-level MCP type in `POST /api/user/plugins`, bypass the non-admin MCP stdio rejection check, and rely on metadata restoration to make the plugin type MCP stdio later. When the personal action tool is invoked, `MCPStdioPlugin.connect` can start an attacker-selected operating-system process under the application service identity. Version 0.261.031 fixes the issue.

## Security Impact

- Threat: plugin creation can authorize one representation of an action while normalized metadata later restores an MCP stdio process-spawn target.
- Affected boundary: SimpleChat 0.261.003 and 0.261.027, personal plugins, `POST /api/user/plugins`, `MCPStdioPlugin.connect`, and low-privilege authenticated users.
- Exploit or incident status: public NVD CVE record; no local exploitation incident is recorded.
- Mitigation state: update to 0.261.031 or later, authorize the final normalized plugin type and command target, and block personal MCP stdio actions for non-admin users unless explicitly delegated.
- Confidence: medium because NVD names endpoint, versions, and fixed version; medium-low for vendor remediation detail until a public SimpleChat advisory or release is captured.
- Residual risk: personal-action systems need post-normalization authorization checks because agent-invoked actions may execute after metadata expansion or factory reconstruction.

## Authoritative Sources

- [October 6 topic collector source](../../../raw/processed/2026-10-06/ai-security-wiki-topic-news-collector-2026-10-06T233203Z.json)
- [NVD CVE-2026-105797](https://nvd.nist.gov/vuln/detail/CVE-2026-105797)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [identity and access](../identity-and-access/index.md)
- [Chainlit MCP setup command and SSRF](chainlit-mcp-setup-command-and-ssrf.md)

## Open Questions

- Which SimpleChat advisory, release note, or patch confirms the normalized plugin-type authorization fix?

## Maintenance Notes

- Created on 2026-10-07 from the [October 6 topic collector source](../../../raw/processed/2026-10-06/ai-security-wiki-topic-news-collector-2026-10-06T233203Z.json) as a focused MCP stdio personal-action authorization leaf.
