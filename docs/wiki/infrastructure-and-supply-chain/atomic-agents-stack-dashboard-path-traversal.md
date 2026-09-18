---
type: "Topic"
title: "atomic-agents-stack Dashboard Path Traversal"
description: "Security analysis for CVE-2026-91989 dashboard path traversal outside the atomic-agents-stack agents root."
tags: ["infrastructure-and-supply-chain", "data-and-privacy"]
---

# atomic-agents-stack Dashboard Path Traversal

## Current Understanding

The [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) records CVE-2026-91989 for atomic-agents-stack before 1.1.0. General framework orchestration and dashboard context belongs upstream or to the AI development wiki; this page owns the local agent-root filesystem containment boundary.

The CVE says the dashboard HTTP server accepted `../` path segments in `DashboardHandler.do_GET`, bypassing containment checks and allowing remote attackers to read files outside the intended `agents_root` directory.

## Security Impact

- Threat: dashboard file serving can expose files outside an agent workspace root.
- Affected boundary: atomic-agents-stack before 1.1.0, dashboard HTTP server, `DashboardHandler.do_GET`, and `agents_root` containment.
- Exploit or incident status: public CVE record; no local exploitation incident is recorded.
- Mitigation state: upgrade to 1.1.0 or later and authorize resolved paths after normalization and symlink handling.
- Confidence: high for CVE publication and affected boundary.
- Residual risk: agent dashboards often sit near prompts, task state, credentials, and generated artifacts, so a generic path traversal can become AI-context disclosure.

## Authoritative Sources

- [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json)
- [CVE-2026-91989 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-91989)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [Agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)
- [atomic-agents-stack cleartext MCP catalog RCE](atomic-agents-stack-cleartext-mcp-catalog-rce.md)

## Open Questions

- Which dashboard-served paths can contain agent credentials, memory, prompts, or generated task artifacts?

## Maintenance Notes

- Created on 2026-09-18 from the [September 17 topic collector](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) as an atomic-agents-stack filesystem-containment leaf.
