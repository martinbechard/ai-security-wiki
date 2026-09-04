---
type: "Topic"
title: "AI Skill Scanner Executable Artifact Coverage"
description: "Security assurance analysis for CVE-2026-84809, CVE-2026-84810, and CVE-2026-84811 scanner blind spots around executable skill artifacts."
tags: ["testing-and-assurance", "infrastructure-and-supply-chain"]
---

# AI Skill Scanner Executable Artifact Coverage

## Current Understanding

The [September 2 topic collector source](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json) records a related scanner-coverage pattern across [Tencent AI-Infra-Guard skill-scan bytecode bypass](tencent-ai-infra-guard-skill-scan-bytecode-bypass.md), [claude-skill-antivirus manifest-only scan](claude-skill-antivirus-manifest-only-scan.md), and [agentverus-scanner compiled bytecode certification bypass](agentverus-scanner-compiled-bytecode-certification-bypass.md). Broad Claude skill packaging, plugin installation workflow, and individual scanner product context route upstream; this page owns the cross-cutting assurance rule where a scanner reports SAFE or CERTIFIED while executable companion artifacts remain unanalyzed.

The advisories describe three variants of the same control failure: Tencent AI-Infra-Guard skips `__pycache__` and compiled Python extensions, claude-skill-antivirus scans only `SKILL.md` in local skill directories, and agentverus-scanner can certify benign source while malicious compiled bytecode is present in companion directories. The shared security lesson is that manifest-only or source-only skill review is insufficient for executable agent artifacts.

The [September 3 leaf update watch source](../../../raw/processed/2026-09-03/ai-security-wiki-leaf-update-watch-20260904T000442Z.json) updates only the agentverus-scanner member of the family. It leaves the family-level rule unchanged: scanner evidence is usable only when it declares the artifact classes inspected, the executable classes omitted, and the policy response for bytecode, binaries, archives, and hidden companion paths.

## Security Impact

- Threat: malicious code can hide in bytecode, scripts, or companion artifacts while scanners report trusted verdicts.
- Affected boundary: AI skill and agent scanner coverage for manifests, scripts, bytecode, binaries, and companion directories.
- Exploit or incident status: public GitHub Advisory Database and NVD records; no local incident is recorded.
- Mitigation state: require recursive artifact inventory, bytecode and binary policy, source-to-bytecode mismatch checks, and scanner verdict provenance before accepting AI skill packages.
- Confidence: high for the advisory family; medium for product-specific fixed versions until vendor release evidence is captured.
- Residual risk: scanner trust scores can become supply-chain credentials, so omitted file classes create false assurance for downstream operators.

## Control Implications

- Treat `SKILL.md` as a manifest, not the complete security review surface.
- Include scripts, compiled bytecode, binaries, archives, dependency manifests, and hidden companion paths in skill/package review.
- Record what artifact classes a scanner did and did not inspect before using SAFE or CERTIFIED labels in release gates.

## Authoritative Sources

- [September 2 topic collector source](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json)
- [September 3 leaf update watch source](../../../raw/processed/2026-09-03/ai-security-wiki-leaf-update-watch-20260904T000442Z.json)
- [GitHub advisory GHSA-7vc4-66f2-3f5f](https://github.com/advisories/GHSA-7vc4-66f2-3f5f)
- [GitHub advisory GHSA-gvgj-r6pg-m42w](https://github.com/advisories/GHSA-gvgj-r6pg-m42w)
- [GitHub advisory GHSA-7r9q-g8p5-w7pp](https://github.com/advisories/GHSA-7r9q-g8p5-w7pp)
- [NVD CVE-2026-84809](https://nvd.nist.gov/vuln/detail/CVE-2026-84809)
- [NVD CVE-2026-84810](https://nvd.nist.gov/vuln/detail/CVE-2026-84810)
- [NVD CVE-2026-84811](https://nvd.nist.gov/vuln/detail/CVE-2026-84811)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [testing and assurance](index.md)
- [Tencent AI-Infra-Guard skill-scan bytecode bypass](tencent-ai-infra-guard-skill-scan-bytecode-bypass.md)
- [claude-skill-antivirus manifest-only scan](claude-skill-antivirus-manifest-only-scan.md)
- [agentverus-scanner compiled bytecode certification bypass](agentverus-scanner-compiled-bytecode-certification-bypass.md)
- [Codex Security plugin workflow boundaries](codex-security-plugin-workflow-boundaries.md)
- [AI guardrail dependency compromise](../infrastructure-and-supply-chain/ai-guardrail-dependency-compromise.md)

## Open Questions

- Which scanners publish fixed versions or artifact-coverage attestations for bytecode and companion directories?

## Maintenance Notes

- Created on 2026-09-02 from the [September 2 topic collector](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json) as a single closely coupled scanner-assurance advisory family.
- Updated on 2026-09-03 from the [September 3 leaf update watch](../../../raw/processed/2026-09-03/ai-security-wiki-leaf-update-watch-20260904T000442Z.json) with agentverus CVE update evidence while avoiding a duplicate digest item for the same closely coupled scanner family.
