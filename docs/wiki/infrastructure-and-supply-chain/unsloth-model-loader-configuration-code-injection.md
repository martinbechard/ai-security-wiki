---
type: "Topic"
title: "Unsloth Model-Loader Configuration Code Injection"
description: "Security analysis for CVE-2026-93348 model-configuration code execution."
tags: ["infrastructure-and-supply-chain", "model-and-prompt-security"]
---

# Unsloth Model-Loader Configuration Code Injection

## Current Understanding

The [October 28 collector source](../../../raw/processed/2026-10-28/ai-security-wiki-topic-news-collector-2026-10-28T233111Z.json) records [CVE-2026-93348](https://cveawg.mitre.org/api/cve/CVE-2026-93348): a nested `model_type` can reach an `exec()`-built import in Unsloth's model-loading compiler even when `trust_remote_code` is false. Broad Unsloth and Hugging Face context belongs upstream; this page owns the configuration-as-code boundary.

## Security Impact

- Threat: malicious model configuration executes arbitrary Python during loading.
- Affected boundary: Unsloth Zoo 2025.9.9 before 2026.8.14, used by Unsloth 2025.9.9 through 2026.8.19.
- Exploit or incident status: public CVE and primary research disclosure; no local incident is recorded.
- Mitigation state: use Unsloth 2026.8.20 or later with Zoo 2026.8.14 or later.
- Confidence: high; residual risk remains for model metadata accepted by loading workers.

## Control Implications

- Treat configuration metadata as untrusted code-adjacent input.
- Inventory notebooks, images, and training workers for both affected dependency ranges.

## Authoritative Sources

- [October 28 collector source](../../../raw/processed/2026-10-28/ai-security-wiki-topic-news-collector-2026-10-28T233111Z.json)
- [Pillar disclosure](https://www.pillar.security/blog/trust-disabled-code-executed-arbitrary-code-execution-in-unsloths-model-loader)
- [CVE-2026-93348](https://cveawg.mitre.org/api/cve/CVE-2026-93348)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)

## Open Questions

- Are package or image distributor backports available for the fixed Zoo floor?

## Maintenance Notes

- Created on 2026-10-28 from the October 28 collector.
