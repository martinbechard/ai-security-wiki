---
type: "Topic"
title: "Crawl4AI Untrusted Model-Name Pickle Loading"
description: "Security analysis for CVE-2026-119120 model repository selection and unsafe artifact loading."
tags: ["infrastructure-and-supply-chain", "model-and-prompt-security"]
---

# Crawl4AI Untrusted Model-Name Pickle Loading

## Current Understanding

The [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json) records [CVE-2026-119120](https://nvd.nist.gov/vuln/detail/CVE-2026-119120): Crawl4AI 0.9.0 before 0.9.5 accepts an unfiltered `CosineStrategy` `model_name` in Docker API bodies, letting authenticated clients choose a malicious Hugging Face pickle-weight repository. This can execute code on PyTorch below 2.6 or exhaust resources. The [November 4 leaf update watch](../../../raw/processed/2026-11-04/ai-security-wiki-leaf-update-watch-20261104T010357Z.json) records CISA ADP metadata updated November 3 with `Exploitation=poc`, `Automatable=no`, and `Technical Impact=total`, plus an exploit-tagged GitHub advisory reference. This is proof-of-concept evidence, not confirmed in-the-wild exploitation.

## Security Impact

- Threat: authenticated API callers can select untrusted model artifacts for server-side loading.
- Affected boundary: Crawl4AI 0.9.0 before 0.9.5, Docker API model selection, Hugging Face repository selection, and PyTorch loading.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: upgrade to 0.9.5 or later and restrict model repositories to an approved allowlist.
- Confidence and residual risk: high for the affected range; model identifiers remain supply-chain inputs even after patching.

## Authoritative Sources

- [October 30 collector](../../../raw/processed/2026-10-30/ai-security-wiki-topic-news-collector-2026-10-30T232632Z.json)
- [NVD CVE-2026-119120](https://nvd.nist.gov/vuln/detail/CVE-2026-119120)
- [November 4 leaf update watch](../../../raw/processed/2026-11-04/ai-security-wiki-leaf-update-watch-20261104T010357Z.json)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [Crawl4AI untrusted-config credential exposure](../data-and-privacy/crawl4ai-untrusted-config-credential-exposure.md)

## Open Questions

- Does Crawl4AI enforce a repository allowlist independently of the version fix?

## Maintenance Notes

- Created on 2026-10-30 from NVD-backed collector evidence.
- Updated on 2026-11-04 with CISA ADP proof-of-concept metadata; retain the stated 0.9.5 remediation as separate evidence.
