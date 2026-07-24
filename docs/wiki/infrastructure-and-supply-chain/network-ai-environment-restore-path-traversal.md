---
type: "Topic"
title: "Network-AI Environment Restore Path Traversal"
description: "Security analysis for CVE-2026-58413, where backup restore IDs crossed environment filesystem boundaries."
---

# Network-AI Environment Restore Path Traversal

## Current Understanding

The [July 22 topic news collector source](../../../raw/processed/2026-07-22/ai-security-wiki-topic-news-collector-2026-07-22T193242-0400.json) records CVE-2026-58413 for Network-AI versions before 5.12.2. The environment restore path was computed from a caller-controlled backup ID without resolving and asserting that the final path remained under `data/<env>/.backups`.

The [GitHub advisory](https://github.com/Jovancoding/Network-AI/security/advisories/GHSA-48x2-6pr9-2jjf) checked during ingest lists the patched version as 5.12.2 and describes backup ID validation plus resolved-path checks. The [July 23 leaf update watch source](../../../raw/processed/2026-07-23/ai-security-wiki-leaf-update-watch-2026-07-23T200300-0400.json) records NVD mitigation evidence as strict `backupId` validation plus dirname containment checking. This advisory complements the later [Network-AI ApprovalInbox authorization bypass](../agent-and-tool-security/network-ai-approval-inbox-authorization-bypass.md): both show that persistent agent runtimes need equal attention to [agent tool filesystem path containment](agent-tool-filesystem-path-containment.md) and approval metadata boundaries.

## Security Impact

- Threat: traversal backup IDs restore arbitrary readable directories into an environment data directory, breaking workspace and environment isolation.
- Affected boundary: Network-AI versions before 5.12.2, `EnvironmentManager.restore`, backup IDs, and environment data directories.
- Exploit or incident status: public CVE and GitHub advisory; no RCE chain was confirmed by the advisory text.
- Mitigation state: patched in 5.12.2 with backup ID validation and resolved-path containment checks.
- Confidence: high for affected and patched versions from the GitHub advisory, NVD-backed raw source, and npm metadata.
- Residual risk: any agent runtime feature that snapshots or restores workspace data needs canonical path validation and tests for traversal sequences.

## Authoritative Sources

- [July 22 topic news collector source](../../../raw/processed/2026-07-22/ai-security-wiki-topic-news-collector-2026-07-22T193242-0400.json)
- [July 23 leaf update watch source](../../../raw/processed/2026-07-23/ai-security-wiki-leaf-update-watch-2026-07-23T200300-0400.json)
- NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-58413
- GitHub advisory: https://github.com/Jovancoding/Network-AI/security/advisories/GHSA-48x2-6pr9-2jjf
- Network-AI 5.12.2 release: https://github.com/Jovancoding/Network-AI/releases/tag/v5.12.2

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)
- [agent and tool security](../agent-and-tool-security/index.md)
- [identity and access](../identity-and-access/index.md)
- Upstream AI development wiki owns general persistent-agent workspace practice.

## Open Questions

- No open Network-AI environment restore questions are recorded.

## Maintenance Notes

- Added from the July 22, 2026 raw collector artifact, GitHub advisory metadata, and npm metadata; enriched from the [July 23 leaf watcher](../../../raw/processed/2026-07-23/ai-security-wiki-leaf-update-watch-2026-07-23T200300-0400.json) with NVD mitigation evidence.
