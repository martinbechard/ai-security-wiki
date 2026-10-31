---
type: "Topic"
title: "RAGFlow Private Agent Authorization-Order Bypass"
description: "Security analysis for CVE-2026-119337 private-agent execution before authorization."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# RAGFlow Private Agent Authorization-Order Bypass

## Current Understanding

The [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json) records [CVE-2026-119337](https://nvd.nist.gov/vuln/detail/CVE-2026-119337): RAGFlow 0.25.2 through 0.27.3 runs an OpenAI-compatible private-agent completion before checking caller access, letting a user with a victim UUID execute and read that workflow's output.

## Security Impact

- Threat: guessed private-agent identifiers bypass authorization before tool actions or output disclosure.
- Affected boundary: RAGFlow 0.25.2 through 0.27.3 and agent-completion authorization order.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: the source's affected range includes 0.27.3 while its follow-up names 0.27.3; authorize ownership before agent execution and confirm the fixed release before treating an upgrade as sufficient.
- Confidence and residual risk: high for the disclosed order; logs should be reviewed for UUID probing.

## Authoritative Sources

- [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json)
- [NVD CVE-2026-119337](https://nvd.nist.gov/vuln/detail/CVE-2026-119337)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [RAGFlow Agent Workflow Invoke SSRF](../agent-and-tool-security/ragflow-agent-workflow-invoke-ssrf.md)

## Open Questions

- Does the patch prevent both execution and output disclosure for unauthorized identifiers, and is 0.27.3 included or excluded from the fixed range?

## Maintenance Notes

- Created on 2026-10-30 as a distinct RAGFlow authorization-order boundary.
