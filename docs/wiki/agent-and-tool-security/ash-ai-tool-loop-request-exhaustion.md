---
type: "Topic"
title: "ash_ai Tool Loop Request Exhaustion"
description: "Security analysis for CVE-2026-82579 ash_ai prompt-injected or malformed tool-call recursion."
tags: ["agent-and-tool-security", "testing-and-assurance"]
---

# ash_ai Tool Loop Request Exhaustion

## Current Understanding

The [August 31 topic collector source](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json) records [CVE-2026-82579](https://nvd.nist.gov/vuln/detail/CVE-2026-82579) for ash_ai from 0.6.0 before 1.0.0. Broad ash_ai framework analysis routes upstream; this page owns the local agent-loop exhaustion boundary.

NVD and the linked [GitHub Security Advisory](https://github.com/ash-project/ash_ai/security/advisories/GHSA-rcx7-x2w5-mmc2) describe prompt-injected or malformed tool-call output that can keep the tool loop recursing and resend model requests. The issue is a resource-exhaustion and cost-control failure at the model-tool loop boundary.

## Security Impact

- Threat: attacker-influenced tool-call output can keep model requests looping and consume compute, quota, or spend.
- Affected boundary: ash_ai 0.6.0 through before 1.0.0.
- Exploit or incident status: public CVE and GitHub advisory; no local incident is recorded.
- Mitigation state: upgrade to ash_ai 1.0.0 or later; enforce tool-loop iteration caps, malformed-output fail-closed behavior, and per-session budget limits.
- Confidence: high for the vulnerability identity and affected range from NVD and the project advisory reference.
- Residual risk: model-tool loops need runtime counters and anomaly detection because malformed tool output can be non-obvious in traces.

## Control Implications

- Put hard caps on tool iterations, model retries, and cumulative spend per agent task.
- Treat invalid tool-call schema as a stop condition unless a bounded repair loop is explicitly configured.
- Log loop counters and terminal reasons for assurance review.

## Authoritative Sources

- [August 31 topic collector source](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json)
- [NVD CVE-2026-82579](https://nvd.nist.gov/vuln/detail/CVE-2026-82579)
- [GitHub Security Advisory GHSA-rcx7-x2w5-mmc2](https://github.com/ash-project/ash_ai/security/advisories/GHSA-rcx7-x2w5-mmc2)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [AI workload cost anomaly monitoring](../testing-and-assurance/ai-workload-cost-anomaly-monitoring.md)

## Open Questions

- Which ash_ai 1.0.0 change terminates malformed or repeated tool-call output?

## Maintenance Notes

- Created on 2026-08-31 from the [August 31 topic collector](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json) as a tool-loop exhaustion leaf separate from ash_ai prompt-template RCE and MCP origin validation.
