---
type: "Topic"
title: "PraisonAI SearxNG Search SSRF"
description: "Security analysis for CVE-2026-57143, where LLM-controlled SearxNG search URLs can drive PraisonAI server-side requests."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# PraisonAI SearxNG Search SSRF

## Current Understanding

The [October 13 topic collector source](../../../raw/processed/2026-10-13/ai-security-wiki-topic-news-collector-2026-10-13T232603Z.json) records [CVE-2026-57143](https://nvd.nist.gov/vuln/detail/CVE-2026-57143) for PraisonAI agents before 1.6.62. Broad PraisonAI framework context belongs upstream; this page owns the local prompt-injection to search-tool SSRF boundary.

The CVE evidence says the LLM-controlled `searxng_url` parameter from `searxng_search` and `search_web` flows directly to `requests.get` without scheme, host, port, or resolved-address validation. Prompt-injected content can steer the default search tool to internal JSON services, probe internal ports, and attempt cloud-metadata access, with returned JSON entering agent context.

## Security Impact

- Threat: prompt injection can transform a benign search tool into internal reconnaissance and credential exposure.
- Affected boundary: `praisonaiagents` before 1.6.62, SearxNG provider search tool URL handling, outbound HTTP destination controls, and returned JSON ingestion.
- Exploit or incident status: public CVE record; no confirmed exploitation incident is recorded locally.
- Mitigation state: update to 1.6.62 or later and enforce destination controls for model-controlled search provider URLs.
- Confidence: high for affected range and SSRF path from NVD/CVE evidence.
- Residual risk: this is distinct from older PraisonAI `web_crawl` SSRF leaves because it concerns search-provider URL selection.

## Control Implications

- Pin search providers through trusted configuration rather than model-controlled parameters.
- Validate scheme, host, port, redirects, and resolved IPs before every outbound search request.
- Prevent returned internal JSON from entering agent context without source and destination provenance.

## Authoritative Sources

- [October 13 topic collector source](../../../raw/processed/2026-10-13/ai-security-wiki-topic-news-collector-2026-10-13T232603Z.json)
- [NVD CVE-2026-57143](https://nvd.nist.gov/vuln/detail/CVE-2026-57143)
- [CVE Services CVE-2026-57143](https://cveawg.mitre.org/api/cve/CVE-2026-57143)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [PraisonAI web_crawl SSRF](praisonai-web-crawl-ssrf.md)

## Open Questions

- Which PraisonAI 1.6.62 fix proves SearxNG URLs are constrained across redirects and DNS resolution?

## Maintenance Notes

- Created on 2026-10-14 from the October 13 topic collector as a search-provider SSRF leaf distinct from previous PraisonAI web-crawl SSRF coverage.
