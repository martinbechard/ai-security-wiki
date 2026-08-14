---
type: "Topic"
title: "SAFE AI Incident Sharing Guidance"
description: "Security analysis for Open Secure AI Alliance SAFE guidance on AI incident and near-miss sharing."
tags: ["incident-response", "testing-and-assurance", "governance-and-compliance"]
---

# SAFE AI Incident Sharing Guidance

## Current Understanding

SAFE AI incident sharing guidance is an Open Secure AI Alliance proposal for exchanging AI incident and near-miss evidence. The [August 13 leaf update watch source](../../../raw/processed/2026-08-13/ai-security-wiki-leaf-update-watch-20260814T000301Z.json) records [NVIDIA](https://blogs.nvidia.com/blog/open-secure-ai-alliance-contributions/), [Axios](https://www.axios.com/2026/08/11/open-source-security-ai-agent-reporting), and [SecurityWeek](https://www.securityweek.com/cybersecurity-alliance-drafts-safe-guidelines-for-sharing-ai-incident-data/) reporting that the guidance covers confidential collection, affected-party notification, recurring-control-failure analysis, and public recommendations.

Broad Open Secure AI Alliance, NVIDIA, Cisco, CrowdStrike, Hugging Face, Red Hat, and Linux Foundation background belongs upstream. Locally, SAFE matters as an incident-response and assurance control: AI incidents and near misses can become reusable defensive evidence only when reporting preserves source provenance, protects sensitive victim data, and distinguishes voluntary guidance from enforceable obligations.

## Security Impact

- Threat or control area: AI incident evidence stays siloed, unactionable, or unsafe to share when reporting channels lack confidentiality, affected-party handling, and provenance controls.
- Affected boundary: AI incident reporting, agentic AI near misses, cross-organization control learning, public recommendations, and open defensive AI infrastructure.
- Exploit or incident status: public guidance proposal and reporting signal, not a vulnerability disclosure or confirmed incident.
- Mitigation state: treat SAFE as candidate incident-sharing guidance until stable RFC, safe-harbor, or enforceable reporting semantics are published.
- Confidence: medium-high for the existence and stated scope of the proposal from NVIDIA and security press; medium for operating impact until the guidance has a stable version and adoption evidence.
- Residual risk: shared incident evidence can expose victim, model, prompt, tool, or infrastructure details if confidentiality and affected-party boundaries are weak.

## Control Implications

- Preserve prompt, tool-call, model, identity, network, and approval evidence in AI incident records so recurring-control failures can be analyzed.
- Separate confidential intake records from public recommendations.
- Notify affected parties before publishing details that could identify victims, tenants, systems, or exploit paths.
- Track whether incident-sharing guidance is voluntary, safe-harbor-backed, contractual, regulatory, or internal policy.
- Link AI incident-sharing evidence to assurance work only when provenance and confidence are explicit.

## Authoritative Sources

- [August 13 leaf update watch source](../../../raw/processed/2026-08-13/ai-security-wiki-leaf-update-watch-20260814T000301Z.json)
- NVIDIA SAFE guidance contribution: https://blogs.nvidia.com/blog/open-secure-ai-alliance-contributions/
- Axios SAFE guidance coverage: https://www.axios.com/2026/08/11/open-source-security-ai-agent-reporting
- SecurityWeek SAFE guidance coverage: https://www.securityweek.com/cybersecurity-alliance-drafts-safe-guidelines-for-sharing-ai-incident-data/

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [incident response](index.md)
- [open defensive AI security infrastructure](../testing-and-assurance/open-defensive-ai-security-infrastructure.md)
- [agent cyberattack disclosure and traceability](agent-cyberattack-disclosure-and-traceability.md)
- [third-party cyber-evaluation boundary failures](third-party-cyber-evaluation-boundary-failures.md)
- Upstream AI wiki owns broad Open Secure AI Alliance and partner-organization background.
- Upstream AI development wiki owns general cross-organization collaboration workflow practice.

## Open Questions

- Will SAFE gain stable RFC, safe-harbor, or enforceable reporting semantics for AI incidents and near misses?
- Which evidence fields should be mandatory for local AI incident reports before aggregation into SAFE-style guidance?

## Maintenance Notes

- Created on 2026-08-13 from the [August 13 watcher](../../../raw/processed/2026-08-13/ai-security-wiki-leaf-update-watch-20260814T000301Z.json) after verifier correction split SAFE from the broader open defensive infrastructure leaf.
