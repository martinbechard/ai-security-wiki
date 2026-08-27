---
type: "Topic"
title: "PraisonAI web_crawl SSRF"
description: "Security analysis for CVE-2026-55525 redirect-following SSRF in PraisonAI web_crawl."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# PraisonAI web_crawl SSRF

## Current Understanding

The [August 26 leaf update watch source](../../../raw/processed/2026-08-26/ai-security-wiki-leaf-update-watch-20260827T000538Z.json) resolves CVE-2026-55525 to [GHSA-5r34-2g38-6569](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-5r34-2g38-6569), a redirect-following SSRF in `web_crawl` fixed in `praisonaiagents` 1.6.58. Broad PraisonAI framework context belongs upstream; this page owns the local agent retrieval and private-network egress boundary.

The issue is distinct from the PraisonAI MCP origin/session leaves because it concerns an agent web-crawling tool following attacker-controlled redirects into destinations that the original request policy should have excluded. It belongs near [agent network egress controls](agent-network-egress-controls.md), [mcp-fetch IPv6 SSRF](mcp-fetch-ipv6-ssrf.md), and [Dradis AI provider SSRF](dradis-ai-provider-ssrf.md): validate the final network destination, not only the first URL presented to an agent-facing tool.

## Security Impact

- Threat: an agent-controlled crawl target can redirect into internal, loopback, or metadata endpoints.
- Affected boundary: `praisonaiagents` before 1.6.58; `web_crawl`; redirect handling; private-network egress.
- Exploit or incident status: public CVE/GitHub advisory mapping; no local exploitation incident is recorded.
- Mitigation state: upgrade `praisonaiagents` to 1.6.58 or later and enforce final-destination egress policy after redirects.
- Confidence: high for mapping and fixed version from the August 26 watcher and GHSA evidence.
- Residual risk: retrieval and crawl tools remain SSRF-prone when redirects, DNS, and address normalization are not checked at the execution edge.

## Authoritative Sources

- [August 26 leaf update watch source](../../../raw/processed/2026-08-26/ai-security-wiki-leaf-update-watch-20260827T000538Z.json)
- [GHSA-5r34-2g38-6569](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-5r34-2g38-6569)
- [CVE-2026-55525 record](https://cveawg.mitre.org/api/cve/CVE-2026-55525)
- [PraisonAI 4.6.58 release](https://github.com/MervinPraison/PraisonAI/releases/tag/v4.6.58)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent network egress controls](agent-network-egress-controls.md)
- [mcp-fetch IPv6 SSRF](mcp-fetch-ipv6-ssrf.md)
- [Dradis AI provider SSRF](dradis-ai-provider-ssrf.md)

## Open Questions

- No open wiki questions are recorded for this topic.

## Maintenance Notes

- Created on 2026-08-27 from the [August 26 leaf watcher](../../../raw/processed/2026-08-26/ai-security-wiki-leaf-update-watch-20260827T000538Z.json) after verifier correction split resolved PraisonAI advisory mappings into focused leaves.
