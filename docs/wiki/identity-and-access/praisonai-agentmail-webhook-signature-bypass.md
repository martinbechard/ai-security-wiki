---
type: "Topic"
title: "PraisonAI AgentMail Webhook Signature Bypass"
description: "Security analysis for CVE-2026-61436 and CVE-2026-61428 forged AgentMail webhook events in PraisonAI."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# PraisonAI AgentMail Webhook Signature Bypass

## Current Understanding

The [October 7 topic collector source](../../../raw/processed/2026-10-07/ai-security-wiki-topic-news-collector-2026-10-07T233304Z.json) records October 7 GitHub Advisory Database publication of [GHSA-7c92-x8vg-4258](https://github.com/advisories/GHSA-7c92-x8vg-4258) for CVE-2026-61436 and [GHSA-qj9c-59p6-8cgx](https://github.com/advisories/GHSA-qj9c-59p6-8cgx) for CVE-2026-61428. The [October 9 leaf update watch source](../../../raw/processed/2026-10-09/ai-security-wiki-leaf-update-watch-20261009T000340Z.json) corroborates the same GitHub Advisory Database publication/review/update and 4.6.78 patch boundary. Broad PraisonAI and AgentMail product context belongs upstream; this page owns the local webhook authenticity and delegated-agent invocation boundary.

In AgentMail webhook mode before PraisonAI 4.6.78, the webhook path accepts caller-controlled `message.received` JSON without enforcing Svix signature verification. The collector records two closely coupled failure modes: forged webhook payloads can be accepted as agent input, and invalid Svix headers can be ignored rather than rejected. The resulting event can dispatch attacker-controlled sender, subject, body, thread, and reply metadata into the configured agent session.

## Security Impact

- Threat: forged inbound email events can drive an agent as an arbitrary sender, creating prompt-injection input, model/API budget consumption, and downstream tool action risk.
- Affected boundary: PraisonAI before 4.6.78, AgentMail webhook mode, public HTTP webhook authenticity, Svix signature verification, and agent invocation metadata.
- Exploit or incident status: reviewed GitHub advisories, CVE Services records, and VulnCheck advisory references; no local exploitation incident is recorded.
- Mitigation state: update to PraisonAI 4.6.78 or later and reject unsigned or invalidly signed webhook requests before any agent-session dispatch.
- Confidence: high for the October 7 GitHub Advisory publication and affected-version boundary; medium for patch mechanics until release notes or patch commits are captured.
- Residual risk: agent webhook receivers need negative tests for missing signatures, invalid signatures, replayed events, and header/body mismatch before treating the source as trusted.

## Authoritative Sources

- [October 7 topic collector source](../../../raw/processed/2026-10-07/ai-security-wiki-topic-news-collector-2026-10-07T233304Z.json)
- [October 9 leaf update watch source](../../../raw/processed/2026-10-09/ai-security-wiki-leaf-update-watch-20261009T000340Z.json)
- [GHSA-7c92-x8vg-4258](https://github.com/advisories/GHSA-7c92-x8vg-4258)
- [GHSA-qj9c-59p6-8cgx](https://github.com/advisories/GHSA-qj9c-59p6-8cgx)
- [CVE-2026-61436 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-61436)
- [CVE-2026-61428 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-61428)
- [VulnCheck CVE-2026-61436 advisory](https://www.vulncheck.com/advisories/praisonai-before-missing-webhook-signature-verification)
- [VulnCheck CVE-2026-61428 advisory](https://www.vulncheck.com/advisories/praisonai-agentmail-before-message-injection-via-webhook)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [PraisonAI AgentServer API Key Auth Enforcement](praisonai-agentserver-api-key-auth-enforcement.md)
- [PraisonAI Jobs API unauthenticated execution](praisonai-jobs-api-unauthenticated-execution.md)
- [production agent identity and access controls](production-agent-identity-and-access-controls.md)

## Open Questions

- Which PraisonAI 4.6.78 patch or release note shows the exact Svix verification enforcement behavior?

## Maintenance Notes

- Created on 2026-10-08 from the [October 7 topic collector source](../../../raw/processed/2026-10-07/ai-security-wiki-topic-news-collector-2026-10-07T233304Z.json) as one closely coupled AgentMail webhook-authenticity leaf for CVE-2026-61436 and CVE-2026-61428.
- Updated on 2026-10-09 from the [October 9 leaf update watch source](../../../raw/processed/2026-10-09/ai-security-wiki-leaf-update-watch-20261009T000340Z.json) with duplicate GitHub Advisory Database provenance and no separate digest item.
