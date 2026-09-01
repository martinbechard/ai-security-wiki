---
type: "Topic"
title: "OpenShift AI guardrails-detectors ReDoS"
description: "Security analysis for CVE-2026-15154 guardrails-detectors regular-expression denial of service in Red Hat OpenShift AI."
tags: ["infrastructure-and-supply-chain", "testing-and-assurance", "model-and-prompt-security"]
---

# OpenShift AI guardrails-detectors ReDoS

## Current Understanding

The [August 31 topic collector source](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json) records an in-window NVD update for [CVE-2026-15154](https://nvd.nist.gov/vuln/detail/CVE-2026-15154), a guardrails-detectors ReDoS flaw in Red Hat OpenShift AI. OpenShift AI and TrustyAI product coverage belongs upstream; this page owns the local guardrail-runtime availability boundary.

NVD and the referenced [Red Hat CVE record](https://access.redhat.com/security/cve/CVE-2026-15154) describe crafted regular expressions sent to the public detection API that can trigger catastrophic backtracking and consume a worker at 100% CPU. The collector cites Red Hat errata [RHSA-2026:53261](https://access.redhat.com/errata/RHSA-2026:53261), [RHSA-2026:53262](https://access.redhat.com/errata/RHSA-2026:53262), [RHSA-2026:53263](https://access.redhat.com/errata/RHSA-2026:53263), and [RHSA-2026:60520](https://access.redhat.com/errata/RHSA-2026:60520) as remediation references.

## Security Impact

- Threat: malicious detector input can deny service to a guardrail worker and degrade the LLM pipeline that depends on detector availability.
- Affected boundary: guardrails-detectors before `d857e059f8a2dedb5c7ea9a2c307c4cfd7983fd1`, with affected Red Hat OpenShift AI 2.25, 3.3, and 3.4 packages per NVD affected data captured by the collector.
- Exploit or incident status: public CVE and vendor errata references; no local incident is recorded.
- Mitigation state: apply the relevant Red Hat fixed packages and bound detector evaluation time, regex complexity, and worker concurrency.
- Confidence: medium-high because the original disclosure predates the run window, but NVD records an in-window modification with Red Hat errata references.
- Residual risk: guardrails are security dependencies, so detector DoS can silently remove or delay controls unless availability is monitored.

## Control Implications

- Treat guardrail detector availability as part of the AI runtime security boundary.
- Add timeout, cancellation, and concurrency limits around regex or pattern detector execution.
- Monitor detector latency, CPU saturation, and bypass/degraded-mode decisions alongside model runtime telemetry.

## Authoritative Sources

- [August 31 topic collector source](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json)
- [NVD CVE-2026-15154](https://nvd.nist.gov/vuln/detail/CVE-2026-15154)
- [Red Hat CVE-2026-15154](https://access.redhat.com/security/cve/CVE-2026-15154)
- [RHSA-2026:53261](https://access.redhat.com/errata/RHSA-2026:53261)
- [RHSA-2026:53262](https://access.redhat.com/errata/RHSA-2026:53262)
- [RHSA-2026:53263](https://access.redhat.com/errata/RHSA-2026:53263)
- [RHSA-2026:60520](https://access.redhat.com/errata/RHSA-2026:60520)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [testing and assurance](../testing-and-assurance/index.md)
- [AI guardrail dependency compromise](ai-guardrail-dependency-compromise.md)

## Open Questions

- Which Red Hat erratum introduced the in-window August 31 update: package fix, affected-product enrichment, or metadata correction?

## Maintenance Notes

- Created on 2026-08-31 from the [August 31 topic collector](../../../raw/processed/2026-08-31/ai-security-wiki-topic-news-collector-2026-08-31T233224Z.json) as a guardrail-runtime availability leaf.
