---
type: "Topic"
title: "crewai-tools Selenium Scraping Private-Address SSRF"
description: "Security analysis for CVE-2026-112308 private-address access through crewai-tools SeleniumScrapingTool."
tags: ["agent-and-tool-security", "data-and-privacy"]
---

# crewai-tools Selenium Scraping Private-Address SSRF

## Current Understanding

[CVE-2026-112308](https://nvd.nist.gov/vuln/detail/CVE-2026-112308) reports that [crewai-tools](../../../upstream-ai-wiki/agentic-frameworks/crewai.md) through 1.15.28 does not apply private-address validation in `SeleniumScrapingTool`. The [October 19 late collector](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T193149-0400.json) records that prompt-influenced tool input can direct headless Chrome to these destinations and disclose internal data or credentials:

- loopback services
- RFC1918 addresses
- cloud-metadata addresses

## Security Impact

- Threat: prompt-influenced browsing can fetch private services and cloud metadata.
- Affected boundary: crewai-tools through 1.15.28 `SeleniumScrapingTool` URL handling.
- Exploit or incident status: public CVE; active exploitation is not identified.
- Mitigation state: fixed version is not confirmed; resolve and block private destinations after redirects and DNS, and apply egress controls to browser workers.
- Confidence: high for the affected tool boundary; medium for remediation state.
- Residual risk: a headless browser has network reach distinct from the agent's textual tool policy.

## Authoritative Sources

- [October 19 late collector source](../../../raw/processed/2026-10-19/ai-security-wiki-topic-news-collector-2026-10-19T193149-0400.json)
- [CVE-2026-112308](https://nvd.nist.gov/vuln/detail/CVE-2026-112308)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [data and privacy](../data-and-privacy/index.md)

## Open Questions

- Which crewai-tools release applies destination validation to SeleniumScrapingTool?

## Maintenance Notes

- Created on 2026-10-20 from the October 19 late collector.
