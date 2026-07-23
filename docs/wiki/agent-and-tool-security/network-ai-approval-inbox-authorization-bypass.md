---
type: "Topic"
title: "Network-AI ApprovalInbox Authorization Bypass"
description: "Security analysis for CVE-2026-64622, where approval-read routes expose delegated-action metadata."
---

# Network-AI ApprovalInbox Authorization Bypass

## Current Understanding

The [July 22 topic news collector source](../../../raw/processed/2026-07-22/ai-security-wiki-topic-news-collector-2026-07-22T193242-0400.json) records CVE-2026-64622 for Network-AI versions 5.12.2 through 5.13.3. The ApprovalInbox read, stats, and SSE routes miss the configured `checkAuth` or secret check even when mutating approval and denial routes are gated.

The [GitHub advisory](https://github.com/Jovancoding/Network-AI/security/advisories/GHSA-m4jg-6w3q-gm86) checked during ingest lists `network-ai` patched version 5.13.4, and [npm package metadata](https://www.npmjs.com/package/network-ai) reports later versions exist. The local security lesson is captured in [approval metadata access control](approval-metadata-access-control.md): pending shell commands, file paths, justifications, and risk levels can expose operational intent even when action execution remains protected.

## Security Impact

- Threat: unauthenticated reads expose queued agent action requests and risk metadata, with wildcard CORS increasing browser-based disclosure risk.
- Affected boundary: Network-AI 5.12.2 through 5.13.3, ApprovalInbox GET read routes, stats route, and SSE stream.
- Exploit or incident status: public CVE and GitHub advisory; the raw source notes CISA-ADP proof-of-concept status.
- Mitigation state: patched in 5.13.4 according to the GitHub advisory; approval systems should gate read and stream routes with the same policy as mutating routes and avoid wildcard CORS for sensitive queues.
- Confidence: high for affected and patched ranges from the GitHub advisory and npm metadata.
- Residual risk: operators on 5.13.3 or below may assume the earlier ApprovalInbox hardening fully protected reads when it only protected mutations.

## Authoritative Sources

- [July 22 topic news collector source](../../../raw/processed/2026-07-22/ai-security-wiki-topic-news-collector-2026-07-22T193242-0400.json)
- NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-64622
- GitHub advisory: https://github.com/Jovancoding/Network-AI/security/advisories/GHSA-m4jg-6w3q-gm86
- npm package metadata checked during ingest: https://www.npmjs.com/package/network-ai

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [approval metadata access control](approval-metadata-access-control.md)
- [identity and access](../identity-and-access/index.md)
- [data and privacy](../data-and-privacy/index.md)
- Upstream AI development wiki owns general approval workflow practice.

## Open Questions

- No open Network-AI ApprovalInbox questions are recorded.

## Maintenance Notes

- Added from the July 22, 2026 raw collector artifact, GitHub advisory metadata, and npm metadata.
