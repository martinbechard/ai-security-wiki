---
type: "Topic"
title: "Ludwig Dataset Archive Symlink Extraction Escape"
description: "Security analysis for CVE-2026-104103 archive-link extraction outside Ludwig's dataset directory."
tags: ["infrastructure-and-supply-chain"]
---

# Ludwig Dataset Archive Symlink Extraction Escape

## Current Understanding

[The October 14 collector](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json) records [CVE-2026-104103](https://nvd.nist.gov/vuln/detail/CVE-2026-104103) for Ludwig before 0.17.8. Broad Ludwig context belongs upstream; this page owns dataset-archive extraction containment.

## Security Impact

- Threat: crafted tar symlink or hard-link entries can write outside the intended extraction directory.
- Affected boundary: Ludwig before 0.17.8, configured archive URLs, and dataset extraction on Python 3.12 and 3.13.
- Exploit or incident status: public CVE; no confirmed exploitation incident is recorded locally.
- Mitigation state: 0.17.8 fixes the issue; Python 3.14's default tar data filter is not affected.
- Confidence and residual risk: high for the stated version and runtime conditions; dataset intake remains a host-write boundary.

## Control Implications

- Upgrade to 0.17.8 or later and reject archive links that escape an extraction root.
- Use path-aware containment checks rather than `os.path.commonprefix` and isolate dataset preparation.

## Authoritative Sources

- [October 14 topic collector source](../../../raw/processed/2026-10-14/ai-security-wiki-topic-news-collector-2026-10-14T233300Z.json)
- [NVD CVE-2026-104103](https://nvd.nist.gov/vuln/detail/CVE-2026-104103)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [Stanza model archive Zip Slip](stanza-model-archive-zip-slip.md)

## Open Questions

- Are all Ludwig dataset-download code paths covered by the 0.17.8 fix?

## Maintenance Notes

- Created on 2026-10-14 from the October 14 collector.
