---
type: "Topic"
title: "Kubeflow Pipelines Archive Decompression Resource Exhaustion"
description: "Security analysis for CVE-2026-118761 pre-authorization archive expansion."
tags: ["infrastructure-and-supply-chain", "threats-and-attacks"]
---

# Kubeflow Pipelines Archive Decompression Resource Exhaustion

## Current Understanding

The [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json) records [CVE-2026-118761](https://nvd.nist.gov/vuln/detail/CVE-2026-118761): Kubeflow Pipelines before 2.18.0 decompresses uploaded pipeline archives before namespace authorization without adequately bounding expanded data.

## Security Impact

- Threat: a reachable caller can exhaust API-server resources before authorization.
- Affected boundary: Kubeflow Pipelines before 2.18.0, archive upload, decompression, and namespace authorization order.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: upgrade to 2.18.0 or later and enforce compressed and expanded size limits before costly processing.
- Confidence and residual risk: high for availability impact; edge limits and workload quotas remain required defense in depth.

## Authoritative Sources

- [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json)
- [NVD CVE-2026-118761](https://nvd.nist.gov/vuln/detail/CVE-2026-118761)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)

## Open Questions

- What decompression ratio and expanded-size controls does the fixed release enforce?

## Maintenance Notes

- Created on 2026-10-30 as a distinct pre-authorization availability boundary.
