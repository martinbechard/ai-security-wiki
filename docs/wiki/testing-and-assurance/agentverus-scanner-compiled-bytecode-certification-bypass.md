---
type: "Topic"
title: "agentverus-scanner Compiled Bytecode Certification Bypass"
description: "Security assurance analysis for CVE-2026-84811 agentverus-scanner certification of packages with malicious compiled companion bytecode."
tags: ["testing-and-assurance", "infrastructure-and-supply-chain"]
---

# agentverus-scanner Compiled Bytecode Certification Bypass

## Current Understanding

The [September 2 topic collector source](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json) records [CVE-2026-84811](https://nvd.nist.gov/vuln/detail/CVE-2026-84811) and [GitHub advisory GHSA-7r9q-g8p5-w7pp](https://github.com/advisories/GHSA-7r9q-g8p5-w7pp) for agentverus-scanner. Broad agentverus-scanner product context routes upstream if it becomes durable; this page owns the local certification boundary where companion bytecode can be omitted from analysis.

The advisory says agentverus-scanner fails to analyze compiled Python bytecode in companion code directories. A malicious package can include benign source and malicious `__pycache__` bytecode while receiving a CERTIFIED verdict with high trust scores in static and semantic analysis modes.

The [September 3 leaf update watch source](../../../raw/processed/2026-09-03/ai-security-wiki-leaf-update-watch-20260904T000442Z.json) records [direct CVE update evidence](https://cveawg.mitre.org/api/cve/CVE-2026-84811) for CVE-2026-84811. The update does not identify a fixed scanner release, so certification consumers still need a compensating policy that either rejects companion bytecode or verifies bytecode-source consistency before trusting scanner verdicts.

## Security Impact

- Threat: certification pipelines can approve malicious executable artifacts when analysis omits companion bytecode.
- Affected boundary: agentverus-scanner companion code directories, compiled Python bytecode, static analysis, and semantic analysis verdicts.
- Exploit or incident status: public GitHub Advisory Database and NVD records; no local incident is recorded.
- Mitigation state: fixed version is not yet identified locally; require bytecode analysis, bytecode bans, or source-to-bytecode consistency checks before certification.
- Confidence: high for the disclosed certification blind spot; medium for remediation until vendor release evidence is captured.
- Residual risk: certification labels can amplify supply-chain trust errors when artifact coverage is incomplete.

## Authoritative Sources

- [September 2 topic collector source](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json)
- [September 3 leaf update watch source](../../../raw/processed/2026-09-03/ai-security-wiki-leaf-update-watch-20260904T000442Z.json)
- [GitHub advisory GHSA-7r9q-g8p5-w7pp](https://github.com/advisories/GHSA-7r9q-g8p5-w7pp)
- [NVD CVE-2026-84811](https://nvd.nist.gov/vuln/detail/CVE-2026-84811)

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

- Which agentverus-scanner release changes companion-code bytecode handling or certification evidence?

## Maintenance Notes

- Created on 2026-09-02 from the [September 2 topic collector](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json) as the certification member of the skill-scanner executable-artifact coverage set.
- Updated on 2026-09-03 from the [September 3 leaf update watch](../../../raw/processed/2026-09-03/ai-security-wiki-leaf-update-watch-20260904T000442Z.json) with direct CVE update evidence and unchanged fixed-version uncertainty.
