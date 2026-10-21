---
type: "Topic"
title: "Doctor-Dignity MLC Chat model_lib Code Injection"
description: "Security analysis for CVE-2026-112140 code injection through Doctor-Dignity MLC Chat model_lib."
tags: ["infrastructure-and-supply-chain"]
---

# Doctor-Dignity MLC Chat model_lib Code Injection

## Current Understanding

[CVE-2026-112140](https://nvd.nist.gov/vuln/detail/CVE-2026-112140) reports code injection through the `model_lib` argument passed to Doctor-Dignity's MLC Chat module. The [October 19 collector](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json) records a public-exploit claim and no versioned fix; the [October 20 leaf watch](../../../raw/processed/2026-10-20/ai-security-wiki-leaf-update-watch-20261021T000613Z.json) did not independently confirm the exploit claim.

## Security Impact

- Threat: an untrusted model-library selection field can execute code.
- Affected boundary: Doctor-Dignity rolling revisions and the MLC Chat `model_lib` loader.
- Exploit or incident status: public CVE record; the reported public-exploit claim and active exploitation are not independently confirmed.
- Mitigation state: no versioned remediation is identified; restrict model-library inputs and isolate the runtime.
- Confidence: medium because project-specific remediation evidence is missing.
- Residual risk: runtime library selectors remain supply-chain execution boundaries.

## Authoritative Sources

- [October 19 collector source](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T140139-0400.json)
- [October 20 leaf watch](../../../raw/processed/2026-10-20/ai-security-wiki-leaf-update-watch-20261021T000613Z.json)
- [CVE-2026-112140](https://nvd.nist.gov/vuln/detail/CVE-2026-112140)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)

## Open Questions

- Is there reproducible upstream evidence for a fixed state?

## Maintenance Notes

- Created on 2026-10-20 from the October 19 collector.
- Rechecked on 2026-10-20; exploit status remains unverified.
