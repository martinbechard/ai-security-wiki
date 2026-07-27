---
type: "Topic"
title: "mcp-webresearch Browser SSRF"
description: "Security analysis for CVE-2026-65056, where an LLM-steered browser tool can reach internal services."
---

# mcp-webresearch Browser SSRF

## Current Understanding

The [July 22 topic news collector source](../../../raw/processed/2026-07-22/ai-security-wiki-topic-news-collector-2026-07-22T193242-0400.json) records [CVE-2026-65056](https://nvd.nist.gov/vuln/detail/CVE-2026-65056) for mcp-webresearch. The vulnerable `visit_page` tool validates URL protocol but does not filter loopback, link-local, reserved, or cloud metadata address ranges before a server-side Playwright browser visits the target.

Prompt injection can steer the model-controlled URL argument and turn a browsing tool into server-side request forgery. The [July 24 leaf update watch source](../../../raw/processed/2026-07-24/ai-security-wiki-leaf-update-watch-2026-07-24T200235-0400.json) records [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-65056) and CISA SSVC status as proof-of-concept exploitation plus [Agora Intelligence](https://agora-intelligence.com/en/blog/leon-mcp-webresearch-ssrf-cve-2026) corroboration for metadata-service reachability, so this page classifies the issue as demonstrated research rather than only a disclosed vulnerability. The relevant local security boundary is the browser tool's network reachability and returned content, covered by [agent network egress controls](agent-network-egress-controls.md), not the broad mcp-webresearch catalog entry, which belongs upstream.

The [July 26 leaf update watch source](../../../raw/processed/2026-07-26/ai-security-wiki-leaf-update-watch-2026-07-26T200447-0400.json) adds [Vulners](https://vulners.com/cve/CVE-2026-65056) as another CVE aggregation source for the same affected-through-0.1.7 browser-tool SSRF boundary. It does not identify a fixed npm release.

As of this run, [npm package metadata](https://www.npmjs.com/package/@mzxrai/mcp-webresearch) reports `@mzxrai/mcp-webresearch` latest and only latest version as 0.1.7, matching the affected version in the [NVD advisory](https://nvd.nist.gov/vuln/detail/CVE-2026-65056); no fixed npm version was visible from the [package metadata](https://www.npmjs.com/package/@mzxrai/mcp-webresearch) checked during ingest.

## Security Impact

- Threat: prompt injection steers an LLM-controlled browser URL into internal or metadata endpoints.
- Affected boundary: mcp-webresearch through 0.1.7, `visit_page`, server-side Playwright browser network access, and model context receiving fetched internal content.
- Exploit or incident status: public CVE and [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-65056) record; CISA SSVC exploitation is recorded as proof-of-concept in the [July 23 watcher](../../../raw/processed/2026-07-23/ai-security-wiki-leaf-update-watch-2026-07-23T200300-0400.json).
- Mitigation state: no fixed [npm package metadata](https://www.npmjs.com/package/@mzxrai/mcp-webresearch) version identified during ingest; durable guidance should prefer disabling or isolating the tool, blocking internal address space, and stripping sensitive responses from model context until a fixed version is confirmed.
- Confidence: high for the affected version and SSRF mechanics from the [NVD](https://nvd.nist.gov/vuln/detail/CVE-2026-65056)-backed [July 22 topic news collector source](../../../raw/processed/2026-07-22/ai-security-wiki-topic-news-collector-2026-07-22T193242-0400.json); medium for remediation because [npm package metadata](https://www.npmjs.com/package/@mzxrai/mcp-webresearch) showed no newer version.
- Residual risk: the upstream package or [NVD advisory](https://nvd.nist.gov/vuln/detail/CVE-2026-65056) may publish a fix after this ingest.

## Authoritative Sources

- [July 22 topic news collector source](../../../raw/processed/2026-07-22/ai-security-wiki-topic-news-collector-2026-07-22T193242-0400.json)
- [July 23 leaf update watch source](../../../raw/processed/2026-07-23/ai-security-wiki-leaf-update-watch-2026-07-23T200300-0400.json)
- [July 24 leaf update watch source](../../../raw/processed/2026-07-24/ai-security-wiki-leaf-update-watch-2026-07-24T200235-0400.json)
- [July 26 leaf update watch source](../../../raw/processed/2026-07-26/ai-security-wiki-leaf-update-watch-2026-07-26T200447-0400.json)
- NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-65056
- Vulners CVE aggregation: https://vulners.com/cve/CVE-2026-65056
- Agora Intelligence corroboration: https://agora-intelligence.com/en/blog/leon-mcp-webresearch-ssrf-cve-2026
- VulnCheck: https://www.vulncheck.com/advisories/mcp-webresearch-server-side-request-forgery-in-visit-page-due-to-missing-internal-ip-filtering
- npm package metadata checked during ingest: https://www.npmjs.com/package/@mzxrai/mcp-webresearch

## Related Code

- Not yet identified.

## Related Tests

- Not yet identified.

## Related Backlog Items

- Not yet identified.

## Related Wiki Pages

- [agent and tool security](index.md)
- [agent network egress controls](agent-network-egress-controls.md)
- [data and privacy](../data-and-privacy/index.md)
- [identity and access](../identity-and-access/index.md)
- Upstream AI wiki owns broad MCP server catalog context.

## Open Questions

- Which release, commit, or advisory first fixes CVE-2026-65056?

## Maintenance Notes

- Added from the [July 22, 2026 raw collector artifact](../../../raw/processed/2026-07-22/ai-security-wiki-topic-news-collector-2026-07-22T193242-0400.json) and live [npm package metadata](https://www.npmjs.com/package/@mzxrai/mcp-webresearch); enriched from the [July 23 leaf watcher](../../../raw/processed/2026-07-23/ai-security-wiki-leaf-update-watch-2026-07-23T200300-0400.json), [July 24 leaf watcher](../../../raw/processed/2026-07-24/ai-security-wiki-leaf-update-watch-2026-07-24T200235-0400.json), and [July 26 leaf watcher](../../../raw/processed/2026-07-26/ai-security-wiki-leaf-update-watch-2026-07-26T200447-0400.json) with proof-of-concept exploitation and cloud-metadata reachability evidence.
