---
type: Topic
title: Network-AI FileJobStore Path Traversal
description: Caller-controlled job identifiers can cross Network-AI job-storage boundaries.
tags: [infrastructure-and-supply-chain]
---

# Network-AI FileJobStore Path Traversal

## Current Understanding

[CVE-2026-120311](https://nvd.nist.gov/vuln/detail/CVE-2026-120311) affects network-ai 5.13.4 through 5.15.4: a job identifier used by `FileJobStore` and `JobQueue` can traverse outside the JSON job directory. This can expose or delete JSON-held credentials, grant tokens, and authorization configuration. Treat agent-controlled persistence identifiers as untrusted paths and enforce resolved-path containment before every read or delete.

No exploitation is reported in the source. The security impact is assessed medium-high from the in-window NVD record and its linked maintainer advisory.

- Mitigation state: apply resolved-path containment; 5.15.5 is an unverified candidate remediation pending maintainer evidence.
- Residual risk: stored credentials and authorization JSON remain exposed where user-controlled job IDs reach legacy deployments.

## Authoritative Sources

- [November 3 collector source](../../../raw/processed/2026-11-03/ai-security-wiki-topic-news-collector-2026-11-03T002828Z.json)
- [NVD CVE-2026-120311](https://nvd.nist.gov/vuln/detail/CVE-2026-120311)
- [GitHub advisory GHSA-v64j-mc7x-c7x7](https://github.com/Jovancoding/Network-AI/security/advisories/GHSA-v64j-mc7x-c7x7)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [Agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)
- [Network-AI AgentRuntime sandbox path traversal](network-ai-agentruntime-sandbox-path-traversal.md)

## Open Questions

- Is 5.15.5 a confirmed remediation for this CVE, and, if so, does it share a change with the related Network-AI path issues?

## Maintenance Notes

- Created on 2026-11-03. Broad Network-AI product context is owned by ai-wiki; this page retains the local persistence and policy-file boundary.
