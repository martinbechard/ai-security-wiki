---
type: "Topic"
title: "Tencent AI-Infra-Guard Skill Scan Bytecode Bypass"
description: "Security assurance analysis for CVE-2026-84809 Tencent AI-Infra-Guard skill-scan compiled bytecode blind spot."
tags: ["testing-and-assurance", "infrastructure-and-supply-chain"]
---

# Tencent AI-Infra-Guard Skill Scan Bytecode Bypass

## Current Understanding

The [September 2 topic collector source](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json) records [CVE-2026-84809](https://nvd.nist.gov/vuln/detail/CVE-2026-84809) and [GitHub advisory GHSA-7vc4-66f2-3f5f](https://github.com/advisories/GHSA-7vc4-66f2-3f5f) for Tencent AI-Infra-Guard skill-scan. Broad Tencent AI-Infra-Guard product context routes upstream; this page owns the local scanner-assurance boundary for omitted compiled Python artifacts.

The advisory says skill-scan hardcodes `__pycache__` directories and `.pyc`, `.pyo`, and `.pyd` extensions into skip lists. An attacker can distribute skills with benign source and malicious compiled bytecode that executes on import while the scanner reports a safe verdict.

## Security Impact

- Threat: malicious bytecode can bypass a skill scanner and execute after import.
- Affected boundary: Tencent AI-Infra-Guard skill-scan component and Python bytecode artifacts.
- Exploit or incident status: public GitHub Advisory Database and NVD records; no local incident is recorded.
- Mitigation state: fixed version is not yet identified locally; remove bytecode skip-list trust and inspect executable artifacts recursively.
- Confidence: high for the disclosed scanner blind spot; medium for remediation until vendor release evidence is captured.
- Residual risk: scanner skip lists can become attacker guidance when they omit executable artifact classes.

## Authoritative Sources

- [September 2 topic collector source](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json)
- [GitHub advisory GHSA-7vc4-66f2-3f5f](https://github.com/advisories/GHSA-7vc4-66f2-3f5f)
- [NVD CVE-2026-84809](https://nvd.nist.gov/vuln/detail/CVE-2026-84809)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [AI skill scanner executable artifact coverage](ai-skill-scanner-executable-artifact-coverage.md)
- [testing and assurance](index.md)

## Open Questions

- Which Tencent AI-Infra-Guard release removes the bytecode blind spot or documents equivalent compensating controls?

## Maintenance Notes

- Created on 2026-09-02 from the [September 2 topic collector](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json) as the Tencent member of the skill-scanner executable-artifact coverage set.
