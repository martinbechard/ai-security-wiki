---
type: Topic
title: MCPHub Passthrough-Header Information Disclosure
description: MCP gateway header forwarding can disclose information across a remote trust boundary.
tags: [agent-and-tool-security]
---

# MCPHub Passthrough-Header Information Disclosure

## Current Understanding

[CVE-2026-120323](https://nvd.nist.gov/vuln/detail/CVE-2026-120323) affects samanhappy MCPHub through 1.0.45 and 1.1.7. Remote manipulation of `passthroughHeaders` can disclose information. Header forwarding in an MCP gateway is a credential and cross-service trust boundary; deployments should allowlist explicitly required headers and avoid relaying ambient credentials.

No exploitation is reported. Confidence is medium: the in-window NVD record identifies patch commit `040f7b9` and version 1.1.8, but the exact exposed header classes need reconciliation with that patch.

- Mitigation state: upgrade to the stated 1.1.8 remediation and allowlist only required forwarded headers.
- Residual risk: ambient credentials can still cross trust boundaries if gateway policy forwards them unnecessarily.

## Authoritative Sources

- [November 3 collector source](../../../raw/processed/2026-11-03/ai-security-wiki-topic-news-collector-2026-11-03T002828Z.json)
- [NVD CVE-2026-120323](https://nvd.nist.gov/vuln/detail/CVE-2026-120323)
- [Maintainer patch](https://github.com/samanhappy/mcphub/commit/040f7b9ae004070bdfe5084cde6bc2c609f78e76)
- [MCPHub 1.1.8 release](https://github.com/samanhappy/mcphub/releases/tag/v1.1.8)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [MCPHub control plane advisory cluster](mcphub-control-plane-advisory-cluster.md)

## Open Questions

- Which authorization, cookie, or other header categories are exposed by the vulnerable forwarding behavior?

## Maintenance Notes

- Created on 2026-11-03. Broad MCPHub catalog coverage remains upstream-owned.
