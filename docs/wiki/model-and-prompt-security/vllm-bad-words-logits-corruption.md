---
type: "Topic"
title: "vLLM bad_words logits corruption"
description: "Security analysis for CVE-2026-93989 cross-request logits corruption through vLLM bad_words sampling."
tags: ["model-and-prompt-security"]
---

# vLLM bad_words logits corruption

## Current Understanding

The [September 20 topic collector source](../../../raw/processed/2026-09-20/ai-security-wiki-topic-news-collector-2026-09-20T233226Z.json) records [CVE-2026-93989](https://cveawg.mitre.org/api/cve/CVE-2026-93989) for vLLM through 0.29.0; bad_words sampling and concurrent HTTP request generation path. Broad vLLM and model-serving context belongs upstream; this page owns the local security boundary, exploit status, mitigation state, and residual risk.

The `bad_words` sampling path can corrupt shared logits state across concurrent requests when bad-word token handling reaches invalid model-output positions. The source classifies the evidence as cve services primary record with upstream pull request, code references, and vulncheck advisory reference and records visible publication at 2026-09-19T22:58:10.572Z.

## Security Impact

- Threat: Multi-tenant model serving needs request isolation; cross-request logits corruption can undermine output integrity for other users even when confidentiality impact is not recorded.
- Affected boundary: vLLM through 0.29.0; bad_words sampling and concurrent HTTP request generation path.
- Exploit or incident status: public vulnerability disclosure; no local in-the-wild incident is recorded.
- Mitigation state: upgrade beyond the affected 0.29.0 boundary when the fixed release is confirmed, validate sampling token IDs against model output width, and isolate sampler state between requests.
- Confidence: High confidence from CVE text and upstream PR reference; exact fixed release should be verified because the record references a PR rather than an unaffected version.
- Residual risk: agent-exposed tool and model-runtime boundaries remain sensitive when tool inputs, model artifacts, or local daemon channels can cross into host authority.

## Authoritative Sources

- [September 20 topic collector source](../../../raw/processed/2026-09-20/ai-security-wiki-topic-news-collector-2026-09-20T233226Z.json)
- [CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-93989)
- [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-93989)
- [https://github.com/vllm-project/vllm/pull/48824](https://github.com/vllm-project/vllm/pull/48824)
- [https://github.com/vllm-project/vllm/blob/98dff2a81d747d1dba01a47f939f48c3526d4206/vllm/v1/worker/gpu/sample/bad_words.py](https://github.com/vllm-project/vllm/blob/98dff2a81d747d1dba01a47f939f48c3526d4206/vllm/v1/worker/gpu/sample/bad_words.py)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/vllm-through-0.29.0-cross-request-logits-corruption-via-bad-words)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [vLLM sampler state corruption](vllm-sampler-state-corruption.md)
- [vLLM allowed_token_ids logits corruption](vllm-allowed-token-ids-logits-corruption.md)

## Open Questions

- Which vLLM release or commit fixes CVE-2026-93989?

## Maintenance Notes

- Created on 2026-09-20 from the [September 20 topic collector source](../../../raw/processed/2026-09-20/ai-security-wiki-topic-news-collector-2026-09-20T233226Z.json) after upstream routing kept broad entity context in sibling wikis and local ownership on the security boundary.
