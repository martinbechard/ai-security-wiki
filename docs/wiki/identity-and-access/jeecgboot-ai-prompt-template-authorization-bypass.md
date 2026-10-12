---
type: "Topic"
title: "JeecgBoot AI Prompt Template Authorization Bypass"
description: "Security analysis for JeecgBoot AI prompt-template CRUD authorization CVEs in the October 10 NVD cluster."
tags: ["identity-and-access"]
---

# JeecgBoot AI Prompt Template Authorization Bypass

## Current Understanding

The [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) records a JeecgBoot through 3.9.5 advisory cluster. Broad JeecgBoot product context belongs upstream; this page owns prompt-template CRUD authorization failures across CVE-2026-108664, CVE-2026-108665, CVE-2026-108666, CVE-2026-108667, and CVE-2026-108668.

The cluster says low-privileged users can operate on AI prompt templates because key permission checks are missing or commented out. Covered actions include:

- read,
- edit,
- delete,
- restore,
- purge, and
- export.

These prompt-template records can steer downstream AI behavior, so the local boundary is both record ownership and privileged prompt management. The separate [JeecgBoot AI Prompt Experiment Authorization Bypass](jeecgboot-ai-prompt-experiment-authorization-bypass.md) page owns the experiment-execution boundary, and [JeecgBoot Airag Prompt Export Disclosure](../data-and-privacy/jeecgboot-airag-prompt-export-disclosure.md) owns the all-user prompt export disclosure boundary.

The [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json) adds [CVE-2026-108877](https://nvd.nist.gov/vuln/detail/CVE-2026-108877) as a post-run prompt-template delta: any authenticated user can delete AI prompt templates through `DELETE /airag/prompts/delete`. This is folded into the same durable prompt-template authorization page because it affects the same Airag prompt ownership and deletion boundary rather than a distinct product surface.

## Security Impact

- Threat: low-privileged users can operate on shared AI prompt templates outside intended ownership.
- Affected boundary: JeecgBoot through 3.9.5, AI prompt-template CRUD APIs, read/edit/delete/restore/purge/export actions, `DELETE /airag/prompts/delete`, and missing permission checks.
- Exploit or incident status: public NVD evidence across the JeecgBoot prompt-template CVE cluster; no confirmed exploitation incident is recorded locally.
- Mitigation state: restore permission checks on every prompt-template action, separate read and mutation authorities, and audit prompt templates changed by low-privileged users.
- Confidence: high for missing authorization across the prompt-template CRUD cluster and the October 11 delete delta; medium for exact endpoint mapping until primary JeecgBoot advisories are reconciled.
- Residual risk: prompt-template administration is a security boundary because unauthorized prompt edits can change model behavior and downstream tool instructions.

## Authoritative Sources

- [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json)
- [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json)
- [NVD CVE-2026-108664](https://nvd.nist.gov/vuln/detail/CVE-2026-108664)
- [NVD CVE-2026-108665](https://nvd.nist.gov/vuln/detail/CVE-2026-108665)
- [NVD CVE-2026-108666](https://nvd.nist.gov/vuln/detail/CVE-2026-108666)
- [NVD CVE-2026-108667](https://nvd.nist.gov/vuln/detail/CVE-2026-108667)
- [NVD CVE-2026-108668](https://nvd.nist.gov/vuln/detail/CVE-2026-108668)
- [NVD CVE-2026-108877](https://nvd.nist.gov/vuln/detail/CVE-2026-108877)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [JeecgBoot AI Prompt Experiment Authorization Bypass](jeecgboot-ai-prompt-experiment-authorization-bypass.md)
- [JeecgBoot Airag Prompt Export Disclosure](../data-and-privacy/jeecgboot-airag-prompt-export-disclosure.md)
- [GitLab AI Gateway prompt template sandbox escape](../model-and-prompt-security/gitlab-ai-gateway-prompt-template-sandbox-escape.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-10-11 from the [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) after upstream index routing kept broad JeecgBoot product context outside the local security wiki.
- Updated on 2026-10-12 from the [October 11 topic collector source](../../../raw/processed/2026-10-11/ai-security-wiki-topic-news-collector-2026-10-11T233138Z.json) with CVE-2026-108877 prompt-template deletion authorization evidence.
