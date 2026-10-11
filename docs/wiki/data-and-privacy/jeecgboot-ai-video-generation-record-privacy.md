---
type: "Topic"
title: "JeecgBoot AI Video Generation Record Privacy"
description: "Security analysis for CVE-2026-108672 cross-user JeecgBoot AI video generation record reads."
tags: ["data-and-privacy"]
---

# JeecgBoot AI Video Generation Record Privacy

## Current Understanding

The [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) records JeecgBoot through 3.9.5 low-privilege reads of other users AI video generation records. Broad JeecgBoot product context belongs upstream; this page owns generated-media job privacy for CVE-2026-108672.

The collector names `VideoGenerationController` and says users can read other users video generation records because permission checks are missing or commented out. AI video records can expose:

- prompts,
- outputs,
- job metadata, and
- business context.

The privacy boundary belongs under data and privacy.

## Security Impact

- Threat: AI video generation records can be read across users.
- Affected boundary: JeecgBoot through 3.9.5, `VideoGenerationController`, video generation records, user ownership, and missing permission checks.
- Exploit or incident status: public NVD evidence in the October 10 JeecgBoot cluster; no confirmed exploitation incident is recorded locally.
- Mitigation state: restore owner checks, redact generated-media metadata from list APIs, and audit prior reads of video job records.
- Confidence: high for the cross-user video-record boundary from NVD evidence.
- Residual risk: generated-media job records should be treated as sensitive AI telemetry and protected by user or tenant ownership.

## Authoritative Sources

- [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json)
- [NVD CVE-2026-108672](https://nvd.nist.gov/vuln/detail/CVE-2026-108672)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [AI coding telemetry access controls](ai-coding-telemetry-access-controls.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-10-11 from the [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) after upstream index routing kept broad JeecgBoot product context outside the local security wiki.
