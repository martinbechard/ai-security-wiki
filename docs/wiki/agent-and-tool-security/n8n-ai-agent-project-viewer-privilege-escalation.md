---
type: "Topic"
title: "n8n AI Agent Project Viewer Privilege Escalation"
description: "Security analysis for CVE-2026-65015, where a read-only n8n Project Viewer can execute AI agent node tools with project credentials."
---

# n8n AI Agent Project Viewer Privilege Escalation

## Current Understanding

The [July 24 topic news collector source](../../../raw/processed/2026-07-24/ai-security-wiki-topic-news-collector-2026-07-24T193213-0400.json) records CVE-2026-65015 for n8n AI Agents before 2.30.1. The [GitLab advisory](https://advisories.gitlab.com/npm/n8n/CVE-2026-65015/) and [GitHub advisory](https://github.com/advisories/GHSA-w46p-w7w2-fr9g) describe a flaw where a read-only Project Viewer can chat with an agent that has node tools enabled and execute arbitrary nodes through the agent's `run_node_tool` path using project credentials.

Broad n8n product and automation-platform context belongs upstream. The local security issue is final tool-action authorization: an AI agent's tool scope cannot substitute for the requesting user's effective permission on the final action, especially when the action can use stored credentials.

## Security Impact

- Threat: read-only project access becomes arbitrary node execution through an AI agent tool.
- Affected boundary: n8n versions before 2.30.1, AI Agents with node tools enabled, Project Viewer role, `run_node_tool`, and project credentials.
- Exploit or incident status: public CVE and advisory database entries; no active exploitation was identified in the raw source.
- Mitigation state: fixed in n8n 2.30.1 according to the [July 24 topic news collector source](../../../raw/processed/2026-07-24/ai-security-wiki-topic-news-collector-2026-07-24T193213-0400.json); restrict node-tool access, review agents exposed to viewer roles, and audit credentialed agent actions.
- Confidence: high because [GitLab](https://advisories.gitlab.com/npm/n8n/CVE-2026-65015/), [GitHub](https://github.com/advisories/GHSA-w46p-w7w2-fr9g), and [SentinelOne](https://www.sentinelone.com/vulnerability-database/cve-2026-65015/) advisory records agree on the affected role, feature, and fixed version.
- Residual risk: workflows may assume chat access is read-only while agent tools execute under project or service credentials.

## Authoritative Sources

- [July 24 topic news collector source](../../../raw/processed/2026-07-24/ai-security-wiki-topic-news-collector-2026-07-24T193213-0400.json)
- GitLab advisory: https://advisories.gitlab.com/npm/n8n/CVE-2026-65015/
- GitHub advisory: https://github.com/advisories/GHSA-w46p-w7w2-fr9g
- SentinelOne vulnerability database: https://www.sentinelone.com/vulnerability-database/cve-2026-65015/

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [final query authorization for AI data tools](final-query-authorization-for-ai-data-tools.md)
- [identity and access](../identity-and-access/index.md)
- [data and privacy](../data-and-privacy/index.md)
- Upstream AI wiki owns broad n8n product context.

## Open Questions

- Should the reusable final-action authorization rule become a separate local control leaf after more non-query agent tool cases are observed?

## Maintenance Notes

- Added from the [July 24, 2026 topic collector](../../../raw/processed/2026-07-24/ai-security-wiki-topic-news-collector-2026-07-24T193213-0400.json); preserve the role boundary and credential-use details rather than treating the item as only an n8n product update.
