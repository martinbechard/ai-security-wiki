---
type: "Topic"
title: "NEAR AI SGLang Inference-Server Incident"
description: "Security analysis of NEAR AI's reported SGLang remote-code-execution incident and its inference, credential, and response boundaries."
tags: ["incident-response", "infrastructure-and-supply-chain", "data-and-privacy"]
---

# NEAR AI SGLang Inference-Server Incident

## Current Understanding

The [November 10 collector source](../../../raw/processed/2026-11-10/ai-security-wiki-topic-news-collector-2026-11-10T193250-0500.json) records NEAR AI's report that an unauthorized party exploited a remote-code-execution vulnerability in SGLang on one inference server on November 8. Broad [NEAR AI](../../../upstream-ai-wiki/companies/index.md) and SGLang framework coverage belongs upstream; this leaf owns the incident scope, confidential-inference boundary, credential and log exposure, and response controls.

NEAR AI says the intruder accessed internal infrastructure and could have observed requests processed on that server, including confidential-mode requests. The vendor reports exposure of account details for about 100 users, 18 legacy agents, and two API keys in logs, while stating that its review found no indication of access to stored Private Chat conversations or uploaded files. This distinction remains vendor-stated and must not be generalized to other confidential-inference deployments.

## Security Impact

- Threat: a vulnerable inference runtime can provide remote code execution inside an otherwise protected inference environment.
- Affected boundary: one NEAR AI inference server running SGLang, request processing, legacy NEAR AI Agents data, and credential-bearing logs; the exact SGLang CVE and fixed release are not supplied.
- Exploit or incident status: NEAR AI publicly reports an exploited remote-code-execution incident on November 8; no independent advisory or forensic report is recorded.
- Mitigation state: NEAR AI says it revoked sessions and administrative credentials, replaced agent tokens, rotated remaining credentials, deployed the SGLang fix across inference servers, completed a forensic review, and notified confirmed affected users.
- Confidence: high for vendor-stated scope and response; medium for root cause and no-access claims pending an independent SGLang advisory or forensic report.
- Residual risk: a confidential-computing boundary does not eliminate inference-runtime compromise or in-flight request exposure; version scope and independent technical root-cause evidence remain unresolved.

## Authoritative Sources

- [November 10 collector source](../../../raw/processed/2026-11-10/ai-security-wiki-topic-news-collector-2026-11-10T193250-0500.json)
- [NEAR AI security incident report](https://near.ai/blog/security-incident-report-sglang-vulnerability)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [incident response](index.md)
- [SGLang Prefill-Decode SSRF and Scheduler DoS](../agent-and-tool-security/sglang-prefill-decode-ssrf-and-scheduler-dos.md)
- [agent network egress controls](../agent-and-tool-security/agent-network-egress-controls.md)

## Open Questions

- Which SGLang vulnerability identifier, affected versions, and fixed release apply to this incident?
- Will NEAR AI or SGLang publish an independent forensic or advisory record that corroborates the root cause and access assessment?

## Maintenance Notes

- Created on 2026-11-10 from the November 10 collector source. Keep broad NEAR AI and SGLang ecosystem facts upstream; retain only the incident and security-control lens here.
