---
type: "Topic"
title: "Kubeflow Pipelines Run-Log Authorization Bypass"
description: "Security analysis for CVE-2026-118759 missing run-level log authorization."
tags: ["data-and-privacy", "identity-and-access"]
---

# Kubeflow Pipelines Run-Log Authorization Bypass

## Current Understanding

The [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json) and [October 31 collector](../../../raw/processed/2026-10-31/ai-security-wiki-topic-news-collector-2026-10-31T232757Z.json) record [CVE-2026-118759](https://nvd.nist.gov/vuln/detail/CVE-2026-118759): Kubeflow Pipelines before 2.18.0 retrieves selected run logs without authorizing the caller against that run and accepts a caller-selected pod name.

## Security Impact

- Threat: a reachable user can read logs from another workload.
- Affected boundary: Kubeflow Pipelines before 2.18.0, run and node log routes, and pod-name selection.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: upgrade to 2.18.0 or later; the maintainer advisory says the fix authorizes `readLog` and checks the pipeline/run ID label for live logs. Review deployment-specific Kubernetes role grants after upgrading.
- Confidence and residual risk: high for disclosure; logs can contain training, inference, and connector context.

## Authoritative Sources

- [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json)
- [October 31 collector](../../../raw/processed/2026-10-31/ai-security-wiki-topic-news-collector-2026-10-31T232757Z.json)
- [NVD CVE-2026-118759](https://nvd.nist.gov/vuln/detail/CVE-2026-118759)
- [Kubeflow advisory GHSA-wg5q-x4j9-qm54](https://github.com/kubeflow/pipelines/security/advisories/GHSA-wg5q-x4j9-qm54)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)

## Open Questions

- Which log backends expose sensitive output after route authorization is corrected?

## Maintenance Notes

- Created on 2026-10-30 as a distinct Kubeflow Pipelines data boundary.
- Updated on 2026-10-31 with maintainer advisory remediation details; no additional digest entry is needed because the durable boundary is unchanged.
