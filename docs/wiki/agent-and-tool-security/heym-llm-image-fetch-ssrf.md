---
type: "Topic"
title: "Heym LLM Image Fetch SSRF"
description: "Security analysis for CVE-2026-100863 Heym LLM image-fetch and IPv6 validation SSRF."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Heym LLM Image Fetch SSRF

## Current Understanding

The [September 27 topic collector source](../../../raw/processed/2026-09-27/ai-security-wiki-topic-news-collector-2026-09-27T233044Z.json) records [CVE-2026-100863](https://nvd.nist.gov/vuln/detail/CVE-2026-100863) for Heym 0.0.90 and earlier. Broad Heym workflow-product context belongs upstream; this page owns the local LLM image-edit URL fetch and IPv6 egress-validation boundary.

NVD, the [GitHub advisory](https://github.com/heymrun/heym/security/advisories/GHSA-6rph-qqcv-jqh4), and [VulnCheck](https://www.vulncheck.com/advisories/heym-before-0.0.91-ssrf-via-image-fetching-and-ipv6-validation) describe two SSRF egress gaps. The LLM image-edit input loader fetched caller-controlled HTTP(S) URLs through bare `httpx.get` when workflow DSL expressions such as `imageInput: "$userInput.body.imageUrl"` let webhook or API callers choose the target. Separately, IPv6 transition forms such as NAT64, IPv4-compatible addresses, and 6to4 could carry loopback, RFC1918, link-local, or cloud-metadata IPv4 destinations past validation.

Affected boundary: Heym 0.0.90 and earlier, fixed in 0.0.91.

Exploit or incident status: public advisory disclosure; local sources do not record confirmed active exploitation.

Mitigation state: upgrade to 0.0.91 or later, where the image loader uses guarded URL fetching and the address classifier rejects or unwraps IPv6 transition forms.

Confidence: high for affected and fixed versions from NVD plus linked advisory evidence.

Residual risk: image-edit workflows turn model input handling into network egress; URL guards need caller-controlled media inputs, redirect handling, and address normalization coverage.

## Authoritative Sources

- [September 27 topic collector source](../../../raw/processed/2026-09-27/ai-security-wiki-topic-news-collector-2026-09-27T233044Z.json)
- [NVD CVE-2026-100863](https://nvd.nist.gov/vuln/detail/CVE-2026-100863)
- [GitHub advisory GHSA-6rph-qqcv-jqh4](https://github.com/heymrun/heym/security/advisories/GHSA-6rph-qqcv-jqh4)
- [VulnCheck advisory](https://www.vulncheck.com/advisories/heym-before-0.0.91-ssrf-via-image-fetching-and-ipv6-validation)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [Heym workflow node SSRF guards](heym-workflow-node-ssrf-guards.md)
- [agent network egress controls](agent-network-egress-controls.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-09-27 from the September 27 collector and NVD enrichment as a focused LLM image-fetch SSRF leaf.
