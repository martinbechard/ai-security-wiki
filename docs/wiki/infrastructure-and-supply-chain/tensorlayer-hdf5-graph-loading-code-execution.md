---
type: "Topic"
title: "TensorLayer HDF5 Graph-Loading Unsafe Deserialization"
description: "Security analysis for CVE-2026-108958 unsafe HDF5 graph deserialization in TensorLayer."
tags: ["infrastructure-and-supply-chain"]
---

# TensorLayer HDF5 Graph-Loading Unsafe Deserialization

## Current Understanding

[The October 14 collector](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json) records [CVE-2026-108958](https://nvd.nist.gov/vuln/detail/CVE-2026-108958) for TensorLayer through 2.2.4. Broad TensorLayer context belongs upstream; this page owns HDF5 graph loading as a model-artifact deserialization boundary.

## Security Impact

- Threat: a crafted HDF5 graph can cross an unsafe deserialization boundary during model loading.
- Affected boundary: TensorLayer through 2.2.4 and HDF5 graph deserialization.
- Exploit or incident status: NVD records public exploit information; no confirmed incident is recorded locally.
- Mitigation state: no vendor-confirmed patched version is recorded.
- Confidence and residual risk: high for the NVD-described deserialization boundary; serialized graph artifacts need supply-chain controls.

## Control Implications

- Treat HDF5 model files as untrusted executable artifacts until validated.
- Use isolated loaders and signed, reviewed artifact registries.

## Authoritative Sources

- [October 14 topic collector source](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json)
- [NVD CVE-2026-108958](https://nvd.nist.gov/vuln/detail/CVE-2026-108958)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [gensim model loader unsafe deserialization](gensim-model-loader-unsafe-deserialization.md)

## Open Questions

- Has TensorLayer published a remediation after 2.2.4?

## Maintenance Notes

- Created on 2026-10-14 from the October 14 collector.
