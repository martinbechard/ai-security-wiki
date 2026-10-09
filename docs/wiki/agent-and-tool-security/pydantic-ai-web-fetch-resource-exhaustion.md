---
type: "Topic"
title: "Pydantic AI Web Fetch Resource Exhaustion"
description: "Security analysis for Pydantic AI local web_fetch and FileUrl resource-exhaustion vulnerabilities."
tags: ["agent-and-tool-security", "infrastructure-and-supply-chain"]
---

# Pydantic AI Web Fetch Resource Exhaustion

## Current Understanding

The [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json) records Pydantic AI disclosures where local fetching and conversion paths can consume excessive CPU, event-loop time, or memory. Broad framework coverage belongs upstream; this page owns the local tool availability and resource-control boundary for agent-directed web content.

[CVE-2026-107287](https://cveawg.mitre.org/api/cve/CVE-2026-107287) covers nested HTML conversion resource use. [CVE-2026-107290](https://cveawg.mitre.org/api/cve/CVE-2026-107290) covers quadratic title extraction blocking the event loop. [CVE-2026-107294](https://cveawg.mitre.org/api/cve/CVE-2026-107294) covers unbounded memory use when downloading remote content through `web_fetch` or `FileUrl`. Fixed versions vary: the October 8 CVE records cite 1.107.2/2.24.0, 1.107.6/2.44.0, and 1.107.7/2.52.0 depending on the path.

## Security Impact

- Threat: attacker-controlled or model-selected remote content can exhaust local worker memory, CPU, or event-loop capacity during agent fetch and conversion.
- Affected boundary: Pydantic AI and `pydantic-ai-slim`, local `web_fetch`, `web_fetch_tool`, `FileUrl`, HTML conversion, title extraction, and download buffering.
- Exploit or incident status: public CVE Services records and GitHub advisories; no confirmed exploitation incident is recorded locally.
- Mitigation state: update each deployed line at least to the fixed release for the used fetch path, and cap content size, conversion depth, timeout, and concurrent fetch work outside model control.
- Confidence: high for advisory identity and affected ranges; medium for deployment impact because some paths require local fetch features to be enabled.
- Residual risk: model-facing fetch tools need defense-in-depth quotas because parsing patches do not replace operator-controlled egress and resource budgets.

## Authoritative Sources

- [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json)
- [CVE-2026-107287 record](https://cveawg.mitre.org/api/cve/CVE-2026-107287)
- [GHSA-v36g-jcw9-x7cw](https://github.com/pydantic/pydantic-ai/security/advisories/GHSA-v36g-jcw9-x7cw)
- [CVE-2026-107290 record](https://cveawg.mitre.org/api/cve/CVE-2026-107290)
- [GHSA-fpf4-vwcp-v4hp](https://github.com/pydantic/pydantic-ai/security/advisories/GHSA-fpf4-vwcp-v4hp)
- [CVE-2026-107294 record](https://cveawg.mitre.org/api/cve/CVE-2026-107294)
- [GHSA-v2xh-2vp8-57h8](https://github.com/pydantic/pydantic-ai/security/advisories/GHSA-v2xh-2vp8-57h8)

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [Pydantic AI web fetch destination bypass](pydantic-ai-web-fetch-destination-bypass.md)
- [agent network egress controls](agent-network-egress-controls.md)
- Upstream AI wiki owns broad [Pydantic AI framework coverage](../../../upstream-ai-wiki/agentic-frameworks/pydantic-ai.md).

## Open Questions

- Which fetch paths remain available when applications install only `pydantic-ai-slim`, and do all fixed releases share the same resource caps?

## Maintenance Notes

- Created on 2026-10-09 from the [October 8 topic collector source](../../../raw/processed/2026-10-08/ai-security-wiki-topic-news-collector-2026-10-08T233132Z.json) as the Pydantic AI fetch availability leaf.
