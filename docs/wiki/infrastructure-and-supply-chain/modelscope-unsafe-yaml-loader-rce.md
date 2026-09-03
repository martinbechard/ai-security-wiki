---
type: "Topic"
title: "ModelScope Unsafe YAML Loader RCE"
description: "Security analysis for CVE-2026-84202 unsafe PyYAML model configuration loading in ModelScope."
tags: ["infrastructure-and-supply-chain", "model-and-prompt-security"]
---

# ModelScope Unsafe YAML Loader RCE

## Current Understanding

The [September 1 topic collector source](../../../raw/processed/2026-09-01/ai-security-wiki-topic-news-collector-2026-09-01T233307Z.json) records [CVE-2026-84202](https://nvd.nist.gov/vuln/detail/CVE-2026-84202) for ModelScope model configuration parsing. Broad ModelScope platform context belongs upstream; this page owns the local model-repository code-execution boundary.

NVD says ModelScope uses PyYAML's unsafe `yaml.Loader` when parsing model configuration files. Malicious model repositories can include Python object construction tags that execute arbitrary code when the configuration is loaded. The fetched record did not provide affected or fixed versions.

## Security Impact

- Threat: model configuration files can become arbitrary code execution payloads.
- Affected boundary: ModelScope YAML model configuration parsing; exact affected versions not captured locally.
- Exploit or incident status: public NVD vulnerability record; no local incident is recorded.
- Mitigation state: fixed version not yet identified; prefer safe YAML loaders, repository provenance checks, and isolated runtimes for untrusted model repositories.
- Confidence: medium-high for vulnerability class from NVD; medium for operational remediation until vendor evidence is captured.
- Residual risk: model repositories contain executable-adjacent metadata as well as weights and code.

## Control Implications

- Forbid unsafe YAML object construction for model metadata and configuration.
- Load untrusted model repositories inside disposable, least-privilege environments.
- Treat model config parsers as supply-chain attack surfaces requiring dependency and regression tests.

## Authoritative Sources

- [September 2 topic collector source](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json)
- [September 2 leaf update watch source](../../../raw/processed/2026-09-02/ai-security-wiki-leaf-update-watch-20260903T000347Z.json)
- [September 1 topic collector source](../../../raw/processed/2026-09-01/ai-security-wiki-topic-news-collector-2026-09-01T233307Z.json)
- [NVD CVE-2026-84202](https://nvd.nist.gov/vuln/detail/CVE-2026-84202)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [AI supply chain provenance credentialing](ai-supply-chain-provenance-credentialing.md)
- [agent build and dependency execution boundaries](agent-build-and-dependency-execution-boundaries.md)

## Open Questions

- Which ModelScope versions are affected and which release replaces unsafe YAML loading?

## Maintenance Notes

- Updated on 2026-09-02 from the [September 2 topic collector source](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json) with in-window advisory provenance while keeping broad product context upstream.
- Updated on 2026-09-02 from the [September 2 leaf update watch source](../../../raw/processed/2026-09-02/ai-security-wiki-leaf-update-watch-20260903T000347Z.json) with direct in-window provenance while preserving the existing security boundary.
- Created on 2026-09-01 from the [September 1 topic collector](../../../raw/processed/2026-09-01/ai-security-wiki-topic-news-collector-2026-09-01T233307Z.json) as a model-repository configuration execution leaf.
