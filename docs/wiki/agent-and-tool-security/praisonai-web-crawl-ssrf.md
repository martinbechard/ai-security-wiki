---
type: "Topic"
title: "PraisonAI web_crawl SSRF"
description: "Security analysis for CVE-2026-55525 redirect-following SSRF in PraisonAI web_crawl."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# PraisonAI web_crawl SSRF

## Current Understanding

CVE-2026-55525 maps to [GHSA-5r34-2g38-6569](https://github.com/MervinPraison/PraisonAI/security/advisories/GHSA-5r34-2g38-6569) and affects `praisonaiagents` before 1.6.58. Broad PraisonAI framework context belongs upstream; this page owns the local agent retrieval and private-network egress boundary. The [August 26 leaf update watch source](../../../raw/processed/2026-08-26/ai-security-wiki-leaf-update-watch-20260827T000538Z.json) and [August 27 leaf update watch source](../../../raw/processed/2026-08-27/ai-security-wiki-leaf-update-watch-20260828T000238Z.json) provide the current evidence.

The issue is distinct from the PraisonAI MCP origin/session leaves because it concerns an agent web-crawling tool following attacker-controlled redirects into destinations that the original request policy should have excluded. The exploit path is:

- `web_crawl` validates only the initial URL before `_crawl_with_httpx` uses `httpx.Client(follow_redirects=True)`.
- Redirect targets are not revalidated, so an attacker-controlled public URL can redirect to loopback, private-network, or cloud metadata services while `ALLOW_LOCAL_CRAWL` remains disabled.
- The fetched internal response is returned to agent context.

It belongs near [agent network egress controls](agent-network-egress-controls.md), [mcp-fetch IPv6 SSRF](mcp-fetch-ipv6-ssrf.md), and [Dradis AI provider SSRF](dradis-ai-provider-ssrf.md): validate the final network destination, not only the first URL presented to an agent-facing tool.

## Security Impact

- Threat: an agent-controlled crawl target can redirect into internal, loopback, or metadata endpoints.
- Affected boundary: `praisonaiagents` before 1.6.58; `web_crawl`; redirect handling; private-network egress.
- Exploit or incident status: public CVE/GitHub advisory mapping; no local exploitation incident is recorded.
- Mitigation state: upgrade `praisonaiagents` to 1.6.58 or later and enforce final-destination egress policy after redirects.
- Confidence: high for mapping and fixed version from the August 26 watcher and GHSA evidence.
- Residual risk: retrieval and crawl tools remain SSRF-prone when redirects, DNS, and address normalization are not checked at the execution edge.

## Authoritative Sources

- [August 27 leaf update watch source](../../../raw/processed/2026-08-27/ai-security-wiki-leaf-update-watch-20260828T000238Z.json)
- [CVE-2026-55525 CVE JSON](https://cveawg.mitre.org/api/cve/CVE-2026-55525)
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

- Updated on 2026-08-28 with August 27 leaf-update evidence for CVE-2026-55525.
- Created on 2026-08-27 from the [August 26 leaf watcher](../../../raw/processed/2026-08-26/ai-security-wiki-leaf-update-watch-20260827T000538Z.json) after verifier correction split resolved PraisonAI advisory mappings into focused leaves.
