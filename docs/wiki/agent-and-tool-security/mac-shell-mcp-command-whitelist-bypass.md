---
type: "Topic"
title: "mac-shell-mcp Command Whitelist Bypass"
description: "Security analysis for CVE-2026-108953, where mac-shell-mcp command whitelist checks can be bypassed with shell metacharacters."
tags: ["agent-and-tool-security"]
---

# mac-shell-mcp Command Whitelist Bypass

## Current Understanding

The [October 12 topic collector source](../../../raw/processed/2026-10-12/ai-security-wiki-topic-news-collector-2026-10-12T233447Z.json) records [CVE-2026-108953](https://nvd.nist.gov/vuln/detail/CVE-2026-108953) for mac-shell-mcp before 2.0.0. Broad MCP server catalog context belongs upstream; this page owns the local shell-command whitelist boundary.

The CVE evidence says an MCP client can inject shell metacharacters into `execute_command` arguments. An allowed command such as `pwd` can be paired with an argument like `;` to execute forbidden commands as the server user without the intended approval.

## Security Impact

- Threat: model-influenced MCP clients can bypass command allowlists and run arbitrary shell commands.
- Affected boundary: mac-shell-mcp before 2.0.0, `execute_command` argument handling, command whitelist enforcement, and local shell process authority.
- Exploit or incident status: public CVE, VulnCheck advisory, GitHub issue, and patch commit evidence; no exploitation incident is recorded locally.
- Mitigation state: update to 2.0.0 or later and parse command arguments without shell metacharacter expansion.
- Confidence: high for affected range and patch reference from NVD-backed source evidence.
- Residual risk: executable-name allowlists remain insufficient for shell-backed MCP tools unless argv, interpreter flags, working directory, and environment are constrained together.

## Control Implications

- Execute allowed commands without invoking a shell when possible.
- Validate complete argv semantics and reject metacharacters, shell operators, and interpreter escape forms.
- Require explicit human approval for local shell MCP tools that can affect the host environment.

## Authoritative Sources

- [October 12 topic collector source](../../../raw/processed/2026-10-12/ai-security-wiki-topic-news-collector-2026-10-12T233447Z.json)
- [NVD CVE-2026-108953](https://nvd.nist.gov/vuln/detail/CVE-2026-108953)
- [mac-shell-mcp repository](https://github.com/cfdude/mac-shell-mcp)
- [mac-shell-mcp patch commit](https://github.com/cfdude/mac-shell-mcp/commit/932ce733cde07bb30b1f186303e6692dbb5d087a)
- [VulnCheck mac-shell-mcp advisory](https://www.vulncheck.com/advisories/mac-shell-mcp-before-2.0.0-os-command-injection-via-execute-command-arguments)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [mcp-shell command policy bypasses](mcp-shell-command-policy-bypasses.md)
- [coding agent command approval boundaries](coding-agent-command-approval-boundaries.md)

## Open Questions

- Which mac-shell-mcp 2.0.0 regression tests prove shell metacharacters cannot escape the intended command whitelist?

## Maintenance Notes

- Created on 2026-10-13 from the October 12 topic collector as a separate mac-shell-mcp leaf, not a duplicate of the older mcp-shell advisory family.
