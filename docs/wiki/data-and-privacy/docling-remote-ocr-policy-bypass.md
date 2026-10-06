---
type: "Topic"
title: "Docling Remote OCR Policy Bypass"
description: "Security analysis for CVE-2026-105746 remote OCR processing despite disabled remote-service policy."
tags: ["data-and-privacy", "governance-and-compliance"]
---

# Docling Remote OCR Policy Bypass

## Current Understanding

The [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) records [CVE-2026-105746](https://nvd.nist.gov/vuln/detail/CVE-2026-105746) for Docling 2.83.0 until 2.131.0. Broad Docling context belongs upstream; this page owns remote-service policy enforcement for document images.

The NVD record says `KServeV2OcrModel` sends page images to its configured endpoint without checking `pipeline_options.enable_remote_services`, and `StandardPdfPipeline._make_ocr_model` fails to pass the flag into the OCR factory. The destination is configured by the caller, not attacker-selected, but the policy bypass can move document images to remote OCR when remote services are expected to be disabled.

## Security Impact

- Threat: sensitive page images can be sent to remote OCR services despite a disabled remote-service policy.
- Affected boundary: Docling 2.83.0 until 2.131.0; KServe V2 OCR model; `enable_remote_services`; PDF pipeline OCR factory.
- Exploit or incident status: public NVD record; no local exploitation incident is recorded.
- Mitigation state: update to Docling 2.131.0 or later and verify remote-service policy is enforced at every OCR factory and model call.
- Confidence: high for affected version and fix from NVD.
- Residual risk: policy flags are audit controls; if conversion workers ignore them, sensitive documents can leave the expected processing boundary.

## Authoritative Sources

- [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json)
- [NVD CVE-2026-105746](https://nvd.nist.gov/vuln/detail/CVE-2026-105746)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [data and privacy](index.md)
- [governance and compliance](../governance-and-compliance/index.md)
- [model processing data residency controls](model-processing-data-residency-controls.md)

## Open Questions

- Which Docling deployments configure KServe OCR for documents subject to remote-processing or residency restrictions?

## Maintenance Notes

- Created on 2026-10-06 from the [October 5 topic collector source](../../../raw/processed/2026-10-05/ai-security-wiki-topic-news-collector-2026-10-05T233142Z.json) after verifier correction split the Docling cluster by independent boundary.
