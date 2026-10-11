---
type: "Topic"
title: "Phi Symlink Workspace Write Bypass"
description: "Security analysis for CVE-2026-108599 symlink bypass of Phi lexical workspace checks."
tags: ["agent-and-tool-security"]
---

# Phi Symlink Workspace Write Bypass

## Current Understanding

The [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) records [CVE-2026-108599](https://cveawg.mitre.org/api/cve/CVE-2026-108599) for Phi 0.3.0 through 0.28.4. This page owns the symlink-specific workspace containment boundary, separate from the unchecked workdir flaw.

Malicious repositories can bypass lexical-only path checks with symlinks, allowing file writes outside the intended workspace root. The durable security issue is canonical filesystem resolution, not broad Phi framework behavior.

## Security Impact

- Threat: repository-controlled symlinks can redirect workspace-authorized writes outside the workspace.
- Affected boundary: Phi 0.3.0 through 0.28.4, lexical path checks, symlink resolution, repository workspaces, and file-write tools.
- Exploit or incident status: public CVE Services and NVD evidence; no confirmed exploitation incident is recorded locally.
- Mitigation state: resolve real paths before writes, reject symlink escapes, open files with safe root-relative APIs where available, and test malicious repository layouts.
- Confidence: high for the symlink containment flaw from CVE evidence.
- Residual risk: agent workspace gates need filesystem-aware resolution because repository content can alter path meaning after lexical checks pass.

## Authoritative Sources

- [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json)
- [CVE-2026-108599 record](https://cveawg.mitre.org/api/cve/CVE-2026-108599)
- [NVD CVE-2026-108599](https://nvd.nist.gov/vuln/detail/CVE-2026-108599)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Phi Workdir Workspace Write Bypass](phi-workdir-workspace-write-bypass.md)
- [Google MCP Toolbox allowedLocalRoots symlink bypass](google-mcp-toolbox-allowedlocalroots-symlink-bypass.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-10-11 from the [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) after upstream index routing kept broad product and framework context outside the local security wiki.
