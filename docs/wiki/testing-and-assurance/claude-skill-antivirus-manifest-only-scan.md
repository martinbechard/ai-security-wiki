---
type: "Topic"
title: "claude-skill-antivirus Manifest-Only Scan"
description: "Security assurance analysis for CVE-2026-84810 claude-skill-antivirus local skill directory scanning that ignores executable companion files."
tags: ["testing-and-assurance", "infrastructure-and-supply-chain"]
---

# claude-skill-antivirus Manifest-Only Scan

## Current Understanding

The [September 2 topic collector source](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json) records [CVE-2026-84810](https://nvd.nist.gov/vuln/detail/CVE-2026-84810) and [GitHub advisory GHSA-gvgj-r6pg-m42w](https://github.com/advisories/GHSA-gvgj-r6pg-m42w) for claude-skill-antivirus. Broad Claude skill packaging and install workflow context routes upstream; this page owns the local assurance boundary where a scanner reads only the skill manifest.

The advisory says claude-skill-antivirus scans only `SKILL.md` when reviewing local skill directories and ignores Python source, bytecode, and other artifacts in scripts directories. An attacker can ship malicious companion code outside the manifest and still receive a SAFE verdict and high trust score.

## Security Impact

- Threat: executable companion files can evade review when the scanner treats the manifest as the whole package.
- Affected boundary: claude-skill-antivirus local skill directory scanning, `SKILL.md`, scripts directories, and Python artifacts.
- Exploit or incident status: public GitHub Advisory Database and NVD records; no local incident is recorded.
- Mitigation state: fixed version is not yet identified locally; scan the complete directory tree and report artifact coverage with each verdict.
- Confidence: high for the manifest-only scanning behavior; medium for remediation until vendor evidence is captured.
- Residual risk: SAFE verdicts are misleading when they do not disclose that executable files were excluded from analysis.

## Authoritative Sources

- [September 2 topic collector source](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json)
- [GitHub advisory GHSA-gvgj-r6pg-m42w](https://github.com/advisories/GHSA-gvgj-r6pg-m42w)
- [NVD CVE-2026-84810](https://nvd.nist.gov/vuln/detail/CVE-2026-84810)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [AI skill scanner executable artifact coverage](ai-skill-scanner-executable-artifact-coverage.md)
- [Codex Security plugin workflow boundaries](codex-security-plugin-workflow-boundaries.md)

## Open Questions

- Which claude-skill-antivirus version changes local-directory scan scope or verdict reporting?

## Maintenance Notes

- Created on 2026-09-02 from the [September 2 topic collector](../../../raw/processed/2026-09-02/ai-security-wiki-topic-news-collector-2026-09-02T233120Z.json) as the manifest-only scanner member of the skill-scanner coverage set.
