---
type: "Topic"
title: "Flyto2 Core pagination continuation SSRF"
description: "Security analysis for CVE-2026-77315 continuation-URL SSRF before Flyto2 Core v2.26.8."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# Flyto2 Core pagination continuation SSRF

## Current Understanding

The [November 20 collector source](../../../raw/processed/2026-11-20/ai-security-wiki-topic-news-collector-2026-11-20T003127Z.json) records [CVE-2026-77315](https://nvd.nist.gov/vuln/detail/CVE-2026-77315) in Flyto2 Core before v2.26.8. Broad Flyto product context belongs upstream; this leaf owns the server-provided pagination continuation URL boundary.

## Security Impact

- Threat: an unvalidated continuation URL can trigger second-order SSRF to internal or metadata services.
- Affected boundary: Flyto2 Core before v2.26.8 and pagination-link handling.
- Exploit or incident status: public NVD and upstream advisory records; no confirmed exploitation or local incident is recorded.
- Mitigation state: upgrade to v2.26.8, validate every continuation destination, and apply egress controls to follow-up requests.
- Confidence: high for the affected release boundary and continuation-link SSRF description.
- Residual risk: trusted initial endpoints can still return untrusted follow-up destinations.

## Authoritative Sources

- [November 20 collector source](../../../raw/processed/2026-11-20/ai-security-wiki-topic-news-collector-2026-11-20T003127Z.json)
- [CVE-2026-77315](https://nvd.nist.gov/vuln/detail/CVE-2026-77315)
- [Flyto2 Core v2.26.8 release](https://github.com/flytohub/flyto-core/releases/tag/v2.26.8)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [Flyto2 Core advisory family](flyto2-core-agent-workflow-security-family.md)
- [agent network egress controls](../agent-and-tool-security/agent-network-egress-controls.md)

## Open Questions

- Which continuation sources are allowed to supply URLs to the runtime?

## Maintenance Notes

- Created on 2026-11-20 by separating pagination continuation validation from the Flyto2 advisory family.
