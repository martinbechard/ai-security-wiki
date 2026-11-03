---
type: Topic
title: Network-AI InputSanitizer Sandbox Escape
description: A prefix-only path check can let Network-AI resource paths escape their sandbox.
tags: [infrastructure-and-supply-chain]
---

# Network-AI InputSanitizer Sandbox Escape

## Current Understanding

[CVE-2026-120313](https://nvd.nist.gov/vuln/detail/CVE-2026-120313) affects Network-AI before 5.15.5. `InputSanitizer.sanitizePath` uses an unanchored `startsWith` check, allowing sibling-directory paths with a matching prefix to escape the intended base directory for reads, listings, or writes. Filesystem sandbox checks must compare resolved canonical paths with a directory separator boundary rather than a raw string prefix.

No exploitation is reported. Confidence is medium because the in-window NVD record has no maintainer advisory identified in the source.

- Mitigation state: replace prefix-only checks with canonical containment and verify the reported 5.15.5 boundary.
- Residual risk: sibling-prefix paths remain an escape route until the effective fix is deployed and tested.

## Authoritative Sources

- [November 3 collector source](../../../raw/processed/2026-11-03/ai-security-wiki-topic-news-collector-2026-11-03T002828Z.json)
- [NVD CVE-2026-120313](https://nvd.nist.gov/vuln/detail/CVE-2026-120313)

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

- Which maintainer change establishes the reported pre-5.15.5 remediation boundary?

## Maintenance Notes

- Created on 2026-11-03. Generic Network-AI background routes to ai-wiki.
