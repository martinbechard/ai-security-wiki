---
type: "Topic"
title: "SiYuan MCP Database Clean Path Traversal"
description: "Security analysis for CVE-2026-74798 path traversal and deletion through SiYuan database_clean MCP tool."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# SiYuan MCP Database Clean Path Traversal

## Current Understanding

The [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) records [CVE-2026-74798](https://nvd.nist.gov/vuln/detail/CVE-2026-74798) for SiYuan before 3.7.4. Broad [SiYuan MCP endpoint authorization risk](../../../upstream-ai-wiki/techniques/siyuan-mcp-endpoint-authorization-risk.md) belongs upstream; this page owns the local authenticated MCP file traversal and deletion boundary.

[SiYuan MCP debug key and file boundary](siyuan-mcp-debug-key-and-file-boundary.md) routes the broader SiYuan advisory family. This leaf is narrower: an authenticated MCP client can abuse path traversal in the `database_clean` MCP tool to copy arbitrary readable files into history and delete originals.

The [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json) adds [CVE Program](https://www.cve.org/CVERecord?id=CVE-2026-74798), [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-74798), and [GitHub advisory](https://github.com/siyuan-note/siyuan/security/advisories/GHSA-43jx-gxq4-jpjc) evidence that `database_clean` checked only for an empty `id` before path construction.

## Security Impact

- Threat: an authenticated MCP client can turn a maintenance tool into arbitrary readable-file movement and deletion.
- Affected boundary: SiYuan before 3.7.4; `database_clean`, history storage, and local file paths reachable by the process.
- Exploit or incident status: public NVD and GitHub advisory evidence; no local incident evidence is recorded.
- Mitigation state: upgrade to 3.7.4 or later and constrain MCP file operations to canonicalized allowed paths.
- Confidence: high for affected version and CVE mechanics from collector evidence.
- Residual risk: note-system history storage can become a staging area for copied files if file moves are not audited.

## Authoritative Sources

- [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json)
- [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json)
- [NVD CVE-2026-74798](https://nvd.nist.gov/vuln/detail/CVE-2026-74798)
- [GitHub advisory GHSA-43jx-gxq4-jpjc](https://github.com/siyuan-note/siyuan/security/advisories/GHSA-43jx-gxq4-jpjc)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [SiYuan MCP debug key and file boundary](siyuan-mcp-debug-key-and-file-boundary.md)
- [agent tool filesystem path containment](../infrastructure-and-supply-chain/agent-tool-filesystem-path-containment.md)

## Open Questions

- Which SiYuan audit records show `database_clean` source and destination paths after upgrade?

## Maintenance Notes

- Created on 2026-08-19 after verifier correction split the SiYuan advisory family.
- Updated on 2026-08-20 from the [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json) with additional advisory evidence for the `database_clean` path-construction boundary.
