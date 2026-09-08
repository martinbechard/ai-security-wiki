---
type: "Topic"
title: "Igniter Install Confirmation Prompt Forgery"
description: "Security analysis for CVE-2026-82584 terminal escape injection in Igniter package-install confirmation."
tags: ["infrastructure-and-supply-chain"]
---

# Igniter Install Confirmation Prompt Forgery

## Current Understanding

The [September 7 topic collector source](../../../raw/processed/2026-09-07/ai-security-wiki-topic-news-collector-2026-09-07T233220Z.json) records [CVE-2026-82584](https://cveawg.mitre.org/api/cve/CVE-2026-82584) for ash-project Igniter from 0.8.1 before 0.8.4. The CVE says publisher-controlled Hex package metadata shown by `mix igniter.install` could include ANSI terminal escape sequences that forge the confirmation panel used for dependency approval.

This page keeps the local supply-chain security implication: terminal UI used as an anti-typosquatting or dependency-vetting control must neutralize control characters before humans or agents rely on it. General dependency-install workflow practice belongs upstream in ai-dev-wiki, and broad Ash/Igniter ecosystem context belongs upstream in ai-wiki when needed.

## Security Impact

- Threat: a malicious or typosquatted package can hide real metadata and forge trusted author or download signals in the terminal confirmation panel.
- Affected boundary: Igniter 0.8.1 before 0.8.4 for the Hex package, and GitHub source before commit `d492b1aa33f8fb0dacc0afa41b703fb922d42816` according to the CVE affected list.
- Exploit or incident status: public [CVE](https://cveawg.mitre.org/api/cve/CVE-2026-82584) and [vendor advisory](https://github.com/ash-project/igniter/security/advisories/GHSA-cj7w-j579-gc42); no active exploitation evidence is recorded by the source.
- Mitigation state: upgrade to Igniter 0.8.4 or later and sanitize terminal control sequences in package metadata before rendering approval prompts; the direct CVE and [OSV entry](https://osv.dev/vulnerability/EEF-CVE-2026-82584) both point to [patch commit d492b1aa33f8fb0dacc0afa41b703fb922d42816](https://github.com/ash-project/igniter/commit/d492b1aa33f8fb0dacc0afa41b703fb922d42816).
- Confidence: high for affected versions, control-sequence injection class, and patch reference because the direct CVE, GitHub advisory, OSV entry, and patch commit align.
- Residual risk: agent-assisted dependency installation can amplify misleading terminal output when logs or screenshots are treated as approval evidence.

## Authoritative Sources

- [September 7 topic collector source](../../../raw/processed/2026-09-07/ai-security-wiki-topic-news-collector-2026-09-07T233220Z.json)
- [CVE-2026-82584 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-82584)
- [Igniter GitHub advisory GHSA-cj7w-j579-gc42](https://github.com/ash-project/igniter/security/advisories/GHSA-cj7w-j579-gc42)
- [ErlEF CNA CVE-2026-82584 page](https://cna.erlef.org/cves/CVE-2026-82584.html)
- [OSV EEF-CVE-2026-82584](https://osv.dev/vulnerability/EEF-CVE-2026-82584)
- [Igniter fix commit d492b1aa33f8fb0dacc0afa41b703fb922d42816](https://github.com/ash-project/igniter/commit/d492b1aa33f8fb0dacc0afa41b703fb922d42816)
- [NVD CVE-2026-82584](https://nvd.nist.gov/vuln/detail/CVE-2026-82584)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [Agent build and dependency execution boundaries](agent-build-and-dependency-execution-boundaries.md)
- [Slopsquatting package hallucination risk](slopsquatting-package-hallucination-risk.md)

## Open Questions

- Which local dependency-install approval logs preserve raw terminal control characters or rendered panels as evidence?

## Maintenance Notes

- Created on 2026-09-07 from the September 7 topic collector as a package-install trust UI advisory leaf.
