---
type: "Topic"
title: "mcp-git-tools Command Execution"
description: "Security analysis for CVE-2026-106764 command execution in mcp-git-tools."
tags: ["agent-and-tool-security"]
---

# mcp-git-tools Command Execution

## Current Understanding

[CVE-2026-106764](https://nvd.nist.gov/vuln/detail/CVE-2026-106764), captured by the [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json), reports a remote command-execution path in `@rog0x/mcp-git-tools` 1.0.1. This page retains independent NVD-first evidence pending maintainer remediation.

## Security Impact

- Threat: tool input reaches a host command-execution path.
- Affected boundary: `@rog0x/mcp-git-tools` 1.0.1.
- Exploit or incident status: public disclosure; no local incident is recorded.
- Mitigation state: no maintainer patch is identified; do not expose or trust this package with host authority.
- Confidence: medium because primary advisory detail is not identified.
- Residual risk: repository tooling can bridge agent input into arbitrary process execution.

## Authoritative Sources

- [October 24 collector](../../../raw/processed/2026-10-24/ai-security-wiki-topic-news-collector-2026-10-24T232700Z.json)
- [CVE-2026-106764](https://nvd.nist.gov/vuln/detail/CVE-2026-106764)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)

## Open Questions

- Is there a supported release with a maintainer-provided remediation?

## Maintenance Notes

- Created on 2026-10-24 after verifier-required split from a mixed MCP family.
