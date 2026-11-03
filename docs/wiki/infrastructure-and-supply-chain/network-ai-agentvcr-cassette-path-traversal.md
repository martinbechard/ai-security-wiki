---
type: Topic
title: Network-AI AgentVCR Cassette Path Traversal
description: AgentVCR cassette names can cross Network-AI recording storage and policy-file boundaries.
tags: [infrastructure-and-supply-chain]
---

# Network-AI AgentVCR Cassette Path Traversal

## Current Understanding

[CVE-2026-120312](https://nvd.nist.gov/vuln/detail/CVE-2026-120312) affects network-ai 5.13.4 through 5.15.4. Traversal sequences in an `AgentVCR` cassette name can read or overwrite JSON outside the intended directory, including policy files used by AuthGuardian. Recording and replay names are authority-bearing filesystem input and require canonical containment checks before access.

No exploitation is reported. The in-window NVD publication and linked maintainer advisory support medium-high confidence.

- Mitigation state: apply resolved-path containment; 5.15.5 is an unverified candidate remediation pending maintainer evidence.
- Residual risk: policy files can remain writable where cassette names reach legacy deployments.

## Authoritative Sources

- [November 3 collector source](../../../raw/processed/2026-11-03/ai-security-wiki-topic-news-collector-2026-11-03T002828Z.json)
- [NVD CVE-2026-120312](https://nvd.nist.gov/vuln/detail/CVE-2026-120312)
- [GitHub advisory GHSA-mfxv-jg44-xj48](https://github.com/Jovancoding/Network-AI/security/advisories/GHSA-mfxv-jg44-xj48)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [Agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)
- [Network-AI FileJobStore path traversal](network-ai-filejobstore-path-traversal.md)

## Open Questions

- Is 5.15.5 a confirmed remediation for this CVE, and, if so, does it share a root cause with CVE-2026-120311 or remain cassette-specific?

## Maintenance Notes

- Created on 2026-11-03; Network-AI catalog facts remain upstream-owned.
