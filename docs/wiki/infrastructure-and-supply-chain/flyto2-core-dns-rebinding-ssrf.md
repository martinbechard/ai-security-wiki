---
type: "Topic"
title: "Flyto2 Core DNS-rebinding SSRF"
description: "Security analysis for CVE-2026-77313 and CVE-2026-77316 DNS-rebinding SSRF controls before Flyto2 Core v2.26.8."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# Flyto2 Core DNS-rebinding SSRF

## Current Understanding

The [November 20 collector source](../../../raw/processed/2026-11-20/ai-security-wiki-topic-news-collector-2026-11-20T003127Z.json) records [CVE-2026-77313](https://nvd.nist.gov/vuln/detail/CVE-2026-77313) and [CVE-2026-77316](https://nvd.nist.gov/vuln/detail/CVE-2026-77316) in Flyto2 Core before v2.26.8. Broad Flyto product context belongs upstream; this leaf owns the DNS-rebinding-resistant egress validation boundary.

## Security Impact

- Threat: attacker-controlled hostnames can resolve to internal or metadata-service addresses after initial SSRF validation.
- Affected boundary: Flyto2 Core before v2.26.8 and outbound destination validation.
- Exploit or incident status: public NVD and upstream advisory records; no confirmed exploitation or local incident is recorded.
- Mitigation state: upgrade to v2.26.8, pin or revalidate resolved destinations, and block metadata and private-network egress where not required.
- Confidence: high for the affected release boundary and named DNS-rebinding failures.
- Residual risk: network policy and proxy behavior can still permit unsafe resolved destinations.

## Authoritative Sources

- [November 20 collector source](../../../raw/processed/2026-11-20/ai-security-wiki-topic-news-collector-2026-11-20T003127Z.json)
- [CVE-2026-77313](https://nvd.nist.gov/vuln/detail/CVE-2026-77313)
- [CVE-2026-77316](https://nvd.nist.gov/vuln/detail/CVE-2026-77316)
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

- Do both advisories affect the same validation path or different network clients?

## Maintenance Notes

- Created on 2026-11-20 by separating DNS-rebinding controls from the Flyto2 advisory family.
