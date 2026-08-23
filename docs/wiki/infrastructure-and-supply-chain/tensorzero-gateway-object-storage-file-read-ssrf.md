---
type: "Topic"
title: "TensorZero Gateway Object Storage File Read SSRF"
description: "Security analysis for CVE-2026-54457 TensorZero gateway internal object-storage arbitrary file-read and SSRF exposure."
tags: ["infrastructure-and-supply-chain", "data-and-privacy"]
---

# TensorZero Gateway Object Storage File Read SSRF

## Current Understanding

The [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) records CVE-2026-54457 for TensorZero before 2026.6.0. Broad TensorZero and LLMOps product context belongs upstream if it becomes durable; this page owns the local gateway data-plane and object-storage boundary.

The [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-54457), linked [GitHub advisory](https://github.com/tensorzero/tensorzero/security/advisories/GHSA-824w-x939-6cmc), and [OpenCVE record](https://app.opencve.io/cve/CVE-2026-54457) describe an internal object-storage endpoint that can be abused for arbitrary file read and SSRF by selecting filesystem or attacker-controlled object-storage backends.

## Security Impact

- Threat: an LLMOps gateway object-storage endpoint can expose local files or become an SSRF relay when backend selection is attacker-influenced.
- Affected boundary: TensorZero before 2026.6.0 internal object-storage endpoint and backend selection.
- Exploit or incident status: public NVD and GitHub advisory evidence; no local exploitation evidence is recorded.
- Mitigation state: upgrade to 2026.6.0 or later, restrict backend schemes and destinations, and isolate gateway file access from host secrets and model artifacts.
- Confidence: high for advisory identity and affected range from NVD and linked GitHub evidence.
- Residual risk: model gateways often hold provider keys, traces, datasets, and artifacts, making backend-selection bugs high-impact even without direct model compromise.

## Authoritative Sources

- [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json)
- [NVD CVE-2026-54457](https://nvd.nist.gov/vuln/detail/CVE-2026-54457)
- [GitHub advisory GHSA-824w-x939-6cmc](https://github.com/tensorzero/tensorzero/security/advisories/GHSA-824w-x939-6cmc)
- [OpenCVE CVE-2026-54457](https://app.opencve.io/cve/CVE-2026-54457)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [LiteLLM supply-chain secret exposure](litellm-supply-chain-secret-exposure.md)
- [agent network egress controls](../agent-and-tool-security/agent-network-egress-controls.md)

## Open Questions

- Which TensorZero configurations expose the vulnerable internal object-storage endpoint to untrusted callers?

## Maintenance Notes

- Created on 2026-08-22 from the [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) as an LLM gateway object-storage boundary leaf.
