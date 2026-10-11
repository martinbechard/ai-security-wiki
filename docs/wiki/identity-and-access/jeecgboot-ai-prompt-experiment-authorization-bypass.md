---
type: "Topic"
title: "JeecgBoot AI Prompt Experiment Authorization Bypass"
description: "Security analysis for CVE-2026-108670 JeecgBoot prompt experiment execution without proper authorization."
tags: ["identity-and-access"]
---

# JeecgBoot AI Prompt Experiment Authorization Bypass

## Current Understanding

The [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) records CVE-2026-108670 as a JeecgBoot through 3.9.5 prompt-experiment authorization failure. Broad JeecgBoot product context belongs upstream; this page owns the prompt experiment execution boundary.

The [NVD CVE-2026-108670 entry](https://nvd.nist.gov/vuln/detail/CVE-2026-108670) is the point-of-use evidence for a prompt-experiment endpoint that can:

- trigger evaluation runs,
- write result rows, and
- change dataset status.

That runtime side effect can change independently from ordinary prompt-template read or mutation permissions.

## Security Impact

- Threat: low-privileged users can trigger prompt experiment runs and mutate experiment result state.
- Affected boundary: JeecgBoot through 3.9.5, prompt experiment endpoint, evaluation runs, result rows, dataset status, and missing permission checks.
- Exploit or incident status: public NVD evidence in the October 10 JeecgBoot cluster; no confirmed exploitation incident is recorded locally.
- Mitigation state: restore authorization on experiment execution, separate experiment-run authority from prompt-template read/write roles, and audit result rows created by low-privileged users.
- Confidence: high for independent execution boundary from NVD CVE evidence.
- Residual risk: prompt evaluation endpoints need explicit run authority because they can create state and consume model resources even when template CRUD is separately controlled.

## Authoritative Sources

- [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json)
- [NVD CVE-2026-108670](https://nvd.nist.gov/vuln/detail/CVE-2026-108670)

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
