---
type: "Topic"
title: "Budibase AI Table Generation SSRF"
description: "Security analysis for CVE-2026-103757 SSRF in Budibase AI table generation uploadUrl handling."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Budibase AI Table Generation SSRF

## Current Understanding

The [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json) records [CVE-2026-103757](https://cveawg.mitre.org/api/cve/CVE-2026-103757) for Budibase through 3.41.0. Broad Budibase low-code platform context belongs upstream or out of local scope; this page owns the local AI table-generation network-fetch boundary.

The source says AI table generation uses `uploadUrl` with raw `node-fetch` rather than Budibase's guarded fetch path. User-controlled AI import or generation workflows can therefore become server-side network access.

## Security Impact

- Threat: AI table-generation inputs can trigger SSRF against internal services or metadata endpoints.
- Affected boundary: Budibase through 3.41.0; AI table generation `uploadUrl` fetch path.
- Exploit or incident status: public CVE record; no confirmed exploitation is recorded in the source.
- Mitigation state: fixed-version detail requires vendor reference; operators should route AI import fetches through SSRF-guarded HTTP clients and restrict private, loopback, metadata, redirect, and rebinding destinations.
- Confidence: high for CVE text; medium for patch mechanism and fixed version until primary Budibase evidence is captured.
- Residual risk: AI-assisted data import often hides network egress inside convenience features, so fetch helpers need common SSRF controls across product areas.

## Authoritative Sources

- [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json)
- [CVE-2026-103757 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-103757)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent network egress controls](agent-network-egress-controls.md)
- [Laravel AI SDK file URL SSRF](laravel-ai-sdk-file-url-ssrf.md)

## Open Questions

- Which Budibase release or advisory identifies the fixed version and guarded-fetch change?

## Maintenance Notes

- Created on 2026-10-02 from the [October 1 topic collector source](../../../raw/processed/2026-10-01/ai-security-wiki-topic-news-collector-2026-10-01T233213Z.json).
