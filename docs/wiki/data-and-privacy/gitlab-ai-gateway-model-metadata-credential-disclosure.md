---
type: "Topic"
title: "GitLab AI Gateway model metadata credential disclosure"
description: "Security analysis for CVE-2026-19889 GitLab AI Gateway model metadata redirection that can disclose cloud model credentials."
tags: ["data-and-privacy", "identity-and-access"]
---

# GitLab AI Gateway model metadata credential disclosure

## Current Understanding

The [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) records [CVE-2026-19889](https://nvd.nist.gov/vuln/detail/CVE-2026-19889) as a GitLab AI Gateway model metadata redirection flaw. Broad [GitLab Duo Agent Platform and cloud provider context](../../../upstream-ai-wiki/topic-index.md) belongs upstream; this page owns the local model-routing metadata and cloud credential disclosure boundary.

## Security Impact

- Threat: an authenticated Duo Agent Platform user can redirect outbound model requests through crafted model metadata and expose Google Vertex AI or AWS Bedrock service credentials.
- Affected boundary: GitLab AI Gateway 18.9.0-19.0.12, 19.1-19.1.7, and 19.2-19.2.2.
- Exploit or incident status: public NVD, GitLab work-item, and HackerOne report evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: apply the GitLab remediation for the affected versions; bind model metadata to approved provider destinations before attaching provider credentials.
- Confidence: high for advisory existence and affected boundary; medium for exact fixed-release wording because the raw source names remediated ranges but not the final patched release labels.
- Residual risk: model routing metadata becomes a credential exfiltration path when final destination authorization is separated from provider-token attachment.

## Authoritative Sources

- [August 29 leaf update watch source](../../../raw/processed/2026-08-29/ai-security-wiki-leaf-update-watch-20260829T000405Z.json)
- [August 27 topic collector source](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json)
- [NVD CVE-2026-19889](https://nvd.nist.gov/vuln/detail/CVE-2026-19889)
- [CVE-2026-19889 CVE record](https://www.cve.org/CVERecord?id=CVE-2026-19889)
- [GitLab work item 614164](https://gitlab.com/gitlab-org/gitlab/-/work_items/614164)
- [HackerOne report 3938027](https://hackerone.com/reports/3938027)

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

- Which exact GitLab AI Gateway release first fixed CVE-2026-19889, and did the patch bind model metadata to an allowlisted provider endpoint before credential attachment?

## Maintenance Notes

- Updated on 2026-08-29 with [August 29 watcher](../../../raw/processed/2026-08-29/ai-security-wiki-leaf-update-watch-20260829T000405Z.json) provenance for the same durable advisory boundary.
- Created on 2026-08-28 from the [August 27 topic collector](../../../raw/processed/2026-08-27/ai-security-wiki-topic-news-collector-2026-08-27T233104Z.json) after splitting the GitLab AI Gateway advisory pair into independently maintainable redirect mechanisms; next check fixed-release wording and exploitation state from GitLab and HackerOne.
