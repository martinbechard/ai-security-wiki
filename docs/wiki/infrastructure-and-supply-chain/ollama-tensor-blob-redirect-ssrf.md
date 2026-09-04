---
type: "Topic"
title: "Ollama Tensor Blob Redirect SSRF"
description: "Security analysis for CVE-2026-85180 cross-host tensor-layer redirect SSRF during Ollama model pulls."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# Ollama Tensor Blob Redirect SSRF

## Current Understanding

The [September 3 topic collector source](../../../raw/processed/2026-09-03/ai-security-wiki-topic-news-collector-2026-09-03T233104Z.json) records [CVE-2026-85180](https://nvd.nist.gov/vuln/detail/CVE-2026-85180) for Ollama 0.30.0 through 0.33.2. Broad Ollama runtime and product context belongs upstream; this page owns the model-acquisition security boundary where tensor-layer pulls can follow attacker-controlled redirects.

[NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-85180), the [direct CVE record](https://cveawg.mitre.org/api/cve/CVE-2026-85180), [GitHub issue 17041](https://github.com/ollama/ollama/issues/17041), and the [VulnCheck advisory](https://www.vulncheck.com/advisories/ollama-0.30.0-through-0.33.2-ssrf-via-cross-host-tensor-blob-redirect) describe redirect validation failure during tensor-layer model pulls. An unauthenticated attacker who controls a registry can serve a malicious tensor-layer manifest and cause the Ollama server to issue GET requests to arbitrary destinations, including internal hosts and cloud metadata endpoints.

## Security Impact

- Threat: malicious model registries can redirect model-pull traffic into internal networks or metadata services.
- Affected boundary: Ollama 0.30.0 through 0.33.2, tensor-layer manifests, blob download redirects, model registry trust, and runtime network egress.
- Exploit or incident status: public NVD/CVE and advisory records; no local incident is recorded.
- Mitigation state: fixed version is not identified in the local source; restrict registry trust, deny cross-host redirects, and block metadata-service egress from model-runtime hosts.
- Confidence: high from direct NVD/CVE timestamps and advisory references; medium for remediation until a release boundary is confirmed.
- Residual risk: model acquisition can become a server-side request primitive even when the model runtime itself is otherwise local.

## Control Implications

- Treat model registries as network-input providers that must not control arbitrary blob destinations.
- Enforce egress allow-lists and metadata-service blocks on local model-serving hosts.
- Validate redirects after every hop and keep tensor-layer downloads bound to the trusted registry origin.

## Authoritative Sources

- [September 3 topic collector source](../../../raw/processed/2026-09-03/ai-security-wiki-topic-news-collector-2026-09-03T233104Z.json)
- [NVD CVE-2026-85180](https://nvd.nist.gov/vuln/detail/CVE-2026-85180)
- [CVE-2026-85180 direct CVE record](https://cveawg.mitre.org/api/cve/CVE-2026-85180)
- [GitHub issue 17041](https://github.com/ollama/ollama/issues/17041)
- [VulnCheck Ollama tensor blob redirect advisory](https://www.vulncheck.com/advisories/ollama-0.30.0-through-0.33.2-ssrf-via-cross-host-tensor-blob-redirect)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [model processing data residency controls](../data-and-privacy/model-processing-data-residency-controls.md)
- [Jina AI Reader private-address SSRF](jina-ai-reader-private-address-ssrf.md)

## Open Questions

- Which Ollama release blocks cross-host tensor-blob redirects or documents the intended redirect policy?

## Maintenance Notes

- Created on 2026-09-03 from the [September 3 topic collector](../../../raw/processed/2026-09-03/ai-security-wiki-topic-news-collector-2026-09-03T233104Z.json) as a model-pull SSRF and registry-trust boundary.
