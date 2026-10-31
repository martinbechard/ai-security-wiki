---
type: "Topic"
title: "Kubeflow Pipelines Volume Artifact Path Traversal"
description: "Security analysis for CVE-2026-118758 volume artifact path containment failure."
tags: ["infrastructure-and-supply-chain", "data-and-privacy"]
---

# Kubeflow Pipelines Volume Artifact Path Traversal

## Current Understanding

The [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json) records [CVE-2026-118758](https://nvd.nist.gov/vuln/detail/CVE-2026-118758): Kubeflow Pipelines before 2.18.0 does not confine requested volume-artifact paths, allowing a reachable caller with a mounted-volume name to read accessible files outside that volume.

## Security Impact

- Threat: a path request can cross the intended volume boundary and disclose accessible files.
- Affected boundary: Kubeflow Pipelines before 2.18.0 and the volume-artifact GET path.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: upgrade to 2.18.0 or later and enforce canonical path containment after resolution.
- Confidence and residual risk: high for the boundary; mounted credentials and pipeline inputs remain exposed where route access is broad.

## Authoritative Sources

- [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json)
- [NVD CVE-2026-118758](https://nvd.nist.gov/vuln/detail/CVE-2026-118758)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)

## Open Questions

- Does the 2.18.0 fix apply containment after symlink resolution on every artifact route?

## Maintenance Notes

- Created on 2026-10-30 as one of four independently maintained Kubeflow Pipelines boundaries.
