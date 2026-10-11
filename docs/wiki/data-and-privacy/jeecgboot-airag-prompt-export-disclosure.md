---
type: "Topic"
title: "JeecgBoot Airag Prompt Export Disclosure"
description: "Security analysis for CVE-2026-108673 all-user prompt export disclosure in JeecgBoot AiragPromptsController."
tags: ["data-and-privacy"]
---

# JeecgBoot Airag Prompt Export Disclosure

## Current Understanding

The [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) records CVE-2026-108673 as a JeecgBoot through 3.9.5 prompt export disclosure. Broad JeecgBoot product context belongs upstream; this page owns the all-user prompt export data boundary.

The [NVD CVE-2026-108673 entry](https://nvd.nist.gov/vuln/detail/CVE-2026-108673) is the point-of-use evidence for `AiragPromptsController.exportXls` exposing all users prompts. This is distinct from the existing [JeecgBoot Airag exportXls access control](../identity-and-access/jeecgboot-airag-exportxls-access-control.md) leaf, which covers a different controller and CVE.

## Security Impact

- Threat: low-privileged users can export prompt records belonging to other users.
- Affected boundary: JeecgBoot through 3.9.5, `AiragPromptsController.exportXls`, exported prompt records, and cross-user data visibility.
- Exploit or incident status: public NVD evidence in the October 10 JeecgBoot cluster; no confirmed exploitation incident is recorded locally.
- Mitigation state: restore export authorization, scope exports by owner or tenant, and audit downloaded prompt spreadsheets.
- Confidence: high for cross-user prompt export from NVD CVE evidence.
- Residual risk: prompt exports can disclose proprietary instructions, test data, and workflow context, so export actions need explicit data-access policy.

## Authoritative Sources

- [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json)
- [NVD CVE-2026-108673](https://nvd.nist.gov/vuln/detail/CVE-2026-108673)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [JeecgBoot Airag exportXls access control](../identity-and-access/jeecgboot-airag-exportxls-access-control.md)
- [JeecgBoot AI Prompt Template Authorization Bypass](../identity-and-access/jeecgboot-ai-prompt-template-authorization-bypass.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-10-11 from the [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) after upstream index routing kept broad JeecgBoot product context outside the local security wiki.
