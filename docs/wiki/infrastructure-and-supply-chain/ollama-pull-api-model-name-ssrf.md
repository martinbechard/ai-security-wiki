---
type: "Topic"
title: "Ollama Pull API Model-Name SSRF"
description: "Security analysis for CVE-2026-108836, where Ollama Pull API model-name validation can permit server-side request forgery."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# Ollama Pull API Model-Name SSRF

## Current Understanding

The [October 12 topic collector source](../../../raw/processed/2026-10-12/ai-security-wiki-topic-news-collector-2026-10-12T233447Z.json) records [CVE-2026-108836](https://nvd.nist.gov/vuln/detail/CVE-2026-108836) for Ollama 0.34.0 and 0.34.1. Broad Ollama runtime context belongs upstream; this page owns the model-acquisition network-fetch boundary for Pull API model-name validation.

The CVE evidence says the Pull API `IsValid` function in `types/model/name.go` permits SSRF. The source records remote exploitation as possible, public exploit details, and Ollama 0.34.2 with patch `dfabde4539e42ba1e1eab50a3a50b88aea7958a0` as the fix.

## Security Impact

- Threat: model-name input can turn model pulling into unintended internal network access or metadata probing.
- Affected boundary: Ollama 0.34.0 and 0.34.1, Pull API model-name validation, and server-side model-fetch behavior.
- Exploit or incident status: public CVE with public exploit details; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to 0.34.2 or later and validate Pull API destinations before fetch.
- Confidence: high for affected versions, public-exploit status, and fixed version from NVD-backed source evidence.
- Residual risk: model-acquisition paths remain supply-chain and egress-control boundaries even when filesystem traversal is separately patched.

## Control Implications

- Apply SSRF destination controls to model names, registry identifiers, redirects, and resolved hosts.
- Keep model-fetch network controls separate from model-store filesystem containment controls.
- Treat proof-of-concept repositories as untrusted evidence and do not execute them during validation.

## Authoritative Sources

- [October 12 topic collector source](../../../raw/processed/2026-10-12/ai-security-wiki-topic-news-collector-2026-10-12T233447Z.json)
- [NVD CVE-2026-108836](https://nvd.nist.gov/vuln/detail/CVE-2026-108836)
- [Ollama patch commit dfabde4539e42ba1e1eab50a3a50b88aea7958a0](https://github.com/ollama/ollama/commit/dfabde4539e42ba1e1eab50a3a50b88aea7958a0)
- [Ollama 0.34.2 release](https://github.com/ollama/ollama/releases/tag/v0.34.2)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [Ollama model pull path traversal RCE](ollama-model-pull-path-traversal-rce.md)
- [Ollama tensor blob redirect SSRF](ollama-tensor-blob-redirect-ssrf.md)

## Open Questions

- Which Ollama 0.34.2 regression test proves Pull API model names cannot steer fetches to loopback, private, or metadata destinations?

## Maintenance Notes

- Created on 2026-10-13 from the October 12 topic collector as a model-name SSRF leaf distinct from the October 9 model-pull path traversal RCE.
