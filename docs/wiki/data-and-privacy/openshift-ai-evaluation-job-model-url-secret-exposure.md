---
type: "Topic"
title: "OpenShift AI Evaluation-Job Model URL Secret Exposure"
description: "Security analysis for CVE-2026-17557 model URL control over evaluation-job credentials and egress."
tags: ["data-and-privacy", "testing-and-assurance"]
---

# OpenShift AI Evaluation-Job Model URL Secret Exposure

## Current Understanding

The [October 21 topic collector source](../../../raw/processed/2026-10-21/ai-security-wiki-topic-news-collector-2026-10-21T193103-0400.json) records [CVE-2026-17557](https://nvd.nist.gov/vuln/detail/CVE-2026-17557) for Red Hat OpenShift AI `lm-evaluation-harness` jobs. General OpenShift AI and evaluation tooling belong upstream; this leaf owns the evaluation-job secret and outbound-model URL boundary.

## Security Impact

- Threat: an authenticated job submitter can use a malicious model URL to disclose a tenant model-authentication secret to an external listener or reach internal services through SSRF.
- Affected boundary: OpenShift AI `lm-evaluation-harness` evaluation jobs; the collected NVD record does not state exact affected or fixed builds.
- Exploit or incident status: public CVE disclosure; no local exploitation incident is recorded.
- Mitigation state: await a product-specific Red Hat erratum for fixed-build details; meanwhile allowlist model sources and isolate evaluation-job egress and secrets.
- Confidence: high for the NVD-described mechanism and medium for version or patch status.
- Residual risk: release-gate infrastructure can hold credentials whose exposure is not limited to the evaluation workload itself.

## Authoritative Sources

- [October 21 topic collector source](../../../raw/processed/2026-10-21/ai-security-wiki-topic-news-collector-2026-10-21T193103-0400.json)
- [October 23 leaf update watch source](../../../raw/processed/2026-10-23/ai-security-wiki-leaf-update-watch-20261023T000535Z.json)
- [NVD CVE-2026-17557](https://nvd.nist.gov/vuln/detail/CVE-2026-17557)
- [Red Hat security advisories](https://access.redhat.com/security/security-updates/security-advisories)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [agent network egress controls](../agent-and-tool-security/agent-network-egress-controls.md)

## Open Questions

- Which Red Hat erratum identifies affected and fixed OpenShift AI builds for CVE-2026-17557?

## Maintenance Notes

- Updated on 2026-10-23 with watcher provenance; no distinct security delta was reported.
- Created on 2026-10-21 from the October 21 topic collector; do not infer a fixed version before the product erratum is available.
