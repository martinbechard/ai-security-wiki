---
type: "Topic"
title: "Tencent AI-Infra-Guard File Access Path Traversal"
description: "Security analysis for CVE-2026-101080 path traversal in Tencent AI-Infra-Guard file access."
tags: ["infrastructure-and-supply-chain", "testing-and-assurance"]
---

# Tencent AI-Infra-Guard File Access Path Traversal

## Current Understanding

The [September 28 topic collector source](../../../raw/processed/2026-09-28/ai-security-wiki-topic-news-collector-2026-09-28T233057Z.json) records [CVE-2026-101080](https://cveawg.mitre.org/api/cve/CVE-2026-101080) for Tencent AI-Infra-Guard's File Access component in `skill_scan/tools/dir/dir_actions.py`. Broad Tencent and AI-Infra-Guard tool background belongs upstream; this page owns the local scanner file-boundary failure and version-reconciliation question.

The source says path validation used a starts-with style check that allowed local path traversal. The evidence includes CVE Program, NVD, VulDB, upstream issue, pull request, patch commit, and release references. The source records conflicting version data: 4.5.0, 4.5.1, 4.5.2, 4.6.1, and 4.6.2 are listed as affected, while 4.6.0 appears inconsistently as both affected and a mitigation target.

## Security Impact

- Threat: a security scanner file-access primitive can cross the intended repository or artifact boundary and expose local files.
- Affected boundary: Tencent AI-Infra-Guard File Access in `skill_scan/tools/dir/dir_actions.py`; affected and fixed versions require reconciliation because public records conflict around 4.6.0.
- Exploit or incident status: public CVE/NVD/VulDB records; the source says exploit material is public.
- Mitigation state: update according to the reconciled upstream release guidance, contain scanner file access to the intended workspace, and use path normalization that follows symlink and realpath boundaries.
- Confidence: medium-high on the vulnerability class and component; medium on exact fixed-version wording because the source records conflicting public metadata.
- Residual risk: security scanners that inspect local artifacts should be treated as privileged filesystem tools and sandboxed even when they are defensive.

## Authoritative Sources

- [September 28 topic collector source](../../../raw/processed/2026-09-28/ai-security-wiki-topic-news-collector-2026-09-28T233057Z.json)
- [CVE-2026-101080 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-101080)
- [VulDB record](https://vuldb.com/vuln/410952)
- [AI-Infra-Guard issue 538](https://github.com/Tencent/AI-Infra-Guard/issues/538)
- [AI-Infra-Guard pull request 539](https://github.com/Tencent/AI-Infra-Guard/pull/539)
- [Patch commit ac0384e](https://github.com/Tencent/AI-Infra-Guard/commit/ac0384edc9dbea3b226edefcf50613bd8509134f)
- [Release v4.6.0](https://github.com/Tencent/AI-Infra-Guard/releases/tag/v4.6.0)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [testing and assurance](../testing-and-assurance/index.md)
- [Tencent AI-Infra-Guard skill-scan bytecode bypass](../testing-and-assurance/tencent-ai-infra-guard-skill-scan-bytecode-bypass.md)
- [agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)

## Open Questions

- Which Tencent AI-Infra-Guard release is the authoritative fix for CVE-2026-101080 given the conflicting 4.6.0 metadata?

## Maintenance Notes

- Created on 2026-09-29 from the [September 28 topic collector source](../../../raw/processed/2026-09-28/ai-security-wiki-topic-news-collector-2026-09-28T233057Z.json) after preserving the fixed-version conflict as an open question.
