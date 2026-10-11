---
type: "Topic"
title: "open-multi-agent Dangling Symlink Sandbox Escape"
description: "Security analysis for CVE-2026-108600 dangling-symlink file_write sandbox escape in open-multi-agent."
tags: ["agent-and-tool-security"]
---

# open-multi-agent Dangling Symlink Sandbox Escape

## Current Understanding

The [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) records [CVE-2026-108600](https://cveawg.mitre.org/api/cve/CVE-2026-108600) for open-multi-agent, published as `@open-multi-agent/core`, 1.5.0 through 1.21.2. Broad framework catalog context belongs upstream; this page owns dangling-symlink sandbox-root escape analysis.

Dangling symlinks can let `file_write` escape sandbox roots. This differs from Phi because the affected product and write primitive are separate, so it gets its own durable leaf even though the same October collector grouped it with workspace containment issues.

## Security Impact

- Threat: file_write operations can escape sandbox roots through dangling symlink handling.
- Affected boundary: @open-multi-agent/core 1.5.0 through 1.21.2, dangling symlinks, sandbox roots, and agent file-write tools.
- Exploit or incident status: public CVE Services and NVD evidence; no confirmed exploitation incident is recorded locally.
- Mitigation state: patch to a fixed release when available, resolve target parents and final paths under the sandbox root, and test dangling symlink creation/write sequences.
- Confidence: high for affected component and containment class from CVE evidence.
- Residual risk: agent file-write sandboxes need race-aware and symlink-aware path resolution because incomplete filesystem objects can change authorization meaning.

## Authoritative Sources

- [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json)
- [CVE-2026-108600 record](https://cveawg.mitre.org/api/cve/CVE-2026-108600)
- [NVD CVE-2026-108600](https://nvd.nist.gov/vuln/detail/CVE-2026-108600)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Phi Symlink Workspace Write Bypass](phi-symlink-workspace-write-bypass.md)
- [mark3labs mcp-filesystem-server dangling symlink traversal](mark3labs-mcp-filesystem-server-dangling-symlink-traversal.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-10-11 from the [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) after upstream index routing kept broad product and framework context outside the local security wiki.
