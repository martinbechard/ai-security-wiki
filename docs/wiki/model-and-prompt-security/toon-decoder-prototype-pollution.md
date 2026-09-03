---
type: "Topic"
title: "TOON Decoder Prototype Pollution"
description: "Security analysis for CVE-2026-82404 prototype pollution in TOON prompt serialization decoding."
tags: ["model-and-prompt-security", "infrastructure-and-supply-chain"]
---

# TOON Decoder Prototype Pollution

## Current Understanding

The [September 2 topic collector source](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json) records [CVE-2026-82404](https://nvd.nist.gov/vuln/detail/CVE-2026-82404) for TOON before 2.3.1. Broad prompt-serialization format coverage belongs upstream if it becomes durable; this page owns the local security boundary where untrusted LLM prompt serialization crosses into application object mutation.

NVD says the TOON decoder wrote attacker-controlled `__proto__`, `constructor`, or `prototype` keys through the JavaScript object prototype chain during decoding. Services that decode untrusted TOON data can experience denial of service or remote code execution when a downstream gadget is present.

## Security Impact

- Threat: prompt-serialization data can pollute JavaScript object prototypes and affect downstream runtime behavior.
- Affected boundary: TOON before 2.3.1; decoder `expandPaths` safe path and `insertPathSafe` function.
- Exploit or incident status: public NVD vulnerability record; no local incident is recorded.
- Mitigation state: upgrade to 2.3.1 or later and reject prototype-bearing keys when decoding untrusted prompt artifacts.
- Confidence: high from in-window NVD publication.
- Residual risk: compact prompt formats are executable-adjacent input surfaces when parsed into live application objects.

## Control Implications

- Treat prompt serialization as an input parser requiring hostile-key tests.
- Decode untrusted prompt artifacts into null-prototype or schema-validated objects.
- Keep downstream gadget analysis separate from the parser flaw so exploitability is not overstated.

## Authoritative Sources

- [September 2 topic collector source](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json)
- [NVD CVE-2026-82404](https://nvd.nist.gov/vuln/detail/CVE-2026-82404)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [model and prompt security](index.md)
- [Evaluation artifact template execution risk](evaluation-artifact-template-execution-risk.md)
- [agent build and dependency execution boundaries](../infrastructure-and-supply-chain/agent-build-and-dependency-execution-boundaries.md)

## Open Questions

- Which TOON consumers accept untrusted prompt artifacts and expose downstream gadgets?

## Maintenance Notes

- Created on 2026-09-02 from the [September 2 topic collector](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json) as a prompt-serialization parser security leaf.
