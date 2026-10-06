---
type: "Topic"
title: "InternLM MindSearch Planner Agent Code Injection"
description: "Security analysis for CVE-2026-105135 code injection in InternLM MindSearch Planner Agent input handling."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# InternLM MindSearch Planner Agent Code Injection

## Current Understanding

The [October 4 topic collector source](../../../raw/processed/2026-10-04/ai-security-wiki-topic-news-collector-2026-10-04T233152Z.json) records [CVE-2026-105135](https://cveawg.mitre.org/api/cve/CVE-2026-105135) for InternLM MindSearch 0.1.0. Broad InternLM and MindSearch product context belongs upstream if needed; this page owns the local planner-agent code-injection boundary.

The CVE record says `ExecutionAction.run` in `mindsearch/agent/graph.py` can be manipulated through the `inputs` argument to trigger code injection. The record describes remote exploitability, says exploit details are publicly disclosed, and notes no vendor response in the captured evidence.

## Security Impact

- Threat: planner-agent input handling becomes code execution inside an AI search or agent runtime.
- Affected boundary: InternLM MindSearch 0.1.0; Planner Agent; `ExecutionAction.run`; `mindsearch/agent/graph.py`; `inputs` argument.
- Exploit or incident status: public CVE with NVD and VulDB references; exploit disclosure is reported by the CVE source, but no local exploitation incident is recorded.
- Mitigation state: no fixed version was captured; isolate MindSearch deployments, restrict who can supply planner inputs, and watch for upstream patch or removal guidance.
- Confidence: high for affected version, component, and in-window publication from CVE/NVD; medium for remediation because no vendor advisory or fixed release was captured.
- Residual risk: AI agent planners often convert user goals into executable actions, so planner input validation needs to be treated as a runtime execution boundary, not only prompt parsing.

## Authoritative Sources

- [October 4 topic collector source](../../../raw/processed/2026-10-04/ai-security-wiki-topic-news-collector-2026-10-04T233152Z.json)
- [October 5 leaf update watch source](../../../raw/processed/2026-10-05/ai-security-wiki-leaf-update-watch-20261006T000405Z.json)
- [CVE-2026-105135 record](https://cveawg.mitre.org/api/cve/CVE-2026-105135)
- [NVD CVE-2026-105135](https://nvd.nist.gov/vuln/detail/CVE-2026-105135)
- [VulDB advisory](https://vuldb.com/vuln/413352)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [infrastructure and supply chain](../infrastructure-and-supply-chain/index.md)
- [Open GenAI Stack Jinja prompt-injection RCE](../model-and-prompt-security/open-genai-stack-jinja-prompt-injection-rce.md)

## Open Questions

- Which MindSearch release or commit removes the `inputs` argument code-injection path?
- Is the public exploit specific to local Planner Agent deployments, hosted services, or both?

## Maintenance Notes

- Created on 2026-10-05 from the [October 4 topic collector source](../../../raw/processed/2026-10-04/ai-security-wiki-topic-news-collector-2026-10-04T233152Z.json) as a local planner-agent execution-boundary leaf.
- Updated on 2026-10-06 with October 5 watcher provenance; no digest entry was added because the watcher repeated the same CVE boundary without a material mitigation change.
