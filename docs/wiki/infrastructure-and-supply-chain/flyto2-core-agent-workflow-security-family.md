---
type: "Topic"
title: "Flyto2 Core agent-workflow advisory family"
description: "Navigation for four independently maintained Flyto2 Core security boundaries remediated in v2.26.8."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# Flyto2 Core agent-workflow advisory family

## Current Understanding

The [November 20 collector source](../../../raw/processed/2026-11-20/ai-security-wiki-topic-news-collector-2026-11-20T003127Z.json) records five related Flyto2 Core flaws before v2.26.8. Broad Flyto product context belongs upstream; this page retains only the shared release gate and links to the independently maintained controls.

- [Filesystem sandbox write escape](flyto2-core-filesystem-sandbox-write-escape.md) — CVE-2026-77312.
- [DNS-rebinding SSRF](flyto2-core-dns-rebinding-ssrf.md) — CVE-2026-77313 and CVE-2026-77316.
- [MCP recipe path traversal](flyto2-core-mcp-recipe-path-traversal.md) — CVE-2026-77314.
- [Pagination continuation SSRF](flyto2-core-pagination-continuation-ssrf.md) — CVE-2026-77315.

## Security Impact

- Threat: a shared runtime release carried independent filesystem, network, and MCP authority failures.
- Affected boundary: Flyto2 Core before v2.26.8; see the linked leaves for the specific control boundaries.
- Exploit or incident status: public NVD and upstream advisory records; no confirmed exploitation or local incident is recorded.
- Mitigation state: upgrade to [v2.26.8](https://github.com/flytohub/flyto-core/releases/tag/v2.26.8), then apply the control-specific validation in each leaf.
- Confidence: high for the shared affected release boundary; deployment reachability remains environment-specific.
- Residual risk: package upgrade alone does not validate runtime mounts, outbound policy, recipe policy, or pagination handling.

## Authoritative Sources

- [November 20 collector source](../../../raw/processed/2026-11-20/ai-security-wiki-topic-news-collector-2026-11-20T003127Z.json)
- [Flyto2 Core v2.26.8 release](https://github.com/flytohub/flyto-core/releases/tag/v2.26.8)
- [GHSA-h9f9-h6gm-wc85](https://github.com/flytohub/flyto-core/security/advisories/GHSA-h9f9-h6gm-wc85)
- [GHSA-pfg2-w999-497v](https://github.com/flytohub/flyto-core/security/advisories/GHSA-pfg2-w999-497v)
- [GHSA-mxcc-cr6x-2mvr](https://github.com/flytohub/flyto-core/security/advisories/GHSA-mxcc-cr6x-2mvr)
- [GHSA-2mr3-rxrq-238c](https://github.com/flytohub/flyto-core/security/advisories/GHSA-2mr3-rxrq-238c)
- [GHSA-6pm8-6f34-9v3g](https://github.com/flytohub/flyto-core/security/advisories/GHSA-6pm8-6f34-9v3g)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent network egress controls](../agent-and-tool-security/agent-network-egress-controls.md)
- [filesystem sandbox write escape](flyto2-core-filesystem-sandbox-write-escape.md)
- [DNS-rebinding SSRF](flyto2-core-dns-rebinding-ssrf.md)
- [MCP recipe path traversal](flyto2-core-mcp-recipe-path-traversal.md)
- [pagination continuation SSRF](flyto2-core-pagination-continuation-ssrf.md)

## Open Questions

- Which enabled Flyto2 modules make each linked advisory path reachable in deployed environments?

## Maintenance Notes

- Created on 2026-11-20 from the November 20 collector; split into four control leaves on 2026-11-20 because the shared release boundary does not make the controls one maintenance unit.
