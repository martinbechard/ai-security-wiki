---
type: "Topic"
title: "AI Engine WordPress Media Object Authorization"
description: "Security analysis for CVE-2026-110976, CVE-2026-111041, and CVE-2026-112828 AI Engine media or object authorization failures."
tags: ["identity-and-access"]
---

# AI Engine WordPress Media Object Authorization

## Current Understanding

The [October 19 collector](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json) links [CVE-2026-110976](https://nvd.nist.gov/vuln/detail/CVE-2026-110976) and [CVE-2026-111041](https://nvd.nist.gov/vuln/detail/CVE-2026-111041): AI Engine for WordPress before 3.7.9 does not enforce object ownership for AI media actions. The collector reports arbitrary protected-post deletion and post modification/type change, but does not map each action to an individual CVE; the unresolved per-CVE mapping is preserved below. General plugin context remains upstream-owned.

The [October 27 collector](../../../raw/processed/2026-10-27/ai-security-wiki-topic-news-collector-2026-10-27T232925Z.json) adds [CVE-2026-112828](https://cveawg.mitre.org/api/cve/CVE-2026-112828): AI Engine through 3.8.6 has incorrectly configured access-control levels at a media or object boundary. It is a later, separately identified authorization condition in the same plugin family; the CVE record marks 3.8.7 as unaffected, while the affected object type remains unspecified.

## Security Impact

- Threat: Editor-level users can delete protected posts or alter posts they cannot otherwise edit.
- Affected boundary: AI Engine versions before 3.7.9 and AI media-management actions; CVE-2026-112828 separately affects AI Engine through 3.8.6 at a media or object access-control boundary.
- Exploit or incident status: public CVE records; active exploitation is not identified.
- Mitigation state: upgrade to 3.7.9 or later for the earlier ownership flaws and to 3.8.7 or later for CVE-2026-112828, then test authorization per content object across AI and non-AI paths.
- Confidence: high for the reported version boundaries and authorization class; the affected object detail for CVE-2026-112828 remains unspecified.
- Residual risk: role checks alone do not enforce content ownership.

## Authoritative Sources

- [October 19 collector source](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json)
- [October 20 leaf watch](../../../raw/processed/2026-10-20/ai-security-wiki-leaf-update-watch-20261021T000613Z.json)
- [October 27 collector source](../../../raw/processed/2026-10-27/ai-security-wiki-topic-news-collector-2026-10-27T232925Z.json)
- [CVE-2026-110976](https://nvd.nist.gov/vuln/detail/CVE-2026-110976)
- [CVE-2026-111041](https://nvd.nist.gov/vuln/detail/CVE-2026-111041)
- [CVE-2026-112828](https://cveawg.mitre.org/api/cve/CVE-2026-112828)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)

## Open Questions

- The collector does not identify whether CVE-2026-110976 or CVE-2026-111041 covers protected-post deletion versus post modification/type change. Obtain the primary advisory mapping before assigning either action to a single identifier.
- Are both CVEs fully addressed by the 3.7.9 ownership check changes?
- Which media or object action is affected by CVE-2026-112828, beyond the fixed boundary at AI Engine 3.8.7?

## Maintenance Notes

- Created on 2026-10-20 from the October 19 collector as one closely coupled object-authorization family.
- Rechecked on 2026-10-20; the two-CVE ownership boundary remains unchanged.
- Updated on 2026-10-27 with CVE-2026-112828 as a separate later access-control condition in the same media or object authorization family.
