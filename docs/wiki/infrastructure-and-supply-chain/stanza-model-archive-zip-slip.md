---
type: "Topic"
title: "Stanza Model Archive Zip Slip"
description: "Security analysis for CVE-2026-59974 unsafe model and resource archive extraction in Stanford Stanza."
tags: ["infrastructure-and-supply-chain"]
---

# Stanza Model Archive Zip Slip

## Current Understanding

The [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json) adds disclosed vulnerability evidence dated 2026-09-16T17:28:08.634Z: CVE Services published a Stanza pre-1.14.0 model/resource archive Zip Slip issue in unzip/extractall handling, fixed in v1.14.0.

The [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) records CVE-2026-59974 for Stanford Stanza before 1.14.0. Broad NLP library context belongs upstream; this page owns the local model/resource artifact extraction boundary.

The CVE says `stanza.download` and `stanza.install_corenlp` passed downloaded model and resource archives to `ZipFile.extractall` without validating member paths. A malicious archive could write outside the model directory and potentially overwrite shell configuration, SSH authorization data, Python packages, or executable scripts.

## Security Impact

- Threat: a model or resource archive can become arbitrary file write through Zip Slip path traversal.
- Affected boundary: Stanford Stanza before 1.14.0, model/resource downloads, CoreNLP installation resources, and local filesystem write authority.
- Exploit or incident status: public CVE record; no local exploitation incident is recorded.
- Mitigation state: update to 1.14.0 or later, validate archive members before extraction, and isolate model cache directories from executable or credential paths.
- Confidence: high for CVE publication, affected version, and extraction behavior.
- Residual risk: model artifact downloaders often run in developer or CI environments where file overwrite can become later code execution.

## Authoritative Sources

- [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json)
- [September 17 topic collector source](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json)
- [CVE-2026-59974 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-59974)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [AI supply chain provenance credentialing](ai-supply-chain-provenance-credentialing.md)
- [Agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)

## Open Questions

- Which local NLP or model-download workflows extract archives into locations that can later affect shell startup, package import, or SSH authorization?

## Maintenance Notes

- Updated on 2026-09-20 from the [September 20 leaf update watch source](../../../raw/processed/2026-09-20/ai-security-wiki-leaf-update-watch-20260921T000220Z.json) with in-window disclosed vulnerability evidence while preserving local security-boundary scope.
- Created on 2026-09-18 from the [September 17 topic collector](../../../raw/processed/2026-09-17/ai-security-wiki-topic-news-collector-2026-09-17T233119Z.json) as a model-artifact extraction leaf.
