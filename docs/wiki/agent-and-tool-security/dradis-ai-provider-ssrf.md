---
type: "Topic"
title: "Dradis AI Provider SSRF"
description: "Security analysis for CVE-2026-79788 low-privilege AI provider configuration SSRF in Dradis Community Edition."
tags: ["agent-and-tool-security", "identity-and-access"]
---

# Dradis AI Provider SSRF

## Current Understanding

CVE-2026-79788 affects Dradis Community Edition 5.1.0 through 5.2.0 and crosses the local AI provider egress authorization boundary. Broad Dradis product context belongs upstream; this page owns the security analysis for low-privilege provider rewiring and readable SSRF responses. The [August 26 topic news collector source](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json) and [August 27 leaf update watch source](../../../raw/processed/2026-08-27/ai-security-wiki-leaf-update-watch-20260828T000238Z.json) provide the current evidence.

Provider and agent controllers skip an intended `admin_required` check because it depends on a `Dradis::Pro` constant not defined in Community Edition. The exploit path is:

- A non-admin authenticated user configures an arbitrary HTTP or HTTPS AI provider address, including internal or link-local hosts.
- The same user reassigns the built-in Roslin agent to that provider.
- An AI interaction makes the server request the attacker-supplied URL.
- Non-2xx target response bodies are reflected to the attacker's browser through ActionCable or Turbo Stream errors.

Provider configuration is therefore both an identity boundary and an egress boundary.

## Security Impact

- Threat: low-privilege AI provider rewiring can expose internal services or metadata endpoints through readable SSRF responses.
- Affected boundary: Dradis Community Edition 5.1.0 through 5.2.0; AI provider URL configuration; Roslin agent assignment; internal/link-local egress.
- Exploit or incident status: public NVD, issue, and VulnCheck evidence; no local exploitation incident is recorded.
- Mitigation state: no fixed version is recorded in the raw source; restrict provider configuration to administrators and validate final egress destinations.
- Confidence: high for advisory mechanics from NVD and public issue evidence; medium for remediation state.
- Residual risk: AI-provider configuration screens can become network pivots when low-privilege roles can change provider endpoints.

## Authoritative Sources

- [August 27 leaf update watch source](../../../raw/processed/2026-08-27/ai-security-wiki-leaf-update-watch-20260828T000238Z.json)
- [CVE-2026-79788 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-79788)
- [August 26 topic news collector source](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json)
- [NVD CVE-2026-79788](https://nvd.nist.gov/vuln/detail/CVE-2026-79788)
- [Dradis CE issue 1641](https://github.com/dradis/dradis-ce/issues/1641)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/dradis-community-edition-5.1.0-through-5.2.0-server-side-request-forgery-via-unrestricted-ai-provider-address)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent network egress controls](agent-network-egress-controls.md)
- [AI provider override trust boundaries](../data-and-privacy/ai-provider-override-trust-boundaries.md)
- [production agent identity and access controls](../identity-and-access/production-agent-identity-and-access-controls.md)

## Open Questions

- Which Dradis CE release fixes CVE-2026-79788, and does the fix centralize authorization for provider and agent-controller changes?

## Maintenance Notes

- Updated on 2026-08-28 with August 27 leaf-update evidence for CVE-2026-79788.
- Created on 2026-08-27 from the [August 26 topic collector](../../../raw/processed/2026-08-26/ai-security-wiki-topic-news-collector-2026-08-26T233123Z.json) as an AI provider configuration SSRF leaf.
