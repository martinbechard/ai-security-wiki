---
type: "Topic"
title: "GitLab AI Gateway inline flow Host credential disclosure"
description: "Security analysis for CVE-2026-75871 GitLab AI Gateway inline flow Host override that can disclose cloud model credentials."
tags: ["data-and-privacy", "identity-and-access"]
---

# GitLab AI Gateway inline flow Host credential disclosure

## Current Understanding

The [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) records [CVE-2026-75871](https://nvd.nist.gov/vuln/detail/CVE-2026-75871) as a GitLab AI Gateway inline flow configuration flaw where a crafted Host override can redirect outbound model requests. Broad [GitLab Duo Agent Platform and cloud provider context](../../../upstream-ai-wiki/topic-index.md) belongs upstream; this page owns the local inline-flow destination authorization and cloud credential disclosure boundary.

## Security Impact

- Threat: an authenticated Duo Agent Platform user can redirect outbound model requests through crafted inline flow configuration and expose Google Vertex AI or AWS Bedrock service credentials.
- Affected boundary: GitLab AI Gateway 18.10-19.0.12, 19.1-19.1.7, and 19.2-19.2.2.
- Exploit or incident status: public NVD, GitLab work-item, and HackerOne report evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: apply the GitLab remediation for the affected versions; prevent caller-controlled Host or endpoint override from carrying provider credentials.
- Confidence: high for advisory existence and affected boundary; medium for exact fixed-release wording because the raw source names remediated ranges but not the final patched release labels.
- Residual risk: inline model-flow configuration becomes a credential exfiltration path when final host authorization is separated from provider-token attachment.

## Authoritative Sources

- [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json)
- [NVD CVE-2026-75871](https://nvd.nist.gov/vuln/detail/CVE-2026-75871)
- [CVE-2026-75871 CVE record](https://www.cve.org/CVERecord?id=CVE-2026-75871)
- [GitLab work item 616990](https://gitlab.com/gitlab-org/gitlab/-/work_items/616990)
- [HackerOne report 3945100](https://hackerone.com/reports/3945100)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [identity and access](../identity-and-access/index.md)
- [AI provider override trust boundaries](ai-provider-override-trust-boundaries.md)

## Open Questions

- Which exact GitLab AI Gateway release first fixed CVE-2026-75871, and did the patch reject caller-controlled Host overrides before attaching Vertex AI or Bedrock credentials?

## Maintenance Notes

- Created on 2026-08-28 from the [August 27 topic collector](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) after splitting the GitLab AI Gateway advisory pair into independently maintainable redirect mechanisms; next check fixed-release wording and exploitation state from GitLab and HackerOne.
