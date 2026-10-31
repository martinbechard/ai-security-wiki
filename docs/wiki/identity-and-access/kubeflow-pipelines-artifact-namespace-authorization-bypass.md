---
type: "Topic"
title: "Kubeflow Pipelines Artifact Namespace Authorization Bypass"
description: "Security analysis for CVE-2026-118760 cross-namespace artifact access."
tags: ["identity-and-access", "data-and-privacy"]
---

# Kubeflow Pipelines Artifact Namespace Authorization Bypass

## Current Understanding

The [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json) records [CVE-2026-118760](https://nvd.nist.gov/vuln/detail/CVE-2026-118760): Kubeflow Pipelines 0.5.1 through 2.17.0 does not authorize caller access to namespaces selected on frontend artifact routes, exposing another tenant's datasets, models, or outputs when locations are known.

## Security Impact

- Threat: a user can read artifacts across tenant namespaces.
- Affected boundary: Kubeflow Pipelines 0.5.1 through 2.17.0 and frontend artifact namespace selection.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: the source's affected range includes 2.17.0 while its follow-up names 2.17.0 or later; bind namespace selection to the authenticated principal and confirm the fixed release before treating an upgrade as sufficient.
- Confidence and residual risk: high for cross-tenant confidentiality impact; known artifact locations remain sensitive identifiers.

## Authoritative Sources

- [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json)
- [NVD CVE-2026-118760](https://nvd.nist.gov/vuln/detail/CVE-2026-118760)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [identity and access](index.md)

## Open Questions

- Does the fixed route authorize both artifact namespace and individual artifact ownership, and is 2.17.0 included or excluded from the fixed range?

## Maintenance Notes

- Created on 2026-10-30 as a distinct Kubeflow Pipelines tenant-isolation boundary.
