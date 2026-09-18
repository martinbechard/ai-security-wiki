---
type: "Topic"
title: "AI Agent Automation File-Step Path Traversal"
description: "Security analysis for CVE-2026-54520 workflow file-step path traversal in AI Agent Automation."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# AI Agent Automation File-Step Path Traversal

## Current Understanding

The [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) records CVE-2026-54520 for AI Agent Automation before 0.9.1. Broad workflow-authoring practice belongs upstream or to the AI development wiki; this page owns the local filesystem authority boundary for workflow file steps.

The CVE says workflow file steps resolved user-controlled paths without ensuring they remained in an approved workflow directory. Authenticated workflow authors could perform read or write traversal outside the intended directory.

## Security Impact

- Threat: workflow authors can use file steps to read or write outside the approved workflow directory.
- Affected boundary: AI Agent Automation before 0.9.1, workflow file steps, approved workflow directory containment, and authenticated author permissions.
- Exploit or incident status: public CVE record; no local exploitation incident is recorded.
- Mitigation state: upgrade to 0.9.1 or later and authorize normalized, resolved paths against the approved workflow directory before every read or write.
- Confidence: high for CVE publication and traversal shape.
- Residual risk: agent workflow builders often mix business automation with filesystem access, so authenticated-author trust still needs path containment and audit trails.

## Authoritative Sources

- [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json)
- [CVE-2026-54520 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-54520)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [Agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)
- [agent and tool security](../agent-and-tool-security/index.md)

## Open Questions

- Which workflow file-step actions can overwrite executable scripts, prompt templates, or configuration files outside the approved workflow directory?

## Maintenance Notes

- Created on 2026-09-18 from the [September 17 topic collector](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) as a workflow filesystem-containment leaf.
