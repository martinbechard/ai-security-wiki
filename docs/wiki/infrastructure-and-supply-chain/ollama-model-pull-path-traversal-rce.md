---
type: "Topic"
title: "Ollama Model Pull Path Traversal RCE"
description: "Security analysis for CVE-2026-103663 path traversal in Ollama model pulls leading to host file write and restart-time code execution."
tags: ["infrastructure-and-supply-chain"]
---

# Ollama Model Pull Path Traversal RCE

## Current Understanding

The [October 9 topic collector source](../../../raw/processed/2026-10-09/ai-security-wiki-topic-news-collector-2026-10-09T233308Z.json) records [CVE-2026-103663](https://cveawg.mitre.org/api/cve/CVE-2026-103663) for Ollama 0.34.2 and later releases before 0.35.0. Broad Ollama runtime coverage belongs upstream; this page owns the local model-acquisition supply-chain boundary where registry-provided layer digests can become filesystem writes outside the model store.

[CERT Polska](https://cert.pl/en/posts/2026/10/CVE-2026-103663/) and the [CVE record](https://cveawg.mitre.org/api/cve/CVE-2026-103663) describe insufficient validation in `digestToPath` for the `/api/pull` endpoint. An unauthenticated remote attacker can provide path traversal sequences as layer digests, causing a malicious binary to be written outside the model store. When the server process can write to `/usr/lib/ollama`, including in common Docker-image conditions described by CERT Polska, the malicious file can be loaded and executed as root on the next server restart. Ollama 0.35.0 is recorded as fixed.

## Security Impact

- Threat: a model-pull endpoint can cross from registry metadata into arbitrary filesystem writes and restart-time code execution.
- Affected boundary: Ollama 0.34.2 and later releases before 0.35.0, `/api/pull`, layer digest validation, model-store path construction, Docker image write permissions, and server restart loading behavior.
- Exploit or incident status: public CERT Polska, CVE Services, and NVD evidence; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to Ollama 0.35.0 or later, canonicalize and constrain layer digest paths, run the server with write access limited to the model store, and treat model registries as supply-chain inputs.
- Confidence: high for affected range, exploit preconditions, and fixed version from CERT Polska and the CVE record.
- Residual risk: model acquisition controls need both digest canonicalization and container filesystem hardening because path patches do not remove all registry trust.

## Authoritative Sources

- [October 9 topic collector source](../../../raw/processed/2026-10-09/ai-security-wiki-topic-news-collector-2026-10-09T233308Z.json)
- [CVE-2026-103663 record](https://cveawg.mitre.org/api/cve/CVE-2026-103663)
- [CERT Polska Ollama advisory](https://cert.pl/en/posts/2026/10/CVE-2026-103663/)
- [NVD CVE-2026-103663](https://nvd.nist.gov/vuln/detail/CVE-2026-103663)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [Ollama tensor blob redirect SSRF](ollama-tensor-blob-redirect-ssrf.md)
- [agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)

## Open Questions

- Do Ollama 0.35.0 tests cover traversal attempts across every layer digest form and manifest media type accepted by `/api/pull`?

## Maintenance Notes

- Created on 2026-10-10 from the [October 9 topic collector source](../../../raw/processed/2026-10-09/ai-security-wiki-topic-news-collector-2026-10-09T233308Z.json) as a model-pull path-containment leaf distinct from the earlier tensor-blob redirect SSRF page.
