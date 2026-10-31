---
type: "Topic"
title: "n8n LangChain Code Node Task-Runner Isolation RCE"
description: "Security analysis for CVE-2026-119408 legacy workflow nodes bypassing task-runner isolation."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# n8n LangChain Code Node Task-Runner Isolation RCE

## Current Understanding

The [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json) records [CVE-2026-119408](https://nvd.nist.gov/vuln/detail/CVE-2026-119408): n8n before 2.42.6, 2.43.x before 2.43.3, and 3.x before 3.0.1 lets authenticated workflow authors use deprecated Function, Function Item, and LangChain Code nodes to execute JavaScript in the main process outside task-runner isolation.

## Security Impact

- Threat: a workflow author can bypass the intended isolated execution environment.
- Affected boundary: the stated n8n release lines, legacy code-capable nodes, and task-runner isolation.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: upgrade to the fixed release for the deployed line and inventory imported or hidden legacy nodes.
- Confidence and residual risk: high for affected releases; workflow import and migration paths require continued policy enforcement.

## Authoritative Sources

- [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json)
- [NVD CVE-2026-119408](https://nvd.nist.gov/vuln/detail/CVE-2026-119408)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)

## Open Questions

- Do imported workflow migrations reject all deprecated code nodes before runner placement?

## Maintenance Notes

- Created on 2026-10-30 as an execution-isolation boundary distinct from existing n8n credential and viewer leaves.
