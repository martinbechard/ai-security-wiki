---
type: "Topic"
title: "Network-AI AgentRuntime Sandbox Path Traversal"
description: "Security analysis for CVE-2026-58481, where raw string prefix checks permit out-of-sandbox file reads."
---

# Network-AI AgentRuntime Sandbox Path Traversal

## Current Understanding

The [July 25 topic news collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json) records SentinelOne's 2026-07-24 publication of CVE-2026-58481 for Network-AI versions before 5.12.2. The [SentinelOne entry](https://www.sentinelone.com/vulnerability-database/cve-2026-58481/) and [GitHub advisory](https://github.com/advisories/GHSA-jvcm-f35g-w78p) describe `AgentRuntime.readFile` and `AgentRuntime.listDir` checking path containment with raw string prefixes, so a base such as `/tmp/network-ai-sandbox` could match sibling paths such as `/tmp/network-ai-sandbox_evil`.

Broad Network-AI and [Claude Code](../../../upstream-ai-wiki/developer-tools/claude-code.md) context belongs upstream. The local security issue is [agent tool filesystem path containment](agent-tool-filesystem-path-containment.md): sandbox enforcement must compare canonical resolved paths and path components, not string prefixes.

## Security Impact

- Threat: an agent session with apparent sandboxed file access can read or list files outside the intended sandbox.
- Affected boundary: Network-AI multi-agent orchestrator versions before 5.12.2, `AgentRuntime.readFile`, `AgentRuntime.listDir`, and sandbox directory containment.
- Exploit or incident status: public [SentinelOne](https://www.sentinelone.com/vulnerability-database/cve-2026-58481/) and [GitHub advisory](https://github.com/advisories/GHSA-jvcm-f35g-w78p) records; no active exploitation was identified in the [collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json).
- Mitigation state: upgrade to 5.12.2 or later and test sibling-prefix, symlink, absolute-path, and traversal cases for every file-capable tool.
- Confidence: high for affected range, vulnerable checks, and fixed version because [SentinelOne](https://www.sentinelone.com/vulnerability-database/cve-2026-58481/) and the [GitHub advisory](https://github.com/advisories/GHSA-jvcm-f35g-w78p) agree.
- Residual risk: custom file tools can repeat the prefix-check failure even when the upstream runtime is patched.

## Authoritative Sources

- [July 25 topic news collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json)
- SentinelOne vulnerability database: https://www.sentinelone.com/vulnerability-database/cve-2026-58481/
- GitHub advisory: https://github.com/advisories/GHSA-jvcm-f35g-w78p

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)
- [Network-AI environment restore path traversal](network-ai-environment-restore-path-traversal.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- Upstream AI wiki owns broad Network-AI and [Claude Code](../../../upstream-ai-wiki/developer-tools/claude-code.md) context.

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Added from the [July 25 topic news collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json); preserve the distinction between the in-window SentinelOne publication date and the older GitHub advisory date.
