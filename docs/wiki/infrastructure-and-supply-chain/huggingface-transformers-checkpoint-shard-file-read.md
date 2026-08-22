---
type: "Topic"
title: "Hugging Face Transformers Checkpoint Shard File Read"
description: "Security analysis for CVE-2026-75104 path traversal in Transformers checkpoint shard filenames."
tags: ["infrastructure-and-supply-chain", "model-and-prompt-security", "data-and-privacy"]
---

# Hugging Face Transformers Checkpoint Shard File Read

## Current Understanding

The [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) records CVE-2026-75104 / GHSA-fv5v-hfxp-5379 for Hugging Face Transformers checkpoint shard filename handling. Broad Hugging Face and Transformers ecosystem coverage belongs upstream; this page owns the local model-artifact file-boundary risk.

The advisory says Transformers fails to validate shard filenames in checkpoint index files. Malicious index files can use parent-directory references or absolute paths joined without validation, enabling file disclosure and filesystem reconnaissance outside the model directory. The exact fixed version was not captured in this run.

The [August 21 leaf update watch source](../../../raw/processed/2026-08-21/ai-security-wiki-leaf-update-watch-20260822T000454Z.json) adds in-window NVD publication evidence for CVE-2026-75104 / GHSA-fv5v-hfxp-5379. It does not settle the fixed-version open question, so the page keeps that uncertainty while strengthening the model-artifact path traversal framing.

## Security Impact

- Threat: model checkpoint metadata can become a local file-read primitive when shard filenames are trusted.
- Affected boundary: Hugging Face Transformers checkpoint loading; exact vulnerable and fixed versions still need confirmation.
- Exploit or incident status: public GitHub advisory and NVD record; no local exploitation evidence is recorded.
- Mitigation state: use patched Transformers versions once identified, validate shard paths relative to the model directory, and load untrusted checkpoints in isolated runtimes.
- Confidence: high for vulnerability class from GHSA/NVD; medium for version boundary until primary package metadata is captured.
- Residual risk: model artifacts should be treated like archive files with path traversal risk, not only as numeric weights.

## Authoritative Sources

- [August 18 topic news collector source](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json)
- [August 21 leaf update watch source](../../../raw/processed/2026-08-21/ai-security-wiki-leaf-update-watch-20260822T000454Z.json)
- [GitHub advisory GHSA-fv5v-hfxp-5379](https://github.com/advisories/GHSA-fv5v-hfxp-5379)
- [NVD CVE-2026-75104](https://nvd.nist.gov/vuln/detail/CVE-2026-75104)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)
- [AI supply chain provenance credentialing](ai-supply-chain-provenance-credentialing.md)

## Open Questions

- Which Transformers release first validates checkpoint shard filenames against parent-directory and absolute-path escape?

## Maintenance Notes

- Created on 2026-08-19 from the [August 18 topic collector](../../../raw/processed/2026-08-18/ai-security-wiki-topic-news-collector-2026-08-18T233017Z.json) as a model-artifact supply-chain file-boundary leaf.
- Updated on 2026-08-21 from the [August 21 watcher](../../../raw/processed/2026-08-21/ai-security-wiki-leaf-update-watch-20260822T000454Z.json) with NVD publication evidence while preserving fixed-version uncertainty.
