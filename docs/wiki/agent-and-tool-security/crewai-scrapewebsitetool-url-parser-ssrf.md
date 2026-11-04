---
type: "Topic"
title: "CrewAI ScrapeWebsiteTool URL-Parser SSRF"
description: "Security analysis for CVE-2026-120630 URL-validation and connected-peer mismatch."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# CrewAI ScrapeWebsiteTool URL-Parser SSRF

## Current Understanding

The [November 4 collector](../../../raw/processed/2026-11-04/ai-security-wiki-topic-news-collector-2026-11-04T002949Z.json) records [CVE-2026-120630](https://nvd.nist.gov/vuln/detail/CVE-2026-120630), publicly indexed November 2, for [CrewAI](../../../upstream-ai-wiki/agentic-frameworks/crewai.md) versions before 1.15.17. A mismatch between URL validation and the HTTP client can let attacker-controlled ScrapeWebsiteTool URLs reach internal services. The public [upstream remediation](https://github.com/crewAIInc/crewAI/pull/6981) validates the socket peer, rechecks it after connection, constrains redirects, and rejects proxy escape paths.

## Security Impact

- Threat: model- or user-directed URLs can cross into internal-network and cloud-metadata services despite parsing-time URL checks.
- Affected boundary: CrewAI before 1.15.17, ScrapeWebsiteTool safe request path, DNS/redirect handling, HTTP connection peer, and private-address policy.
- Exploit or incident status: public CVE disclosure; no confirmed in-the-wild exploitation is recorded locally.
- Mitigation state: upgrade to 1.15.17 or later; validate the connected peer IP after DNS resolution and connection, revalidate redirects, block private and link-local destinations, and prevent proxy bypass.
- Confidence and residual risk: medium-high for the remediation mechanics; final CNA/NVD affected-range, CVSS, and CWE metadata should be rechecked because the NVD page was unavailable to the collector.

## Authoritative Sources

- [November 4 collector source](../../../raw/processed/2026-11-04/ai-security-wiki-topic-news-collector-2026-11-04T002949Z.json)
- [NVD CVE-2026-120630](https://nvd.nist.gov/vuln/detail/CVE-2026-120630)
- [CVE indexing record](https://aisecwatch.com/issues/027b1325-ffc8-4b52-afbc-cbee2b40e446)
- [CrewAI remediation pull request](https://github.com/crewAIInc/crewAI/pull/6981)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [crewai-tools Selenium Scraping Private-Address SSRF](crewai-tools-selenium-scraping-private-address-ssrf.md)

## Open Questions

- Does the final CNA record confirm the same affected range and remediation release as the collector's public indexing evidence?

## Maintenance Notes

- Created on 2026-11-04; the August merged patch corroborates remediation mechanics but does not establish the November disclosure date.
