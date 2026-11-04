---
type: Topic
title: FARM Model Package Loader Path Traversal
description: A model embeddings filename can cross FARM package-loader filesystem boundaries.
tags: [infrastructure-and-supply-chain]
---

# FARM Model Package Loader Path Traversal

## Current Understanding

[CVE-2026-120335](https://nvd.nist.gov/vuln/detail/CVE-2026-120335) affects deepset-ai FARM through 0.8.0. A manipulated `WordEmbedding_LM.load` `embeddings_filename` can traverse paths through the model-package loader. Model components must be treated as untrusted file references and constrained after path resolution.

The source reports end-of-life maintainer status and no remediation evidence. The [November 4 leaf update watch](../../../raw/processed/2026-11-04/ai-security-wiki-leaf-update-watch-20261104T010357Z.json) records CISA ADP metadata updated November 2 with `Exploitation=poc`, `Automatable=no`, and `Technical Impact=partial`. This is proof-of-concept evidence, not confirmed in-the-wild exploitation. Confidence is medium.

- Mitigation state: isolate or replace the unsupported loader and enforce resolved artifact-root containment.
- Residual risk: model-package filenames remain a filesystem boundary without a supported upstream fix.

## Authoritative Sources

- [November 3 collector source](../../../raw/processed/2026-11-03/ai-security-wiki-topic-news-collector-2026-11-03T002828Z.json)
- [NVD CVE-2026-120335](https://nvd.nist.gov/vuln/detail/CVE-2026-120335)
- [November 4 leaf update watch](../../../raw/processed/2026-11-04/ai-security-wiki-leaf-update-watch-20261104T010357Z.json)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [FARM tokenizer loader path traversal](farm-tokenizer-loader-path-traversal.md)
- [Agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)

## Open Questions

- Do CVE-2026-120334 and CVE-2026-120335 share a fix or only a common unsupported maintenance state?

## Maintenance Notes

- Created on 2026-11-03; kept separate from the tokenizer issue because remediation and loading paths differ.
- Updated on 2026-11-04 with CISA ADP proof-of-concept metadata; unsupported-project remediation uncertainty remains.
