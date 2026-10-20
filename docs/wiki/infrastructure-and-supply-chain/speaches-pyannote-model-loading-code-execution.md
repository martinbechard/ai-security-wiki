---
type: "Topic"
title: "Speaches Pyannote Model-Loading Code Execution"
description: "Security analysis for CVE-2026-112145 attacker-controlled class selection in Speaches model loading."
tags: ["infrastructure-and-supply-chain"]
---

# Speaches Pyannote Model-Loading Code Execution

## Current Understanding

[CVE-2026-112145](https://nvd.nist.gov/vuln/detail/CVE-2026-112145) reports that Speaches through 0.9.0-rc.3 lets attacker-controlled model input select classes or code in its Pyannote diarization model-loading path. The [October 19 late collector](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T193149-0400.json) links a [project commit](https://github.com/speaches-ai/speaches/commit/870e1e16a73452496e99d49f759eabd692a8e0e0) but records no project response.

## Security Impact

- Threat: a model input can select code during diarization model loading.
- Affected boundary: Speaches through 0.9.0-rc.3 and PyannoteDiarizationModelManager.
- Exploit or incident status: public CVE reports public exploit availability; no project response is recorded.
- Mitigation state: do not accept untrusted model inputs; the first released fix is not confirmed.
- Confidence: medium for remediation state; high for the named loader boundary.
- Residual risk: model selector fields remain executable configuration unless constrained to an allow-list.

## Authoritative Sources

- [October 19 late collector source](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T193149-0400.json)
- [CVE-2026-112145](https://nvd.nist.gov/vuln/detail/CVE-2026-112145)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)

## Open Questions

- Does the linked commit correspond to a released remediation?

## Maintenance Notes

- Created on 2026-10-20 from the October 19 late collector.
