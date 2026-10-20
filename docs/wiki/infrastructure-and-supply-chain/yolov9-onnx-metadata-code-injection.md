---
type: "Topic"
title: "YOLOv9 ONNX Metadata Code Injection"
description: "Security analysis for CVE-2026-111991 attacker-controlled ONNX metadata execution in YOLOv9."
tags: ["infrastructure-and-supply-chain"]
---

# YOLOv9 ONNX Metadata Code Injection

## Current Understanding

[CVE-2026-111991](https://nvd.nist.gov/vuln/detail/CVE-2026-111991) reports that YOLOv9 0.1 `DetectMultiBackend` can evaluate attacker-controlled [ONNX](../../../upstream-ai-wiki/model-file-formats/onnx.md) `names` or `stride` metadata. The [October 19 collector](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json) records remote code injection, public exploit availability, and no vendor response.

## Security Impact

- Threat: untrusted ONNX metadata can execute code during model handling.
- Affected boundary: YOLOv9 0.1 `DetectMultiBackend` ONNX metadata handler.
- Exploit or incident status: public CVE reports public exploit availability; no vendor response is recorded.
- Mitigation state: no fixed version is identified; verify artifacts before loading and isolate inference workers.
- Confidence: medium because no project advisory or patch is cited.
- Residual risk: metadata inspection and execution must remain separate trust domains.

## Authoritative Sources

- [October 19 collector source](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json)
- [CVE-2026-111991](https://nvd.nist.gov/vuln/detail/CVE-2026-111991)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)

## Open Questions

- Is the CVE scope reproducible in current maintained YOLOv9 revisions?

## Maintenance Notes

- Created on 2026-10-20 from the October 19 collector.
