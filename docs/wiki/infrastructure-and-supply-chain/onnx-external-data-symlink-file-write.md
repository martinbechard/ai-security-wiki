---
type: "Topic"
title: "ONNX External Data Symlink File Write"
description: "Security analysis for CVE-2026-49114 ONNX external-data save symlink-following arbitrary file write."
tags: ["infrastructure-and-supply-chain", "model-and-prompt-security"]
---

# ONNX External Data Symlink File Write

## Current Understanding

The [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) records CVE-2026-49114 for ONNX before 1.21.0. Broad [ONNX](../../../upstream-ai-wiki/techniques/onnx.md) model-format context belongs upstream; this page owns the local model-artifact serialization and filesystem-write boundary.

The [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-49114), [CVE record](https://www.cve.org/CVERecord?id=CVE-2026-49114), and linked [GitHub advisory](https://github.com/onnx/onnx/security/advisories/GHSA-q56x-g2fj-4rj6) describe `save_external_data` following a pre-planted symlink in a model external-data serialization directory, allowing a local attacker with write access to append to files writable by the victim. The collector records ONNX 1.21.0 as unaffected.

## Security Impact

- Threat: model serialization can become an arbitrary file-write primitive when external-data directories are attacker-writable and symlink handling is not canonicalized.
- Affected boundary: ONNX before 1.21.0 `save_external_data` external-data file writing.
- Exploit or incident status: public CVE and GitHub advisory; no local exploitation evidence is recorded.
- Mitigation state: use ONNX 1.21.0 or later, write external data into trusted directories, reject symlinks, and verify canonical target paths before writes.
- Confidence: high for advisory identity and fixed-version boundary from NVD, CVE, and GitHub evidence.
- Residual risk: model conversion and evaluation pipelines often process files supplied by other tools or agents, so local-only write primitives can still affect build runners and shared workstations.

## Authoritative Sources

- [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json)
- [NVD CVE-2026-49114](https://nvd.nist.gov/vuln/detail/CVE-2026-49114)
- [CVE record CVE-2026-49114](https://www.cve.org/CVERecord?id=CVE-2026-49114)
- [GitHub advisory GHSA-q56x-g2fj-4rj6](https://github.com/onnx/onnx/security/advisories/GHSA-q56x-g2fj-4rj6)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)
- [Hugging Face Transformers checkpoint shard file read](huggingface-transformers-checkpoint-shard-file-read.md)
- Upstream AI wiki owns broad [ONNX](../../../upstream-ai-wiki/techniques/onnx.md) context.

## Open Questions

- Which model-conversion workflows in practice run ONNX external-data saves in directories writable by untrusted users or agents?

## Maintenance Notes

- Created on 2026-08-22 from the [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) as a model-artifact filesystem-write leaf.
