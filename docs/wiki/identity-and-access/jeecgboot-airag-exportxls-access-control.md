---
type: "Topic"
title: "JeecgBoot Airag exportXls access control"
description: "Security analysis for CVE-2026-86228 JeecgBoot Airag LLM controller improper access control."
tags: ["identity-and-access"]
---

# JeecgBoot Airag exportXls access control

## Current Understanding

The [September 6 topic collector source](../../../raw/processed/2026-09-06/ai-security-wiki-topic-news-collector-2026-09-06T233209Z.json) records [CVE-2026-86228](https://cveawg.mitre.org/api/cve/CVE-2026-86228) for JeecgBoot 3.9.0 through 3.9.3. Broad JeecgBoot platform or RAG product context belongs upstream if needed; this page owns the local LLM module authorization boundary around `jeecg-boot-module-airag` and `AiragModelController`.

The collector records improper access control in the LLM controller `exportXls` function. Manipulating the credential argument can lead to improper access control, the attack is remote, public exploit information exists, and the CVE record lists JeecgBoot 3.9.5 as the fixed release.

## Security Impact

- Threat: a remote caller can manipulate an LLM module export path across the intended access-control boundary.
- Affected boundary: JeecgBoot 3.9.0 through 3.9.3, `jeecg-boot-module-airag`, `AiragModelController`, `exportXls`, and credential argument handling.
- Exploit or incident status: public CVE/NVD and VulDB evidence with public exploit information; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: upgrade to the fixed 3.9.5 release according to CVE evidence and verify controller-level authorization checks on AI/RAG export endpoints.
- Confidence: medium-high from direct CVE/NVD and VulDB references; exact exploit mechanics and fix diff should be rechecked against the GitHub issue and commit.
- Residual risk: AI/RAG modules embedded in enterprise application frameworks can inherit ordinary controller authorization defects while exposing model configuration, credentials, or export data through AI-specific endpoints.

## Authoritative Sources

- [September 6 topic collector source](../../../raw/processed/2026-09-06/ai-security-wiki-topic-news-collector-2026-09-06T233209Z.json)
- [CVE-2026-86228](https://cveawg.mitre.org/api/cve/CVE-2026-86228)
- [NVD CVE-2026-86228](https://nvd.nist.gov/vuln/detail/CVE-2026-86228)
- [VulDB advisory](https://vuldb.com/vuln/399381)
- [JeecgBoot issue 9600](https://github.com/jeecgboot/JeecgBoot/issues/9600)
- [JeecgBoot patch commit](https://github.com/jeecgboot/JeecgBoot/commit/a2be896f753936956ee6863b632b8e5a0231345c)
- [JeecgBoot v3.9.5 release](https://github.com/jeecgboot/JeecgBoot/releases/tag/v3.9.5)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)
- [production agent identity and access controls](production-agent-identity-and-access-controls.md)

## Open Questions

- Which exact `exportXls` authorization check changed in the JeecgBoot patch commit, and does the same pattern affect adjacent Airag controller endpoints?

## Maintenance Notes

- Created on 2026-09-06 from the [September 6 topic collector source](../../../raw/processed/2026-09-06/ai-security-wiki-topic-news-collector-2026-09-06T233209Z.json) after comparing the finding with earlier AI-module authorization leaves.
