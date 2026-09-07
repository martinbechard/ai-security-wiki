---
type: "Topic"
title: "Axolotl Multipack trust_remote_code RCE"
description: "Security analysis for CVE-2026-86169 Axolotl multipack model-loading remote code execution."
tags: ["infrastructure-and-supply-chain", "model-and-prompt-security"]
---

# Axolotl Multipack trust_remote_code RCE

## Current Understanding

The [September 6 topic collector source](../../../raw/processed/2026-09-06/ai-security-wiki-topic-news-collector-2026-09-06T233209Z.json) records [CVE-2026-86169](https://cveawg.mitre.org/api/cve/CVE-2026-86169) for Axolotl through 0.18.0. Broad Axolotl training and fine-tuning framework coverage belongs upstream in ai-wiki; this page owns the local model-supply-chain boundary where a selected Hugging Face model repository can carry executable Python into a training runtime.

The vulnerable path is multipack patching. The collector records that `trust_remote_code` defaults to `None` rather than `False`, bypasses the intended guard, and then reaches `AutoModelForCausalLM.from_pretrained` with `trust_remote_code=True`. A malicious `base_model` repository can therefore execute code during model loading.

## Security Impact

- Threat: attacker-controlled model repository code executes in the training or fine-tuning process.
- Affected boundary: Axolotl through 0.18.0, multipack patching, Hugging Face model repository selection, and `trust_remote_code` enforcement.
- Exploit or incident status: public CVE, NVD, VulnCheck, code-path, pull-request, and commit evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: apply the patch or a fixed release once verified; reject untrusted `base_model` repositories; require explicit remote-code consent for model-loading paths.
- Confidence: high for the vulnerable call path and affected-version boundary from direct CVE/NVD and repository evidence; medium for fixed-release wording until a release carrying the patch is confirmed.
- Residual risk: model repositories remain execution-bearing dependencies even when the immediate multipack path is patched, so local controls should treat model selection, cache state, and training credentials as supply-chain authority.

## Authoritative Sources

- [September 6 topic collector source](../../../raw/processed/2026-09-06/ai-security-wiki-topic-news-collector-2026-09-06T233209Z.json)
- [CVE-2026-86169](https://cveawg.mitre.org/api/cve/CVE-2026-86169)
- [NVD CVE-2026-86169](https://nvd.nist.gov/vuln/detail/CVE-2026-86169)
- [Axolotl pull request 3858](https://github.com/axolotl-ai-cloud/axolotl/pull/3858)
- [Axolotl patch commit](https://github.com/axolotl-ai-cloud/axolotl/commit/b62d60b101eea7f32532ee3c0b17c2f2430a9262)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/axolotl-through-0.18.0-remote-code-execution-via-multipack-patching)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [Hugging Face Transformers trust_remote_code cache write](huggingface-transformers-trust-remote-code-cache-write.md)
- [agent build and dependency execution boundaries](agent-build-and-dependency-execution-boundaries.md)

## Open Questions

- Which Axolotl release first carries the multipack `trust_remote_code` fix?

## Maintenance Notes

- Created on 2026-09-06 from the [September 6 topic collector source](../../../raw/processed/2026-09-06/ai-security-wiki-topic-news-collector-2026-09-06T233209Z.json) after routing broad Axolotl framework context upstream.
