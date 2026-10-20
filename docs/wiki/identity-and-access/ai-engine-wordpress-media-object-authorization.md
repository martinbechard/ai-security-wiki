---
type: "Topic"
title: "AI Engine WordPress Media Object Authorization"
description: "Security analysis for CVE-2026-110976 and CVE-2026-111041 object-ownership failures in AI Engine media actions."
tags: ["identity-and-access"]
---

# AI Engine WordPress Media Object Authorization

## Current Understanding

The [October 19 collector](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json) links [CVE-2026-110976](https://nvd.nist.gov/vuln/detail/CVE-2026-110976) and [CVE-2026-111041](https://nvd.nist.gov/vuln/detail/CVE-2026-111041): AI Engine for WordPress before 3.7.9 does not enforce object ownership for AI media actions. The collector reports arbitrary protected-post deletion and post modification/type change, but does not map each action to an individual CVE; the unresolved per-CVE mapping is preserved below. General plugin context remains upstream-owned.

## Security Impact

- Threat: Editor-level users can delete protected posts or alter posts they cannot otherwise edit.
- Affected boundary: AI Engine versions before 3.7.9 and AI media-management actions.
- Exploit or incident status: public CVE records; active exploitation is not identified.
- Mitigation state: upgrade to 3.7.9 or later and test authorization per content object across AI and non-AI paths.
- Confidence: high for the affected version and authorization class.
- Residual risk: role checks alone do not enforce content ownership.

## Authoritative Sources

- [October 19 collector source](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json)
- [CVE-2026-110976](https://nvd.nist.gov/vuln/detail/CVE-2026-110976)
- [CVE-2026-111041](https://nvd.nist.gov/vuln/detail/CVE-2026-111041)

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

## Maintenance Notes

- Created on 2026-10-20 from the October 19 collector as one closely coupled object-authorization family.
