---
type: "Topic"
title: "mcp-webresearch Browser SSRF"
description: "Security analysis for CVE-2026-65056, where an LLM-steered browser tool can reach internal services."
---

# mcp-webresearch Browser SSRF

## Current Understanding

The [July 22 topic news collector source](../../../raw/processed/2026-07-22/ai-security-wiki-topic-news-collector-2026-07-22T193242-0400.json) records [CVE-2026-65056](https://nvd.nist.gov/vuln/detail/CVE-2026-65056) for mcp-webresearch. The vulnerable `visit_page` tool validates URL protocol but does not filter loopback, link-local, reserved, or cloud metadata address ranges before a server-side Playwright browser visits the target.

Prompt injection can steer the model-controlled URL argument and turn a browsing tool into server-side request forgery. The [July 23 leaf update watch source](../../../raw/processed/2026-07-23/ai-security-wiki-leaf-update-watch-2026-07-23T200300-0400.json) records NVD/CISA SSVC status as proof-of-concept exploitation, so this page classifies the issue as demonstrated research rather than only a disclosed vulnerability. The relevant local security boundary is the browser tool's network reachability and returned content, covered by [agent network egress controls](agent-network-egress-controls.md), not the broad mcp-webresearch catalog entry, which belongs upstream.

As of this run, [npm package metadata](https://www.npmjs.com/package/@mzxrai/mcp-webresearch) reports `@mzxrai/mcp-webresearch` latest and only latest version as 0.1.7, matching the affected version in the advisory; no fixed npm version was visible from the package metadata checked during ingest.

## Security Impact

- Threat: prompt injection steers an LLM-controlled browser URL into internal or metadata endpoints.
- Affected boundary: mcp-webresearch through 0.1.7, `visit_page`, server-side Playwright browser network access, and model context receiving fetched internal content.
- Exploit or incident status: public CVE and NVD record; CISA SSVC exploitation is recorded as proof-of-concept in the [July 23 watcher](../../../raw/processed/2026-07-23/ai-security-wiki-leaf-update-watch-2026-07-23T200300-0400.json).
- Mitigation state: no fixed npm version identified during ingest; durable guidance should prefer disabling or isolating the tool, blocking internal address space, and stripping sensitive responses from model context until a fixed version is confirmed.
- Confidence: high for the affected version and SSRF mechanics from the NVD-backed raw source; medium for remediation because package metadata showed no newer version.
- Residual risk: the upstream package or advisory may publish a fix after this ingest.

## Authoritative Sources

- [July 22 topic news collector source](../../../raw/processed/2026-07-22/ai-security-wiki-topic-news-collector-2026-07-22T193242-0400.json)
- [July 23 leaf update watch source](../../../raw/processed/2026-07-23/ai-security-wiki-leaf-update-watch-2026-07-23T200300-0400.json)
- NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-65056
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

- Added from the July 22, 2026 raw collector artifact and live npm metadata; enriched from the [July 23 leaf watcher](../../../raw/processed/2026-07-23/ai-security-wiki-leaf-update-watch-2026-07-23T200300-0400.json) with proof-of-concept exploitation status.
