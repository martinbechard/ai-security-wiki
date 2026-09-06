---
type: "Topic"
title: "cli-mcp-server Command Allowlist Bypass"
description: "Security analysis for CVE-2026-85660 shell-substitution bypass in cli-mcp-server command allowlist validation."
tags: ["agent-and-tool-security", "identity-and-access", "infrastructure-and-supply-chain"]
---

# cli-mcp-server Command Allowlist Bypass

## Current Understanding

The [September 5 topic collector source](../../../raw/processed/2026-09-05/ai-security-wiki-topic-news-collector-2026-09-05T233231Z.json) records CVE-2026-85660 for `cli-mcp-server` 0.2.5. Broad MCP server catalog coverage belongs upstream; this page owns the local shell-tool execution boundary where MCP command policy fails to model shell substitution.

[CVE-2026-85660](https://cveawg.mitre.org/api/cve/CVE-2026-85660) and [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-85660) describe a bypass in `_validate_command_with_operators` when `ALLOW_SHELL_OPERATORS` is enabled. Shell command substitution forms such as `$()` or backticks can execute commands outside `ALLOWED_COMMANDS`, so the apparent allowlist does not constrain the final shell program graph.

The checked [PyPI package metadata](https://pypi.org/project/cli-mcp-server/) still lists 0.2.5 as the latest version, and the public [issue #17](https://github.com/MladenSU/cli-mcp-server/issues/17) remains open. Treat mitigation as configuration containment until a fixed version or maintainer patch is identified: keep `ALLOW_SHELL_OPERATORS` disabled for agent-facing deployments, sandbox the process, and require parser-equivalent validation before enabling shell syntax.

## Security Impact

- Threat: prompt-influenced MCP shell calls can execute non-allowlisted commands through command substitution.
- Affected boundary: MladenSU `cli-mcp-server` 0.2.5 with `ALLOW_SHELL_OPERATORS` enabled.
- Exploit or incident status: public CVE and open public issue; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: fixed version not yet identified; disable shell operators, run the server with least-privilege OS identity and filesystem/network sandboxing, and validate the final shell parse rather than the leading command token.
- Confidence: high for the allowlist bypass from direct CVE and NVD evidence; medium-high for mitigation status because PyPI and GitHub release checks found no later packaged release.
- Residual risk: any agent-connected command server that accepts shell metacharacters needs shell-semantics parity, not string prefix checks, before user approval can be meaningful.

## Authoritative Sources

- [September 5 topic collector source](../../../raw/processed/2026-09-05/ai-security-wiki-topic-news-collector-2026-09-05T233231Z.json)
- [CVE-2026-85660](https://cveawg.mitre.org/api/cve/CVE-2026-85660)
- [NVD CVE-2026-85660](https://nvd.nist.gov/vuln/detail/CVE-2026-85660)
- [cli-mcp-server issue #17](https://github.com/MladenSU/cli-mcp-server/issues/17)
- [cli-mcp-server PyPI package](https://pypi.org/project/cli-mcp-server/)

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

- Which `cli-mcp-server` release or commit closes CVE-2026-85660 and rejects shell substitution before command execution?

## Maintenance Notes

- Created on 2026-09-05 from the [September 5 topic collector source](../../../raw/processed/2026-09-05/ai-security-wiki-topic-news-collector-2026-09-05T233231Z.json) after live PyPI and GitHub checks found 0.2.5 as the latest packaged release and the public issue still open.
