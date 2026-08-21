---
type: "Topic"
title: "PyCharm Jupyter MCP Unauthenticated Code Execution"
description: "Security analysis for CVE-2026-75060 unauthenticated Jupyter MCP tool execution in PyCharm."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# PyCharm Jupyter MCP Unauthenticated Code Execution

## Current Understanding

The [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) records CVE-2026-75060 for JetBrains PyCharm before 2026.2.1. Broad IDE and developer-tool practice belongs upstream; this page owns the local MCP authentication boundary for notebook-connected tools.

[NVD CVE-2026-75060](https://nvd.nist.gov/vuln/detail/CVE-2026-75060) states that PyCharm allowed code execution via unauthenticated Jupyter MCP tools. The vendor fixed-issues page is referenced by the source but exact tool, listener, and build details still need direct confirmation before this page claims a more specific exploit path.

The [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json) confirms in-window [CVE Program](https://www.cve.org/CVERecord?id=CVE-2026-75060) and [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-75060) publication and keeps [JetBrains' fixed-issues page](https://www.jetbrains.com/privacy-security/issues-fixed/) as the primary fixed-build source for PyCharm 2026.2.1.

## Security Impact

- Threat: unauthenticated MCP endpoints in an IDE can bridge notebook, project, and local runtime authority into code execution.
- Affected boundary: JetBrains PyCharm before 2026.2.1 and Jupyter MCP tool surfaces.
- Exploit or incident status: public CVE record; no local exploitation evidence is recorded.
- Mitigation state: update to PyCharm 2026.2.1 or later and restrict local MCP listener reachability.
- Confidence: medium-high because NVD is terse but vendor fixed-issues evidence exists.
- Residual risk: IDE-integrated tool servers need independent authentication even when they are expected to be local-only.

## Authoritative Sources

- [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json)
- [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json)
- [NVD CVE-2026-75060](https://nvd.nist.gov/vuln/detail/CVE-2026-75060)
- [JetBrains fixed issues](https://www.jetbrains.com/privacy-security/issues-fixed/)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [local agent execution and processing boundaries](local-agent-execution-and-processing-boundaries.md)
- [AI development workstation containment](../infrastructure-and-supply-chain/ai-development-workstation-containment.md)

## Open Questions

- Which PyCharm fixed-issues entry names CVE-2026-75060 and the exact MCP/Jupyter listener boundary?

## Maintenance Notes

- Created on 2026-08-19 from the [August 18 topic collector](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) with a conservative affected-boundary statement.
- Updated on 2026-08-20 from the [August 20 leaf update watch source](../../../raw/processed/2026-08-20/ai-security-wiki-leaf-update-watch-20260821T000216Z.json) with additional publication confirmation and fixed-build source routing.
