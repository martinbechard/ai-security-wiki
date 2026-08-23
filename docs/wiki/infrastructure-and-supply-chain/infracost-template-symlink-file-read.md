---
type: "Topic"
title: "Infracost Template Symlink File Read"
description: "Security analysis for CVE-2026-71493 Infracost template functions reading runner files through checkout symlinks."
tags: ["infrastructure-and-supply-chain", "data-and-privacy"]
---

# Infracost Template Symlink File Read

## Current Understanding

The [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) records CVE-2026-71493 for Infracost before 0.10.45. Broad Terraform and CI practice belongs upstream or ai-dev-wiki; this page owns the local file-read boundary for cost-analysis tools running in agent or CI workflows.

The [NVD record](https://nvd.nist.gov/vuln/detail/CVE-2026-71493) describes lexical path checks and leaf-only stat checks in template functions. A repository symlink can make `readFile` and related functions read runner-accessible files and surface them through generated configuration, dashboards, or pull request comments.

## Security Impact

- Threat: untrusted Terraform input can make a cost-analysis workflow read local runner files and publish them through normal report outputs.
- Affected boundary: Infracost before 0.10.45 template function file access and symlink handling.
- Exploit or incident status: public NVD record; no local exploitation evidence is recorded.
- Mitigation state: update to 0.10.45 or later, canonicalize file targets, reject symlinks that escape trusted roots, and run untrusted cost scans without sensitive files.
- Confidence: medium-high because the collector cites NVD; primary vendor advisory links were not captured.
- Residual risk: coding agents and CI bots often summarize tool output into comments, turning local file read into durable data exposure.

## Authoritative Sources

- [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json)
- [NVD CVE-2026-71493](https://nvd.nist.gov/vuln/detail/CVE-2026-71493)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent build and dependency execution boundaries](agent-build-and-dependency-execution-boundaries.md)
- [agent tool filesystem path containment](agent-tool-filesystem-path-containment.md)

## Open Questions

- Which primary Infracost advisory or release note confirms the exact patched path checks for CVE-2026-71493?

## Maintenance Notes

- Created on 2026-08-22 from the [August 22 topic news collector source](../../../raw/processed/2026-08-22/ai-security-wiki-topic-news-collector-2026-08-22T233049Z.json) as the file-read member of the Infracost 0.10.45 advisory set.
