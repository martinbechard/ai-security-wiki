---
type: "Topic"
title: "MaxKB Knowledge Crawler SSRF"
description: "Security analysis for CVE-2026-77522 full-read SSRF in MaxKB knowledge web-document import and sync."
tags: ["infrastructure-and-supply-chain", "data-and-privacy"]
---

# MaxKB Knowledge Crawler SSRF

## Current Understanding

The [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json) records [CVE-2026-77522](https://cveawg.mitre.org/api/cve/CVE-2026-77522) for MaxKB 2.10.3-lts and earlier. Broad MaxKB product context belongs upstream; this page owns authenticated crawler egress and metadata exposure risk.

The knowledge web-document import and synchronization crawler passes an authenticated workspace user's URL to `Fork.fork`, which calls `requests.get` with `verify=False` and without restricting schemes, loopback, link-local, private, or reserved addresses. The response body is converted into imported document content, allowing a low-privileged user to read cloud metadata or internal HTTP services through the MaxKB server. No fixed version was available in the captured record.

## Security Impact

- Threat: authenticated knowledge import can become full-read SSRF into cloud metadata or internal services.
- Affected boundary: MaxKB 2.10.3-lts and earlier; knowledge web-document import and synchronization crawler.
- Exploit or incident status: public GitHub advisory; no local exploitation evidence is recorded.
- Mitigation state: no fixed version identified; restrict crawler schemes and resolved destinations, block metadata addresses, and avoid importing internal response bodies into retrievable knowledge documents.
- Confidence: high for advisory existence and affected range; fixed-version confidence is unavailable.
- Residual risk: knowledge importers convert server-side network access into durable assistant-readable content.

## Authoritative Sources

- [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json)
- [CVE-2026-77522 JSON](https://cveawg.mitre.org/api/cve/CVE-2026-77522)
- [GitHub advisory GHSA-ffxw-frpx-8rww](https://github.com/1Panel-dev/MaxKB/security/advisories/GHSA-ffxw-frpx-8rww)

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

- Which MaxKB release fixes CVE-2026-77522?

## Maintenance Notes

- Created on 2026-09-21 from the [September 21 topic collector source](../../../raw/processed/2026-09-21/ai-security-wiki-topic-news-collector-2026-09-21T233156Z.json).
