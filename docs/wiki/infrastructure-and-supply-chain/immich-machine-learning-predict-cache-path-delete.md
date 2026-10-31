---
type: "Topic"
title: "Immich Machine-Learning Predict Cache-Path Delete"
description: "Security analysis for CVE-2026-119328 unauthenticated ML runtime configuration."
tags: ["infrastructure-and-supply-chain", "identity-and-access"]
---

# Immich Machine-Learning Predict Cache-Path Delete

## Current Understanding

The [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json) records [CVE-2026-119328](https://nvd.nist.gov/vuln/detail/CVE-2026-119328): Immich before 3.3.0 allows unauthenticated callers to set model-construction options at `/predict`, including a writable `cache_dir` recursively removed after selected load failures.

## Security Impact

- Threat: unauthenticated runtime options can mutate mounted data through cache lifecycle cleanup.
- Affected boundary: Immich before 3.3.0, ML `/predict`, model options, and cache paths.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: upgrade to 3.3.0 and restrict network access to the ML service.
- Confidence and residual risk: high for the boundary; model runtime configuration must not be caller-controlled.

## Authoritative Sources

- [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json)
- [NVD CVE-2026-119328](https://nvd.nist.gov/vuln/detail/CVE-2026-119328)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)

## Open Questions

- Does remediation authenticate the ML listener as well as constrain cache paths?

## Maintenance Notes

- Created on 2026-10-30 from NVD-backed collector evidence.
