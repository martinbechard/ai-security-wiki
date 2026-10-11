---
type: "Topic"
title: "JeecgBoot AI OCR Prompt Shared-State Authorization"
description: "Security analysis for CVE-2026-108605 and CVE-2026-108606 JeecgBoot AI OCR prompt shared-state authorization failures."
tags: ["identity-and-access"]
---

# JeecgBoot AI OCR Prompt Shared-State Authorization

## Current Understanding

The [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) records JeecgBoot through 3.9.5 low-privilege access to shared OCR prompt records. Broad JeecgBoot context belongs upstream; this page owns the OCR shared-state authorization boundary for CVE-2026-108605 and CVE-2026-108606.

The collector names `AiOcrController` and says low-privileged users can update or delete shared OCR prompt records because key permission checks are missing or commented out. This differs from general prompt-template management because OCR prompt state can affect document extraction behavior for other users.

## Security Impact

- Threat: low-privileged users can alter shared OCR prompt state.
- Affected boundary: JeecgBoot through 3.9.5, `AiOcrController`, shared OCR prompt update/delete operations, and missing permission checks.
- Exploit or incident status: public NVD evidence in the October 10 JeecgBoot cluster; no confirmed exploitation incident is recorded locally.
- Mitigation state: restore per-record permission checks, audit OCR prompt records, and isolate tenant or owner scope for OCR configuration.
- Confidence: high for the controller-specific update/delete boundary from NVD evidence.
- Residual risk: shared AI extraction prompts require ownership checks because unauthorized edits can change downstream document interpretation.

## Authoritative Sources

- [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json)
- [NVD CVE-2026-108605](https://nvd.nist.gov/vuln/detail/CVE-2026-108605)
- [NVD CVE-2026-108606](https://nvd.nist.gov/vuln/detail/CVE-2026-108606)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [JeecgBoot AI Prompt Template Authorization Bypass](jeecgboot-ai-prompt-template-authorization-bypass.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-10-11 from the [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) after upstream index routing kept broad JeecgBoot product context outside the local security wiki.
