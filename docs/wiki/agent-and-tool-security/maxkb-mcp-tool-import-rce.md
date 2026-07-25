---
type: "Topic"
title: "MaxKB MCP Tool Import Remote Code Execution"
description: "Security analysis for CVE-2026-54149, where MaxKB MCP tool import and AI Chat referencing can execute attacker-controlled commands."
---

# MaxKB MCP Tool Import Remote Code Execution

## Current Understanding

The [July 23 topic news collector source](../../../raw/processed/2026-07-23/ai-security-wiki-topic-news-collector-2026-07-23T193409-0400.json) records CVE-2026-54149 for MaxKB before 2.10.0-lts. The vulnerability involves inconsistent validation of MCP transport type in tool import and AI Chat referencing mode: an authenticated user can import a `.tool` file using `stdio` transport and malicious commands, then trigger execution through an AI Chat node and `MultiServerMCPClient`. The [July 24 leaf update watch source](../../../raw/processed/2026-07-24/ai-security-wiki-leaf-update-watch-2026-07-24T200235-0400.json) adds [SentinelOne's in-window CVE page](https://www.sentinelone.com/vulnerability-database/cve-2026-54149/) as corroboration for the fixed 2.10.0-lts boundary.

Broad MaxKB product context belongs upstream. The local security issue is the MCP transport and tool-import boundary: accepting tool configuration as data can become local process execution when `stdio` transport and command payloads are not tightly allowed by role, source, and execution context.

## Security Impact

- Threat: authenticated remote code execution through imported MCP tool configuration.
- Affected boundary: MaxKB before 2.10.0-lts, tool import validation, AI Chat MCP referencing, `stdio` transport, and command execution through `MultiServerMCPClient`.
- Exploit or incident status: public vulnerability database entry and [maintainer advisory](https://github.com/1Panel-dev/MaxKB/security/advisories/GHSA-4pr3-9xhm-98x5) corroboration; no active exploitation was identified in the raw source.
- Mitigation state: fixed in 2.10.0-lts according to the [SentinelOne vulnerability database](https://www.sentinelone.com/vulnerability-database/cve-2026-54149/); restrict MCP tool import permissions, block `stdio` transport from untrusted imports, and review existing imported tools for command payloads.
- Confidence: medium-high because the in-window [SentinelOne page](https://www.sentinelone.com/vulnerability-database/cve-2026-54149/) is corroborated by the [maintainer advisory](https://github.com/1Panel-dev/MaxKB/security/advisories/GHSA-4pr3-9xhm-98x5) and [Debian tracker](https://security-tracker.debian.org/tracker/CVE-2026-54149), while the maintainer advisory predates the collector window.
- Residual risk: authenticated tool authors or compromised accounts can turn AI assistant extensibility into process execution if MCP transports are accepted without allowlisting and review.

## Authoritative Sources

- [July 23 topic news collector source](../../../raw/processed/2026-07-23/ai-security-wiki-topic-news-collector-2026-07-23T193409-0400.json)
- [July 24 leaf update watch source](../../../raw/processed/2026-07-24/ai-security-wiki-leaf-update-watch-2026-07-24T200235-0400.json)
- SentinelOne vulnerability database: https://www.sentinelone.com/vulnerability-database/cve-2026-54149/
- GitHub advisory: https://github.com/1Panel-dev/MaxKB/security/advisories/GHSA-4pr3-9xhm-98x5
- Debian Security Tracker: https://security-tracker.debian.org/tracker/CVE-2026-54149

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [infrastructure and supply chain](../infrastructure-and-supply-chain/index.md)
- [identity and access](../identity-and-access/index.md)
- Upstream AI development wiki owns general MCP tool integration practice.

## Open Questions

- Should MCP `stdio` transport in imported tools require a separate reusable local control leaf after more affected products are observed?

## Maintenance Notes

- Added from the [July 23, 2026 raw collector artifact](../../../raw/processed/2026-07-23/ai-security-wiki-topic-news-collector-2026-07-23T193409-0400.json); enriched from the [July 24 leaf watcher](../../../raw/processed/2026-07-24/ai-security-wiki-leaf-update-watch-2026-07-24T200235-0400.json); preserve the distinction between in-window vulnerability database signal and older [maintainer advisory](https://github.com/1Panel-dev/MaxKB/security/advisories/GHSA-4pr3-9xhm-98x5) evidence.
