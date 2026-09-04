---
type: "Topic"
title: "Agent-S GUI Action Denial of Service"
description: "Security analysis for CVE-2026-84887 resource exhaustion in simular-ai Agent-S model-generated GUI action handling."
tags: ["agent-and-tool-security", "testing-and-assurance"]
---

# Agent-S GUI Action Denial of Service

## Current Understanding

The [September 3 topic collector source](../../../raw/processed/2026-09-03/ai-security-wiki-topic-news-collector-2026-09-03T233104Z.json) records [CVE-2026-84887](https://nvd.nist.gov/vuln/detail/CVE-2026-84887) for simular-ai Agent-S 0.3.0 through 0.3.2. Broad Agent-S framework coverage belongs upstream; this page owns the local security boundary where model-generated GUI action parameters can consume resources in the agent action workflow.

[NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-84887), the [direct CVE record](https://cveawg.mitre.org/api/cve/CVE-2026-84887), [VulDB](https://vuldb.com/vuln/398136), and the [public proof-of-concept repository](https://github.com/outlookgp/CVE/tree/main/AgentS_Action_Parameter_Budget_DoS_Report) describe a remotely exploitable denial-of-service issue in `grounding.py`. The source records public exploit availability and no identified vendor response or fixed release during this ingest.

## Security Impact

- Threat: attacker-controlled task or UI input can drive model-generated action handling into resource exhaustion.
- Affected boundary: simular-ai Agent-S 0.3.0 through 0.3.2, `grounding.py`, GUI action parameter budgets, and delegated desktop/browser action execution.
- Exploit or incident status: public NVD/CVE, VulDB, and proof-of-concept references; no local incident is recorded.
- Mitigation state: no fixed version is identified locally; constrain action parameter sizes, loop counts, and runtime budgets around GUI action execution.
- Confidence: medium-high from NVD/CVE and public exploit references; medium for remediation because vendor status is unclear.
- Residual risk: GUI agents combine untrusted visual/task context with action synthesis, so availability controls need to sit around both model output and executor input.

## Control Implications

- Validate model-generated action parameters before executor dispatch.
- Apply per-step CPU, memory, and time budgets to GUI action grounding and execution.
- Treat public proof-of-concept availability as enough to prioritize version review for any exposed Agent-S deployments.

## Authoritative Sources

- [September 3 topic collector source](../../../raw/processed/2026-09-03/ai-security-wiki-topic-news-collector-2026-09-03T233104Z.json)
- [NVD CVE-2026-84887](https://nvd.nist.gov/vuln/detail/CVE-2026-84887)
- [CVE-2026-84887 direct CVE record](https://cveawg.mitre.org/api/cve/CVE-2026-84887)
- [VulDB CVE-2026-84887 entry](https://vuldb.com/vuln/398136)
- [Agent-S action parameter budget DoS proof of concept](https://github.com/outlookgp/CVE/tree/main/AgentS_Action_Parameter_Budget_DoS_Report)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Agentic browser intent collision](agentic-browser-intent-collision.md)
- [agent runtime security evidence](../testing-and-assurance/agent-runtime-security-evidence.md)

## Open Questions

- Which Agent-S release or commit bounds GUI action parameters or documents an intended mitigation for CVE-2026-84887?

## Maintenance Notes

- Created on 2026-09-03 from the [September 3 topic collector](../../../raw/processed/2026-09-03/ai-security-wiki-topic-news-collector-2026-09-03T233104Z.json) as a model-generated GUI action availability leaf.
