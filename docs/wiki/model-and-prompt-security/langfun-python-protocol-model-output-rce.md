---
type: "Topic"
title: "Langfun Python Protocol Model Output RCE"
description: "Security analysis for CVE-2026-75062 prompt-influenced model output parsed as executable Python."
tags: ["model-and-prompt-security", "infrastructure-and-supply-chain"]
---

# Langfun Python Protocol Model Output RCE

## Current Understanding

CVE-2026-75062 affects Google Langfun before 0.1.2 and crosses the local model-output-as-code parser boundary. Broad Langfun and PyGlove framework background belongs upstream. The [August 26 topic news collector source](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json) and [August 27 leaf update watch source](../../../raw/processed/2026-08-27/ai-security-wiki-leaf-update-watch-20260828T000238Z.json) provide the current evidence.

Langfun's default `lf.query` Python protocol can parse prompt-influenced model output as executable Python with sandboxing disabled. The exploit path is:

1. An attacker supplies crafted prompt input, retrieved content, or malicious document text.
2. The model generates Python expressions under the default Python protocol.
3. The host application evaluates those expressions without a sandbox.
4. The prompt or document boundary becomes host-process remote code execution.

The local lesson is broader than Langfun: model output should be data validated against a schema, not executable parser input, unless the runtime treats the operation as privileged code execution with isolation and explicit approval.

## Security Impact

- Threat: untrusted prompt or retrieved content can steer model output into executable Python parser input.
- Affected boundary: Google Langfun before 0.1.2; `lf.query` default Python protocol; structured-output parsing in RAG, agent, and document-processing applications.
- Exploit or incident status: public NVD record and reproducible GitHub issue; no local incident evidence is recorded.
- Mitigation state: upgrade Langfun to 0.1.2 or later and avoid executable output protocols for untrusted content paths.
- Confidence: high for technical mechanics from NVD and public issue evidence; medium for adjacent PyGlove implications until separately sourced.
- Residual risk: parser convenience features can silently promote model text from untrusted output into privileged code.

## Authoritative Sources

- [August 27 leaf update watch source](../../../raw/processed/2026-08-27/ai-security-wiki-leaf-update-watch-20260828T000238Z.json)
- [CVE-2026-75062 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-75062)
- [August 26 topic news collector source](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json)
- [NVD CVE-2026-75062](https://nvd.nist.gov/vuln/detail/CVE-2026-75062)
- [Langfun issue 725](https://github.com/google/langfun/issues/725)
- [Google Langfun repository](https://github.com/google/langfun)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [Xinference Llama3 tool call eval RCE](xinference-llama3-tool-call-eval-rce.md)
- [Evaluation artifact template execution risk](evaluation-artifact-template-execution-risk.md)

## Open Questions

- Which PyGlove JSON auto-import or protocol features, if any, need a separate local security leaf rather than upstream framework context?

## Maintenance Notes

- Updated on 2026-08-28 with August 27 leaf-update evidence for CVE-2026-75062.
- Created on 2026-08-27 from the [August 26 topic collector](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json) as a model-output execution boundary leaf.
