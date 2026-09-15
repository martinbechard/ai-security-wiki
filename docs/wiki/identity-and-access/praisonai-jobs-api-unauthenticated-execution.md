---
type: "Topic"
title: "PraisonAI Jobs API unauthenticated execution"
description: "Security analysis for CVE-2026-57131 unauthenticated PraisonAI Jobs API agent execution and job access."
tags: ["identity-and-access", "agent-and-tool-security"]
---

# PraisonAI Jobs API unauthenticated execution

## Current Understanding

The [September 14 topic collector source](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json) records [CVE-2026-57131](https://cveawg.mitre.org/api/cve/CVE-2026-57131) for PraisonAI Jobs API endpoints. Broad PraisonAI jobs workflow context belongs upstream; this page owns the local delegated-action API authentication and per-job authorization boundary.

The CVE says `praisonai.jobs.server.create_app` mounted `praisonai.jobs.router.create_router` under `/api/v1/runs` without authentication or per-job authorization. Network clients could submit prompts and agent configuration, list and read jobs, stream results, and cancel or delete other jobs. The description says the issue is fixed in 4.6.58, while the CVE affected-version field says `< 4.6.48`; local guidance treats that metadata mismatch as unresolved and follows the narrative fixed-version evidence until the advisory is corrected.

## Security Impact

- Threat: unauthenticated network clients can operate hosted agents and inspect or disrupt other jobs.
- Affected boundary: PraisonAI Jobs API `/api/v1/runs`, run creation, job listing, result streaming, cancellation, deletion, and service credential exposure.
- Exploit or incident status: public CVE, GitHub advisory, patch, and release evidence; no local exploitation incident is recorded.
- Mitigation state: upgrade to a release containing the Jobs API authentication fix, verify 4.6.58 or later in deployment, and enforce per-job authorization on every run endpoint.
- Confidence: high for the unauthenticated API behavior; medium for the affected-version metadata because the CVE narrative and version field conflict.
- Residual risk: agent job APIs combine prompt submission, tool capability selection, and job result access, so missing authentication can become both unauthorized computation and credential misuse.

## Authoritative Sources

- [September 14 topic collector source](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json)
- [CVE-2026-57131 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-57131)
- [GitHub advisory GHSA-fq2m-6wqh-x44g](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-fq2m-6wqh-x44g)
- [PraisonAI patch commit](https://github.com/MervinPraison/PraisonAI/commit/2f9677abb2ea68eab864ee8b6a828fd0141612e1)
- [PraisonAI 4.6.58 release](https://github.com/MervinPraison/PraisonAI/releases/tag/v4.6.58)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [PraisonAI AgentServer API Key Auth Enforcement](praisonai-agentserver-api-key-auth-enforcement.md)
- [PraisonAI MCP origin and CSRF instruction persistence](../agent-and-tool-security/praisonai-mcp-origin-and-csrf-instruction-persistence.md)

## Open Questions

- Should CVE-2026-57131 treat the affected range as before 4.6.58 or before 4.6.48 after the CVE metadata conflict is corrected?

## Maintenance Notes

- Created on 2026-09-15 from the [September 14 topic collector](../../../raw/processed/2026-09-14/ai-security-wiki-topic-news-collector-2026-09-14T233124Z.json) after a direct CVE recheck confirmed the fixed-version wording and metadata conflict.
