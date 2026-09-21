---
type: "Topic"
title: "gensim model loader unsafe deserialization"
description: "Security analysis for CVE-2026-94091 unsafe pickle deserialization in gensim model loading."
tags: ["infrastructure-and-supply-chain"]
---

# gensim model loader unsafe deserialization

## Current Understanding

The [September 20 topic collector source](../../../raw/processed/2026-09-20/ai-security-wiki-topic-news-collector-2026-09-20T233226Z.json) records [CVE-2026-94091](https://cveawg.mitre.org/api/cve/CVE-2026-94091) for gensim 4.0 through 4.4.0; Model Loader SaveLoad.load path. Broad gensim and model-artifact context belongs upstream; this page owns the local security boundary, exploit status, mitigation state, and residual risk.

The gensim model loader is a model-artifact supply-chain boundary because `SaveLoad.load` uses pickle-backed loading that can execute code from untrusted model files. The source classifies the evidence as cve services primary record with vuldb technical reference and issue-tracker reference and records visible publication at 2026-09-20T22:15:11.503Z.

## Security Impact

- Threat: Model and embedding artifact loaders are supply-chain execution boundaries; unsafe pickle loading can turn untrusted model artifacts into code execution.
- Affected boundary: gensim 4.0 through 4.4.0; Model Loader SaveLoad.load path.
- Exploit or incident status: public exploit material is recorded.
- Mitigation state: treat gensim model files as executable artifacts, load only trusted signed sources, isolate model-loading environments, and upgrade when a safe fixed version is available.
- Confidence: High confidence on CVE timing and affected versions; remediation is explicitly uncertain and should not be inferred.
- Residual risk: agent-exposed tool and model-runtime boundaries remain sensitive when tool inputs, model artifacts, or local daemon channels can cross into host authority.

## Authoritative Sources

- [September 20 topic collector source](../../../raw/processed/2026-09-20/ai-security-wiki-topic-news-collector-2026-09-20T233226Z.json)
- [CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-94091)
- [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-94091)
- [VulDB record](https://vuldb.com/vuln/408020)
- [GitHub issue](https://github.com/piskvorky/gensim/issues/3663)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [Stanza model archive Zip Slip](stanza-model-archive-zip-slip.md)
- [AI supply chain provenance credentialing](ai-supply-chain-provenance-credentialing.md)

## Open Questions

- Which gensim release changes or clearly documents the safe loading boundary after 4.4.0?

## Maintenance Notes

- Created on 2026-09-20 from the [September 20 topic collector source](../../../raw/processed/2026-09-20/ai-security-wiki-topic-news-collector-2026-09-20T233226Z.json) after upstream routing kept broad entity context in sibling wikis and local ownership on the security boundary.
