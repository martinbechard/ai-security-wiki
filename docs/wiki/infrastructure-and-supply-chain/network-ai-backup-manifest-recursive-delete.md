---
type: "Topic"
title: "Network-AI Backup Manifest Recursive Delete"
description: "Security analysis for CVE-2026-58484, where poisoned backup manifests can trigger arbitrary recursive deletion."
---

# Network-AI Backup Manifest Recursive Delete

## Current Understanding

The [July 25 topic news collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json) records SentinelOne's 2026-07-24 publication of CVE-2026-58484 for Network-AI versions before 5.12.2. The [SentinelOne entry](https://www.sentinelone.com/vulnerability-database/cve-2026-58484/) and [GitHub advisory](https://github.com/advisories/GHSA-2fmp-9rvw-hc96) describe `EnvironmentManager.listBackups` trusting the `path` field in backup manifests before `pruneBackups` passes that path to recursive deletion.

The [July 26 leaf update watch source](../../../raw/processed/2026-07-26/ai-security-wiki-leaf-update-watch-2026-07-26T200447-0400.json) adds [Tenable](https://www.tenable.com/cve/CVE-2026-58484) as in-window corroboration for the recursive-delete boundary. This strengthens the destructive-operation lens without changing the fixed-version boundary.

Broad Network-AI and [Claude Code](../../../upstream-ai-wiki/developer-tools/claude-code.md) context belongs upstream. The local security issue is runtime metadata authority: backup manifests, restore IDs, and environment snapshots must not become trusted filesystem actions merely because they were found in an expected directory.

## Security Impact

- Threat: a local actor with backup-manifest write access can cause arbitrary writable paths to be recursively deleted under the Network-AI process identity.
- Affected boundary: Network-AI and Network-AI Claude Code plugin versions before 5.12.2, `EnvironmentManager`, `data/<env>/.backups` manifests, backup pruning, and recursive `rmSync`.
- Exploit or incident status: public [SentinelOne](https://www.sentinelone.com/vulnerability-database/cve-2026-58484/) and [GitHub advisory](https://github.com/advisories/GHSA-2fmp-9rvw-hc96) records; no active exploitation was identified in the [collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json).
- Mitigation state: upgrade to 5.12.2 or later, validate backup IDs and manifest paths against resolved backup directories, and monitor backup manifest writes plus prune executions.
- Confidence: high for affected range, technical boundary, and fixed version because [SentinelOne](https://www.sentinelone.com/vulnerability-database/cve-2026-58484/) and the [GitHub advisory](https://github.com/advisories/GHSA-2fmp-9rvw-hc96) agree.
- Residual risk: agent runtimes that persist snapshots can turn local metadata writes into destructive operations if restore, prune, or cleanup actions trust serialized paths.

## Authoritative Sources

- [July 25 topic news collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json)
- [July 26 leaf update watch source](../../../raw/processed/2026-07-26/ai-security-wiki-leaf-update-watch-2026-07-26T200447-0400.json)
- SentinelOne vulnerability database: https://www.sentinelone.com/vulnerability-database/cve-2026-58484/
- GitHub advisory: https://github.com/advisories/GHSA-2fmp-9rvw-hc96
- Tenable CVE record: https://www.tenable.com/cve/CVE-2026-58484

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
- [Network-AI AgentRuntime sandbox path traversal](network-ai-agentruntime-sandbox-path-traversal.md)
- [incident response](../incident-response/index.md)
- Upstream AI wiki owns broad Network-AI and [Claude Code](../../../upstream-ai-wiki/developer-tools/claude-code.md) context.

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Added from the [July 25 topic news collector source](../../../raw/processed/2026-07-25/ai-security-wiki-topic-news-collector-2026-07-25T193052-0400.json); enriched from the [July 26 leaf watcher](../../../raw/processed/2026-07-26/ai-security-wiki-leaf-update-watch-2026-07-26T200447-0400.json). Keep this page separate from restore traversal because the failure is destructive metadata trust during pruning.
