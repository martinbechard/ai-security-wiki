---
type: "Topic"
title: "mcp-shell Command Policy Bypasses"
description: "Security analysis for CVE-2026-55580, CVE-2026-55581, and CVE-2026-55582 in mcp-shell command policy defaults and allowlists."
tags: ["agent-and-tool-security", "identity-and-access", "infrastructure-and-supply-chain"]
---

# mcp-shell Command Policy Bypasses

## Current Understanding

The [August 25 topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T183709Z.json) and [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) record an mcp-shell advisory family fixed in the [0.6.0 release](https://github.com/sonirico/mcp-shell/releases/tag/v0.6.0). Broad package catalog coverage belongs upstream; this page owns the local shell-tool policy boundary because the three CVEs share one command-authority failure mode.

The shared command-policy synthesis is that shell MCP controls need secure defaults and argument-aware policy, not executable-name allowlists alone:

- [CVE-2026-55580](https://nvd.nist.gov/vuln/detail/CVE-2026-55580) covers the documented bare-binary deployment initializing with security disabled when `MCP_SHELL_SEC_CONFIG_FILE` is unset.
- [CVE-2026-55581](https://nvd.nist.gov/vuln/detail/CVE-2026-55581) covers the Docker policy allowing `/bin/bash` while checking only the first token and missing `-c`.
- [CVE-2026-55582](https://nvd.nist.gov/vuln/detail/CVE-2026-55582) covers default `/usr/bin/git` allowance without blocking shell aliases that start with `!`.

## Security Impact

- Threat: an AI-connected shell MCP server can run unrestricted OS commands as the process user despite intended policy controls.
- Affected boundary: mcp-shell before 0.6.0, including bare-binary defaults and Docker `security.yaml`; NVD records CVE-2026-55580, CVE-2026-55581, and CVE-2026-55582.
- Exploit or incident status: disclosed vulnerability advisories; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: upgrade to 0.6.0 or later, require a security policy at startup, and reject dangerous interpreter and developer-tool argument forms.
- Confidence: high for affected range and fix release from NVD/GitHub evidence.
- Residual risk: any generic shell MCP server remains high-risk when connected to prompt-influenced agents, especially with inherited credentials or writable repositories.

## Control Implications

- Fail closed when command policy is absent, invalid, or unreachable.
- Validate complete argv semantics, including interpreter flags, Git aliases, shell expansion, working directory, and environment inheritance.
- Treat shell-capable MCP servers as privileged execution services with explicit user approval, audit logs, and runtime sandboxing.

## Authoritative Sources

- [August 25 topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T183709Z.json)
- [August 25 late topic news collector source](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json)
- [NVD CVE-2026-55580](https://nvd.nist.gov/vuln/detail/CVE-2026-55580)
- [NVD CVE-2026-55581](https://nvd.nist.gov/vuln/detail/CVE-2026-55581)
- [NVD CVE-2026-55582](https://nvd.nist.gov/vuln/detail/CVE-2026-55582)
- [mcp-shell 0.6.0 release](https://github.com/sonirico/mcp-shell/releases/tag/v0.6.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [coding agent command approval boundaries](coding-agent-command-approval-boundaries.md)
- [agent build and dependency execution boundaries](../infrastructure-and-supply-chain/agent-build-and-dependency-execution-boundaries.md)

## Open Questions

- Does mcp-shell 0.6.0 fully model shell and developer-tool argument semantics, or only patch the known bypass examples?

## Maintenance Notes

- Created on 2026-08-26 from the [August 25 collectors](../../../raw/processed/2026-08-25/ai-security-wiki-topic-news-collector-2026-08-25T233059Z.json) as a closely coupled shell-policy advisory family.
