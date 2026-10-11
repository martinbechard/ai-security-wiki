---
type: "Topic"
title: "OpenLIT Telemetry Project Header Prompt Read"
description: "Security analysis for CVE-2026-108596 cross-project prompt and completion reads in OpenLIT telemetry APIs."
tags: ["data-and-privacy"]
---

# OpenLIT Telemetry Project Header Prompt Read

## Current Understanding

The [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) records [CVE-2026-108596](https://cveawg.mitre.org/api/cve/CVE-2026-108596) for OpenLIT 2.1.0. Broad OpenLIT observability context belongs upstream or in ai-dev-wiki; this page owns telemetry confidentiality and tenant authorization.

Authenticated users can forge `x-openlit-project-id` and query another project when they know a victim project id and database config id. The affected trace APIs can return LLM prompts and completions, making project headers part of the tenant boundary for sensitive AI telemetry.

## Security Impact

- Threat: LLM prompts and completions can leak across OpenLIT projects through forged headers.
- Affected boundary: OpenLIT 2.1.0, `x-openlit-project-id`, database config ids, trace APIs, and authenticated project isolation.
- Exploit or incident status: public CVE Services and NVD evidence; no confirmed exploitation incident is recorded locally.
- Mitigation state: bind project ids to authenticated membership server-side, ignore caller-supplied tenant headers unless verified, and rotate exposed telemetry where needed.
- Confidence: high for authorization bypass and sensitive-data exposure from CVE evidence.
- Residual risk: AI observability traces need tenant-bound authorization because prompts and completions often contain proprietary or personal data.

## Authoritative Sources

- [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json)
- [CVE-2026-108596 record](https://cveawg.mitre.org/api/cve/CVE-2026-108596)
- [NVD CVE-2026-108596](https://nvd.nist.gov/vuln/detail/CVE-2026-108596)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [AI coding telemetry access controls](ai-coding-telemetry-access-controls.md)
- [AI coding telemetry redaction controls](ai-coding-telemetry-redaction-controls.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-10-11 from the [October 10 topic collector source](../../../raw/processed/2026-10-10/ai-security-wiki-topic-news-collector-2026-10-10T232615Z.json) after upstream index routing kept broad product and framework context outside the local security wiki.
