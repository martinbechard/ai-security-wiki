---
type: "Topic"
title: "NVIDIA Model Optimizer Untrusted Deserialization"
description: "Security analysis of CVE-2026-67455 at the model-artifact deserialization boundary."
tags: ["infrastructure-and-supply-chain"]
---

# NVIDIA Model Optimizer Untrusted Deserialization

## Current Understanding

The [November 18 topic collector source](../../../raw/processed/2026-11-18/ai-security-wiki-topic-news-collector-2026-11-18T003403Z.json) records [CVE-2026-67455](https://nvd.nist.gov/vuln/detail/CVE-2026-67455) for NVIDIA Model Optimizer on Linux and Windows. Broad NVIDIA and Model Optimizer context belongs upstream; this page owns the model-artifact and runtime supply-chain boundary.

The public record says an attacker could cause deserialization of untrusted data. The collected public evidence does not establish affected or fixed versions, severity, exploit prerequisites, a vendor bulletin, or a vendor remediation. Treat this as a deployment-verification requirement rather than evidence that a particular installation is currently vulnerable.

## Security Impact

- Threat: untrusted model or optimization data can cross into a GPU-enabled pipeline through unsafe deserialization.
- Affected boundary: Model Optimizer artifact intake on Linux and Windows; version range is not established.
- Exploit or incident status: public CVE record; no public exploit or incident is recorded in the source.
- Mitigation state: isolate untrusted artifacts, restrict artifact provenance, and obtain vendor affected-version and patch guidance before deployment decisions.
- Confidence: medium for the vulnerability class and product boundary; low-to-medium for operational applicability until NVIDIA publishes remediation details.
- Residual risk: deployments cannot reliably assess exposure or patch status without the missing vendor version and severity information.

## Authoritative Sources

- [November 18 topic collector source](../../../raw/processed/2026-11-18/ai-security-wiki-topic-news-collector-2026-11-18T003403Z.json)
- [CVE-2026-67455](https://nvd.nist.gov/vuln/detail/CVE-2026-67455)
- [OpenCVE rendering for CVE-2026-67455](https://app.opencve.io/cve/CVE-2026-67455)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [AI supply-chain provenance credentialing](ai-supply-chain-provenance-credentialing.md)

## Open Questions

- Which NVIDIA security bulletin establishes the affected and fixed Model Optimizer versions, severity, and exploit prerequisites for CVE-2026-67455?

## Maintenance Notes

- Created on 2026-11-18 from the November 18 collector; do not infer a patch boundary until NVIDIA publishes one.
