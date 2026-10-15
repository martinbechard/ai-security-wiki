---
type: "Topic"
title: "Kubeflow Model Registry Annotation SSRF and Token Exposure"
description: "Security analysis for CVE-2026-110220 annotation-driven SSRF against the Model Registry controller identity."
tags: ["infrastructure-and-supply-chain", "identity-and-access"]
---

# Kubeflow Model Registry Annotation SSRF and Token Exposure

## Current Understanding

[The October 14 collector](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json) records [CVE-2026-110220](https://nvd.nist.gov/vuln/detail/CVE-2026-110220) for Kubeflow Model Registry through 0.3.17. Broad Kubeflow context belongs upstream; this page owns the model-registry annotation egress and workload-identity boundary.

## Security Impact

- Threat: a namespace user can point `modelregistry.kubeflow.org/url` at an attacker server and capture the controller ServiceAccount bearer token.
- Affected boundary: Model Registry through 0.3.17, InferenceService annotations, and controller identity.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: the collector does not identify a fixed release.
- Confidence and residual risk: high for NVD's stated impact; controller credentials can enable cross-tenant InferenceService changes.

## Control Implications

- Disallow untrusted annotation egress and enforce destination controls for controllers.
- Bind controller ServiceAccount permissions narrowly and rotate exposed tokens during incident response.

## Authoritative Sources

- [October 14 topic collector source](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json)
- [NVD CVE-2026-110220](https://nvd.nist.gov/vuln/detail/CVE-2026-110220)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [identity and access](../identity-and-access/index.md)

## Open Questions

- Which Kubeflow release or patch constrains annotation URL retrieval?

## Maintenance Notes

- Created on 2026-10-14 from the October 14 collector.
