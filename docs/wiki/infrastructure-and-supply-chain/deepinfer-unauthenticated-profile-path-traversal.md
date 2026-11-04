---
type: "Topic"
title: "DeepInfer Unauthenticated Profile Path Traversal"
description: "Security analysis for CVE-2026-120204 unauthenticated profiling trace-file writes."
tags: ["infrastructure-and-supply-chain", "identity-and-access"]
---

# DeepInfer Unauthenticated Profile Path Traversal

## Current Understanding

The [October 31 collector](../../../raw/processed/2026-10-31/ai-security-wiki-topic-news-collector-2026-10-31T232757Z.json) records [CVE-2026-120204](https://nvd.nist.gov/vuln/detail/CVE-2026-120204): DeepInfer through 0.1.0 exposes an unauthenticated `/profile` endpoint whose `output_dir` can traverse outside an intended trace-output location. Broad [DeepSeek-AI](../../../upstream-ai-wiki/companies/deepseek-ai.md) context belongs upstream; this page owns the profiling-service authentication and filesystem-write boundary. The [November 4 leaf update watch](../../../raw/processed/2026-11-04/ai-security-wiki-leaf-update-watch-20261104T010357Z.json) records CISA ADP metadata updated November 2 with `Exploitation=none`, `Automatable=no`, and `Technical Impact=partial`; it is a risk-metadata update, not evidence of demonstrated exploitation or a fixed release.

## Security Impact

- Threat: a remote unauthenticated caller can create directories and write Chrome trace files at attacker-selected filesystem locations.
- Affected boundary: DeepInfer through 0.1.0, the `/profile` endpoint, `output_dir` path handling, and host trace-file storage.
- Exploit or incident status: public CVE and GitHub advisory; no confirmed exploitation incident is recorded locally.
- Mitigation state: restrict or disable unauthenticated profiling endpoints, bind output to a canonicalized service-owned directory, enforce disk and inode budgets, and expose errors without path-oracle details. A linked patch pull request exists, but no maintainer-released fixed version is identified in the captured evidence.
- Confidence and residual risk: medium-high for the disclosed path-write and availability boundary; residual risk remains until a released patch and the runtime's network exposure are verified.

## Authoritative Sources

- [October 31 collector](../../../raw/processed/2026-10-31/ai-security-wiki-topic-news-collector-2026-10-31T232757Z.json)
- [GitHub advisory GHSA-qv68-3gfq-wxpc](https://github.com/advisories/GHSA-qv68-3gfq-wxpc)
- [NVD CVE-2026-120204](https://nvd.nist.gov/vuln/detail/CVE-2026-120204)
- [DeepInfer pull request 242](https://github.com/deepseek-ai/DeepInfer/pull/242)
- [November 4 leaf update watch](../../../raw/processed/2026-11-04/ai-security-wiki-leaf-update-watch-20261104T010357Z.json)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)

## Open Questions

- Which maintainer-tagged DeepInfer release contains pull request 242, and does it address authentication, containment, and resource exhaustion together?

## Maintenance Notes

- Created on 2026-10-31 as an independently maintainable diagnostic-endpoint filesystem boundary.
- Updated on 2026-11-04 with CISA ADP SSVC metadata; maintainer-release uncertainty remains unchanged.
