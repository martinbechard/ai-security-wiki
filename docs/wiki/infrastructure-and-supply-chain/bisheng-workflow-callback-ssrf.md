---
type: "Topic"
title: "Bisheng workflow callback SSRF"
description: "Security analysis for CVE-2026-82285 Bisheng unauthenticated workflow callback SSRF and object-storage response exposure."
tags: ["infrastructure-and-supply-chain", "agent-and-tool-security"]
---

# Bisheng workflow callback SSRF

## Current Understanding

The [August 28 topic collector source](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json) records [CVE-2026-82285](https://nvd.nist.gov/vuln/detail/CVE-2026-82285) for Bisheng through 2.6.0-fix2. Broad Bisheng and workflow-platform context belongs upstream; this page owns the local callback authentication, egress, and response-artifact boundary.

## Security Impact

- Threat: unauthenticated `POST /api/v1/workflow/report/callback` calls can fetch attacker-selected URLs without scheme restrictions or host filtering, then expose captured responses through caller-supplied object-storage names.
- Affected boundary: Bisheng through 2.6.0-fix2 workflow report callback and object-storage response handling.
- Exploit or incident status: GitHub Advisory Database and NVD evidence; no local in-the-wild exploitation evidence is recorded.
- Mitigation state: authenticate workflow callbacks, restrict URL schemes and destinations, isolate response artifacts, and verify maintainer patch status.
- Confidence: medium-high for advisory existence and SSRF mechanics; medium for patch boundary because the advisory was unreviewed and fixed version was unknown in the source.
- Residual risk: AI workflow platforms can bridge external callback inputs into internal services and retained artifacts when report callbacks are unauthenticated.

## Authoritative Sources

- [August 28 topic collector source](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json)
- [GitHub advisory GHSA-qch5-28r4-f5gj](https://github.com/advisories/GHSA-qch5-28r4-f5gj)
- [NVD CVE-2026-82285](https://nvd.nist.gov/vuln/detail/CVE-2026-82285)
- [Bisheng issue 2190](https://github.com/dataelement/bisheng/issues/2190)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [infrastructure and supply chain](index.md)
- [agent network egress controls](../agent-and-tool-security/agent-network-egress-controls.md)

## Open Questions

- Which Bisheng release authenticates report callbacks and filters callback destinations?

## Maintenance Notes

- Created on 2026-08-29 from the [August 28 topic collector](../../../raw/processed/2026-08-28/ai-security-wiki-topic-news-collector-2026-08-28T233139Z.json) as an AI workflow callback SSRF leaf.
