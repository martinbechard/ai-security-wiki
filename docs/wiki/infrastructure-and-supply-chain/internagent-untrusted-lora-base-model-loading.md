---
type: "Topic"
title: "InternAgent Untrusted LoRA Base-Model Loading"
description: "Security analysis for CVE-2026-115802 untrusted base-model selection during InternAgent AutoChem LoRA training."
tags: ["infrastructure-and-supply-chain", "model-and-prompt-security"]
---

# InternAgent Untrusted LoRA Base-Model Loading

## Current Understanding

The [October 25 topic collector source](../../../raw/processed/2026-10-25/ai-security-wiki-topic-news-collector-2026-10-25T232906Z.json) records [CVE-2026-115802](https://nvd.nist.gov/vuln/detail/CVE-2026-115802): InternAgent 1.5.0 AutoChem training accepts a manipulated `base_model_name_or_path`, allowing functionality from an untrusted control sphere to enter the LoRA training path. Broad InternAgent product coverage belongs upstream; this page owns the model-artifact selection boundary.

## Security Impact

- Threat: a model identifier or local/remote artifact reference is treated as trusted configuration during training.
- Affected boundary: InternAgent 1.5.0 `tasks/AutoChem/code/experiment.py` training and LoRA base-model loading.
- Exploit or incident status: the disclosure reports public exploit availability; no local incident is recorded.
- Mitigation state: no maintained fixed release is identified in the collector; restrict model sources, pin verified artifacts, and require review before loading training bases.
- Confidence: medium; the public CVE record is available, while the linked issue and release remediation still need reconciliation.
- Residual risk: a trusted name alone does not prove a model artifact, revision, or loader hook is safe.

## Authoritative Sources

- [October 25 topic collector source](../../../raw/processed/2026-10-25/ai-security-wiki-topic-news-collector-2026-10-25T232906Z.json)
- [CVE-2026-115802](https://nvd.nist.gov/vuln/detail/CVE-2026-115802)
- [InternAgent issue 30](https://github.com/InternScience/InternAgent/issues/30)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)

## Open Questions

- Does a maintained InternAgent release fix this loader path, and are both local and remote references accepted?

## Maintenance Notes

- Created on 2026-10-25 from CVE-2026-115802; retain the unconfirmed remediation state until a maintainer release or patch is verified.
