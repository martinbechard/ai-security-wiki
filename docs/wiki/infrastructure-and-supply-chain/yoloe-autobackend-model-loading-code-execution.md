---
type: "Topic"
title: "YOLOE AutoBackend Model-Loading Code Execution"
description: "Security analysis for CVE-2026-111865 dynamic evaluation of model-controlled YOLOE metadata."
tags: ["infrastructure-and-supply-chain"]
---

# YOLOE AutoBackend Model-Loading Code Execution

## Current Understanding

[CVE-2026-111865](https://nvd.nist.gov/vuln/detail/CVE-2026-111865) reports that YOLOE AutoBackend dynamically evaluates model-controlled values, allowing local code execution from a malicious model artifact through commit `40cd606`. The [October 19 collector](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json) identifies:

- `imgsz`
- `names`
- `kpt_shape`

No maintained fixed release is identified; broad YOLOE coverage remains upstream-owned.

## Security Impact

- Threat: a malicious model artifact can execute code when loaded for inference.
- Affected boundary: YOLOE AutoBackend model loading through the identified commit.
- Exploit or incident status: public CVE and [project issue](https://github.com/THU-MIG/yoloe/issues/148); active exploitation is not identified.
- Mitigation state: no maintained fixed release is identified; prohibit untrusted model artifacts and isolate model conversion and loading.
- Confidence: medium because the record identifies a code path but no released remediation.
- Residual risk: artifact provenance alone is insufficient where metadata reaches dynamic evaluation.

## Authoritative Sources

- [October 19 collector source](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json)
- [CVE-2026-111865](https://nvd.nist.gov/vuln/detail/CVE-2026-111865)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)

## Open Questions

- Is a maintained patch or alternate safe loader available?

## Maintenance Notes

- Created on 2026-10-20 from the October 19 collector.
